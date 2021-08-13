import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';

import 'package:domain_objects/entities.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/core/home/pages/home_page.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:user_feed/user_feed.dart' as feed_obj;
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_graphql_client/graph_sqlite.dart';
import 'package:shared_ui_components/inputs.dart';

import 'base64_image.dart';

/// For a little bit more context on the concept of `Mocking`, take a look at
/// [this stack overflow question](https://stackoverflow.com/a/40244095/6322723)
///

class MockHttpClientIO extends Mock implements io.HttpClient {}

class MockHttpClientRequest extends Mock implements io.HttpClientRequest {}

class MockHttpClientResponse extends Mock implements io.HttpClientResponse {}

class MockHttpHeaders extends Mock implements io.HttpHeaders {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockBuildContext extends Mock implements BuildContext {}

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {
  @override
  Future<void> logEvent(
      {required String name, Map<String, Object?>? parameters}) {
    return Future<void>.value();
  }
}

const String mockImagePath = './image.jpg';

class MockFormState extends Mock implements FormState {
  MockFormState({required this.validation});

  final bool validation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return super.toString();
  }

  @override
  Form get widget {
    return const Form(
      child: SILFormTextField(),
    );
  }

  @override
  bool validate() {
    return validation;
  }
}

// ignore: must_be_immutable
class GlobalKeyMock extends Mock implements GlobalKey<MockFormState> {
  GlobalKeyMock({this.mockFormState});

  final MockFormState? mockFormState;

  @override
  MockFormState? get currentState {
    return mockFormState;
  }
}

class MockImagePickerPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements ImagePickerPlatform {
  @override
  Future<XFile?> getImage({
    required ImageSource source,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) {
    return Future<XFile>.value(XFile(mockImagePath));
  }
}

class MockPermissionHandlerPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements PermissionHandlerPlatform {
  MockPermissionHandlerPlatform({bool? denied}) : this.denied = denied ?? false;

  final bool denied;

  int _permissionRequests = 0;

  @override
  Future<PermissionStatus> checkPermissionStatus(Permission permission) {
    if (denied) {
      return Future<PermissionStatus>.value(PermissionStatus.denied);
    }

    return Future<PermissionStatus>.value(PermissionStatus.granted);
  }

  @override
  Future<ServiceStatus> checkServiceStatus(Permission permission) =>
      Future<ServiceStatus>.value(ServiceStatus.enabled);

  @override
  Future<bool> openAppSettings() => Future<bool>.value(true);

  @override
  Future<Map<Permission, PermissionStatus>> requestPermissions(
      List<Permission> permissions) {
    _permissionRequests++;
    final Map<Permission, PermissionStatus> permissionsMap =
        <Permission, PermissionStatus>{};
    return Future<Map<Permission, PermissionStatus>>.value(permissionsMap);
  }

  @override
  Future<bool> shouldShowRequestPermissionRationale(Permission? permission) {
    return super.noSuchMethod(
      Invocation.method(
        #shouldShowPermissionRationale,
        <Permission?>[permission],
      ),
      returnValue: Future<bool>.value(true),
    ) as Future<bool>;
  }

  int get permissionRequests => _permissionRequests;
}

typedef OnObservation = void Function(
    Route<dynamic>? route, Route<dynamic>? previousRoute);

class TestNavigatorObserver extends NavigatorObserver {
  TestNavigatorObserver({this.onPop, this.onPush});

  final OnObservation? onPop;
  final OnObservation? onPush;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      onPop?.call(route, previousRoute);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPush?.call(route, previousRoute);
  }
}

final MockGraphQlClient mockGraphQlClient = MockGraphQlClient.withResponse(
    'idToken', 'endpoint', http.Response('success response', 200));

final MockGraphQlClient mockGraphQlClientWithErrorResponse =
    MockGraphQlClient.withResponse(
        'idToken', 'endpoint', http.Response('not found', 400));

final Route<dynamic> testRoute =
    MaterialPageRoute<dynamic>(builder: (_) => HomePage());

class MockDeviceCapabilities extends IDeviceCapabilities {}

final MockDeviceCapabilities deviceCapabilities = MockDeviceCapabilities();

// class MockConnectivityStatus extends Mock implements ConnectivityStatus {}

/// Please refer to:
///
///  https://developer.android.com/training/multiscreen/screendensities#dips-pels
const Size typicalPhoneScreenSizePortrait = Size(320, 480);
const Size typicalPhoneScreenSizeLandscape = Size(480, 320);

/// Please refer to:
///  https://developer.android.com/training/multiscreen/screendensities#dips-pels
const Size mediumSizedTabletPortrait = Size(600, 1024);
const Size mediumSizedTabletLandscape = Size(1024, 600);

const Size tabletPortrait = Size(720, 1280);
const Size tabletLandscape = Size(1280, 720);

class MockStateDB extends Mock implements Database {
  @override
  Batch batch() {
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<int> delete(String table, {String? where, List<Object?>? whereArgs}) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeMethod<T>(String method, [dynamic arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeSqlMethod<T>(String method, String sql,
      [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<void> execute(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> getVersion() {
    throw UnimplementedError();
  }

  @override
  Future<int> insert(String table, Map<String, Object?> values,
      {String? nullColumnHack, ConflictAlgorithm? conflictAlgorithm}) {
    throw UnimplementedError();
  }

  @override
  bool get isOpen => true;

  @override
  String get path => 'test';

  @override
  Future<List<Map<String, Object?>>> query(String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawDelete(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawInsert(String sql, [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawInsert, <dynamic>[sql, arguments]),
        returnValue: Future<int>.value(10),
      ) as Future<int>;

  @override
  Future<List<Map<String, Object?>>> rawQuery(String sql,
          [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawQuery, <dynamic>[sql, arguments]),
        returnValue: Future<List<Map<String, Object?>>>.value(
          <Map<String, Object?>>[
            <String, Object?>{'miscState': 10}
          ],
        ),
      ) as Future<List<Map<String, Object?>>>;

  @override
  Future<int> rawUpdate(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<void> setVersion(int version) {
    throw UnimplementedError();
  }

  @override
  Future<T> transaction<T>(Future<T> Function(Transaction txn) action,
      {bool? exclusive}) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(String table, Map<String, Object?> values,
      {String? where,
      List<Object?>? whereArgs,
      ConflictAlgorithm? conflictAlgorithm}) {
    throw UnimplementedError();
  }
}

/// a short client for providing custom responses
///
/// a good use case is when you want to return error responses
class MockShortGraphQlClient extends IGraphQlClient {
  MockShortGraphQlClient.withResponse(
      String idToken, String endpoint, this.response) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  final http.Response response;

  @override
  Future<http.Response> callRESTAPI(
      {required String endpoint,
      required String method,
      Map<String, dynamic>? variables}) {
    return Future<http.Response>.value(response);
  }

  @override
  Future<http.Response> query(
      String queryString, Map<String, dynamic> variables,
      [ContentType contentType = ContentType.json]) {
    return Future<http.Response>.value(response);
  }
}

class MockGraphQlClient extends IGraphQlClient {
  MockGraphQlClient();

  MockGraphQlClient.withResponse(
    String idToken,
    String endpoint,
    this.response,
  ) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  late final http.Response response;

  @override
  Future<http.Response> callRESTAPI(
      {required String endpoint,
      required String method,
      Map<String, dynamic>? variables}) {
    if (endpoint.contains('upload')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'id': '1r1idoAs54kbZ90l9KkHSK7GKva',
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('login_by_phone')) {
      return Future<http.Response>.value(
        http.Response(json.encode(mockAuthLoginResponse), 201),
      );
    }

    return Future<http.Response>.value(
      http.Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              // add your data here
            }
          },
        ),
        201,
      ),
    );
  }

  @override
  Future<http.Response> query(
      String queryString, Map<String, dynamic> variables,
      [ContentType contentType = ContentType.json]) async {
    final String otpVariables = json.encode(<String, dynamic>{
      'msisdn': '+254717356476',
      'email': 'abiud.orina@savannahinformatics.com'
    });
    final String errorOtpVariables = json.encode(<String, dynamic>{
      'msisdn': '+254717356477',
      'email': 'abiud.orina@savannahinformatics.com'
    });

    if (variables['phonenumber'] == '+254712345678') {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                // add your data here
                'otp': '1234'
              }
            }),
            201),
      );
    }

    if (json.encode(variables) == otpVariables) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'generateAndEmailOTP': '123456'}
            }),
            201),
      );
    }

    if (json.encode(variables) == errorOtpVariables) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'Error': 'this is a sample error with an ID token'
            }),
            201),
      );
    }

    if (queryString.contains('updateUserProfile')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'updateUserProfile': <String, dynamic>{
                  'userBioData': <String, String>{
                    'firstName': 'Test',
                    'lastName': 'Name'
                  }
                },
              }
            }),
            201),
      );
    }
    if (queryString.contains('searchFHIRObservation')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'searchFHIRObservation': <String, dynamic>{
                  'edges': <dynamic>[
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': '4430faf1-8d82-4de2-8eda-bbb380b3bede',
                        'Status': 'preliminary',
                        'Code': <String, dynamic>{
                          'Text': 'Heart Rate',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'Display': 'Heart Rate',
                              'Code': '8867-4',
                              'System': 'http://loinc.org',
                              'UserSelected': true
                            }
                          ]
                        },
                        'ValueQuantity': <String, dynamic>{
                          'Value': 90,
                          'Unit': '/min',
                          'System': 'http://unitsofmeasure.org',
                          'Code': '/min'
                        },
                        'ReferenceRange': <dynamic>[
                          <String, dynamic>{
                            'Text': '0/min to 300/min',
                            'Low': <String, dynamic>{
                              'Value': 0,
                              'Unit': '/min',
                              'System': 'http://unitsofmeasure.org',
                              'Code': 'min'
                            },
                            'High': <String, dynamic>{
                              'Value': 300,
                              'Unit': '/min',
                              'System': 'http://unitsofmeasure.org',
                              'Code': '/min'
                            },
                            'Type': <String, dynamic>{
                              'Text': 'Normal Range',
                              'Coding': <dynamic>[
                                <String, dynamic>{
                                  'Code': 'normal',
                                  'UserSelected': false,
                                  'System':
                                      'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                                  'Display': 'Normal Range'
                                }
                              ]
                            }
                          }
                        ],
                        'Interpretation': <dynamic>[
                          <String, dynamic>{
                            'Text': 'NOMAL',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Display': 'NORMAL',
                                'Code': 'N',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Category': <dynamic>[
                          <String, dynamic>{
                            'Text': 'Vital Signs',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Code': 'vital-signs',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/observation-category',
                                'Display': 'Vital Signs',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Issued': '2020-12-22T18:32:07.052015Z',
                        'EffectiveInstant': '2020-12-22T18:32:07.052015Z',
                        'Subject': <String, dynamic>{
                          'Reference':
                              'Patient/68f7edf0-44fa-4d4d-970c-79eb6069908b',
                          'Type': 'Patient',
                          'Display': 'kiara, natasha '
                        },
                        'Encounter': <String, dynamic>{
                          'Reference':
                              'Encounter/e3af8ce5-8c75-45d9-a05f-03b9a3f57e04',
                          'Type': 'Encounter',
                          'Display': ''
                        }
                      }
                    },
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': '15439cc6-6164-40f3-aaed-a3ac0f9808f9',
                        'Status': 'preliminary',
                        'Code': <String, dynamic>{
                          'Text': 'Diastolic Blood Pressure',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'Display': 'Diastolic Blood Pressure',
                              'Code': '8462-4',
                              'System': 'http://loinc.org',
                              'UserSelected': true
                            }
                          ]
                        },
                        'ValueQuantity': <String, dynamic>{
                          'Value': 50,
                          'Unit': 'mm[Hg]',
                          'System': 'http://unitsofmeasure.org',
                          'Code': 'mm[Hg]'
                        },
                        'ReferenceRange': <dynamic>[
                          <String, dynamic>{
                            'Text': '0mm[Hg] to 300mm[Hg]',
                            'Low': <String, dynamic>{
                              'Value': 0,
                              'Unit': 'mm[Hg]',
                              'System': 'http://unitsofmeasure.org',
                              'Code': 'mm[Hg]'
                            },
                            'High': <String, dynamic>{
                              'Value': 300,
                              'Unit': 'mm[Hg]',
                              'System': 'http://unitsofmeasure.org',
                              'Code': 'mm[Hg]'
                            },
                            'Type': <String, dynamic>{
                              'Text': 'Normal Range',
                              'Coding': <dynamic>[
                                <String, dynamic>{
                                  'Code': 'normal',
                                  'UserSelected': false,
                                  'System':
                                      'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                                  'Display': 'Normal Range'
                                }
                              ]
                            }
                          }
                        ],
                        'Interpretation': <dynamic>[
                          <String, dynamic>{
                            'Text': 'NORMAL',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Display': 'NORMAL',
                                'Code': 'N',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Category': <dynamic>[
                          <String, dynamic>{
                            'Text': 'Vital Signs',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Code': 'vital-signs',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/observation-category',
                                'Display': 'Vital Signs',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Issued': '2021-02-03T12:39:38.568032Z',
                        'EffectiveInstant': '2021-02-03T12:39:38.568032Z',
                        'Subject': <String, dynamic>{
                          'Reference':
                              'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                          'Type': 'Patient',
                          'Display': 'Doe, John '
                        },
                        'Encounter': <String, dynamic>{
                          'Reference':
                              'Encounter/229b7a39-c437-43c7-bbfc-dfb88800ee1f',
                          'Type': 'Encounter',
                          'Display': ''
                        }
                      }
                    },
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': '1efccce7-9e7e-4d19-850b-de00ed0b4d6f',
                        'Status': 'preliminary',
                        'Code': <String, dynamic>{
                          'Text': 'Systolic Blood Pressure',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'Display': 'Systolic Blood Pressure',
                              'Code': '8480-6',
                              'System': 'http://loinc.org',
                              'UserSelected': true
                            }
                          ]
                        },
                        'ValueQuantity': <String, dynamic>{
                          'Value': 90,
                          'Unit': 'mm[Hg]',
                          'System': 'http://unitsofmeasure.org',
                          'Code': 'mm[Hg]'
                        },
                        'ReferenceRange': <dynamic>[
                          <String, dynamic>{
                            'Text': '0mm[Hg] to 300mm[Hg]',
                            'Low': <String, dynamic>{
                              'Value': 0,
                              'Unit': 'mm[Hg]',
                              'System': 'http://unitsofmeasure.org',
                              'Code': 'mm[Hg]'
                            },
                            'High': <String, dynamic>{
                              'Value': 300,
                              'Unit': 'mm[Hg]',
                              'System': 'http://unitsofmeasure.org',
                              'Code': 'mm[Hg]'
                            },
                            'Type': <String, dynamic>{
                              'Text': 'Normal Range',
                              'Coding': <dynamic>[
                                <String, dynamic>{
                                  'Code': 'normal',
                                  'UserSelected': false,
                                  'System':
                                      'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                                  'Display': 'Normal Range'
                                }
                              ]
                            }
                          }
                        ],
                        'Interpretation': <dynamic>[
                          <String, dynamic>{
                            'Text': 'NORMAL',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Display': 'NORMAL',
                                'Code': 'N',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Category': <dynamic>[
                          <String, dynamic>{
                            'Text': 'Vital Signs',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Code': 'vital-signs',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/observation-category',
                                'Display': 'Vital Signs',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Issued': '2021-02-03T12:39:38.568032Z',
                        'EffectiveInstant': '2021-02-03T12:39:38.568032Z',
                        'Subject': <String, dynamic>{
                          'Reference':
                              'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                          'Type': 'Patient',
                          'Display': 'Doe, John '
                        },
                        'Encounter': <String, dynamic>{
                          'Reference':
                              'Encounter/229b7a39-c437-43c7-bbfc-dfb88800ee1f',
                          'Type': 'Encounter',
                          'Display': ''
                        }
                      }
                    },
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': '1f43a1e0-06ee-4571-8196-2ebb03a24961',
                        'Status': 'preliminary',
                        'Code': <String, dynamic>{
                          'Text': 'Respiratory Rate',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'Display': 'Respiratory Rate',
                              'Code': '9279-1',
                              'System': 'http://loinc.org',
                              'UserSelected': true
                            }
                          ]
                        },
                        'ValueQuantity': <String, dynamic>{
                          'Value': 72,
                          'Unit': '/min',
                          'System': 'http://unitsofmeasure.org',
                          'Code': '/min'
                        },
                        'ReferenceRange': <dynamic>[
                          <String, dynamic>{
                            'Text': '0/min to 300/min',
                            'Low': <String, dynamic>{
                              'Value': 0,
                              'Unit': '/min',
                              'System': 'http://unitsofmeasure.org',
                              'Code': 'min'
                            },
                            'High': <String, dynamic>{
                              'Value': 300,
                              'Unit': '/min',
                              'System': 'http://unitsofmeasure.org',
                              'Code': '/min'
                            },
                            'Type': <String, dynamic>{
                              'Text': 'Normal Range',
                              'Coding': <dynamic>[
                                <String, dynamic>{
                                  'Code': 'normal',
                                  'UserSelected': false,
                                  'System':
                                      'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                                  'Display': 'Normal Range'
                                }
                              ]
                            }
                          }
                        ],
                        'Interpretation': <dynamic>[
                          <String, dynamic>{
                            'Text': 'HIGH',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Display': 'HIGH',
                                'Code': 'H',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Category': <dynamic>[
                          <String, dynamic>{
                            'Text': 'Vital Signs',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Code': 'vital-signs',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/observation-category',
                                'Display': 'Vital Signs',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Issued': '2021-01-27T09:38:28.262536Z',
                        'EffectiveInstant': '2021-01-27T09:38:28.262536Z',
                        'Subject': <String, dynamic>{
                          'Reference':
                              'Patient/6fb889bf-a5f1-4ef3-ab1e-6f9d467c4fc9',
                          'Type': 'Patient',
                          'Display': 'Shikami, Will '
                        },
                        'Encounter': <String, dynamic>{
                          'Reference':
                              'Encounter/458ac85b-869f-4821-8c8d-9a0a4a88a95b',
                          'Type': 'Encounter',
                          'Display': ''
                        }
                      }
                    },
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': 'c45a2453-d4c5-4b78-9ba4-e7cae8efffe5',
                        'Status': 'preliminary',
                        'Code': <String, dynamic>{
                          'Text': 'Oxygen Saturation',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'Display': 'Oxygen Saturation',
                              'Code': '2708-6',
                              'System': 'http://loinc.org',
                              'UserSelected': false
                            }
                          ]
                        },
                        'ValueQuantity': <String, dynamic>{
                          'Value': 90,
                          'Unit': '%',
                          'System': 'http://unitsofmeasure.org',
                          'Code': '%'
                        },
                        'ReferenceRange': <dynamic>[
                          <String, dynamic>{
                            'Text': '88% to 92%',
                            'Low': <String, dynamic>{
                              'Value': 87,
                              'Unit': '%',
                              'System': 'http://unitsofmeasure.org',
                              'Code': '%'
                            },
                            'High': <String, dynamic>{
                              'Value': 93,
                              'Unit': '%',
                              'System': 'http://unitsofmeasure.org',
                              'Code': '%'
                            },
                            'Type': <String, dynamic>{
                              'Text': 'Normal Range',
                              'Coding': <dynamic>[
                                <String, dynamic>{
                                  'Code': 'normal',
                                  'UserSelected': false,
                                  'System':
                                      'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                                  'Display': 'Normal Range'
                                }
                              ]
                            }
                          }
                        ],
                        'Interpretation': <dynamic>[
                          <String, dynamic>{
                            'Text': 'NORMAL',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Display': 'NORMAL',
                                'Code': 'N',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Category': <dynamic>[
                          <String, dynamic>{
                            'Text': 'Vital Signs',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Code': 'vital-signs',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/observation-category',
                                'Display': 'Vital Signs',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Issued': '2021-01-25T16:00:07.485167Z',
                        'EffectiveInstant': '2021-01-25T16:00:07.485167Z',
                        'Subject': <String, dynamic>{
                          'Reference':
                              'Patient/6fb889bf-a5f1-4ef3-ab1e-6f9d467c4fc9',
                          'Type': 'Patient',
                          'Display': 'Shikami, Will '
                        },
                        'Encounter': <String, dynamic>{
                          'Reference':
                              'Encounter/33a3f330-a998-487a-aaf7-f04e5e41860e',
                          'Type': 'Encounter',
                          'Display': ''
                        }
                      }
                    },
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': '67430c84-a969-4824-b0ac-344e17919565',
                        'Status': 'preliminary',
                        'Code': <String, dynamic>{
                          'Text': 'Body Mass Index',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'Display': 'Body Mass Index',
                              'Code': '39156-5',
                              'System': 'http://loinc.org',
                              'UserSelected': true
                            }
                          ]
                        },
                        'ValueQuantity': <String, dynamic>{
                          'Value': 24.7,
                          'Unit': 'kg/m2',
                          'System': 'http://unitsofmeasure.org',
                          'Code': 'kg/m2'
                        },
                        'ReferenceRange': <dynamic>[
                          <String, dynamic>{
                            'Text': '18.5kg/m2 to 24.9kg/m2',
                            'Low': <String, dynamic>{
                              'Value': 18.4,
                              'Unit': 'kg/m2',
                              'System': 'http://unitsofmeasure.org',
                              'Code': 'kg/m2'
                            },
                            'High': <String, dynamic>{
                              'Value': 25,
                              'Unit': 'kg/m2',
                              'System': 'http://unitsofmeasure.org',
                              'Code': 'kg/m2'
                            },
                            'Type': <String, dynamic>{
                              'Text': 'Normal Range',
                              'Coding': <dynamic>[
                                <String, dynamic>{
                                  'Code': 'normal',
                                  'UserSelected': false,
                                  'System':
                                      'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                                  'Display': 'Normal Range'
                                }
                              ]
                            }
                          }
                        ],
                        'Interpretation': <dynamic>[
                          <String, dynamic>{
                            'Text': 'NORMAL',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Display': 'NORMAL',
                                'Code': 'N',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Category': <dynamic>[
                          <String, dynamic>{
                            'Text': 'Vital Signs',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Code': 'vital-signs',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/observation-category',
                                'Display': 'Vital Signs',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Issued': '2021-01-25T15:59:48.495962Z',
                        'EffectiveInstant': '2021-01-25T15:59:48.495962Z',
                        'Subject': <String, dynamic>{
                          'Reference':
                              'Patient/6fb889bf-a5f1-4ef3-ab1e-6f9d467c4fc9',
                          'Type': 'Patient',
                          'Display': 'Shikami, Will '
                        },
                        'Encounter': <String, dynamic>{
                          'Reference':
                              'Encounter/33a3f330-a998-487a-aaf7-f04e5e41860e',
                          'Type': 'Encounter',
                          'Display': ''
                        }
                      }
                    },
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': 'c3db5dc6-b17b-4ab6-951b-a90b79489803',
                        'Status': 'preliminary',
                        'Code': <String, dynamic>{
                          'Text': 'Body Temperature',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'Display': 'Body Temperature',
                              'Code': '8310-5',
                              'System': 'http://loinc.org',
                              'UserSelected': true
                            }
                          ]
                        },
                        'ValueQuantity': <String, dynamic>{
                          'Value': 37,
                          'Unit': 'Cel',
                          'System': 'http://unitsofmeasure.org',
                          'Code': 'Cel'
                        },
                        'ReferenceRange': <dynamic>[
                          <String, dynamic>{
                            'Text': '0Cel to 300Cel',
                            'Low': <String, dynamic>{
                              'Value': 0,
                              'Unit': 'Cel',
                              'System': 'http://unitsofmeasure.org',
                              'Code': 'Cel'
                            },
                            'High': <String, dynamic>{
                              'Value': 300,
                              'Unit': 'Cel',
                              'System': 'http://unitsofmeasure.org',
                              'Code': 'Cel'
                            },
                            'Type': <String, dynamic>{
                              'Text': 'Normal Range',
                              'Coding': <dynamic>[
                                <String, dynamic>{
                                  'Code': 'normal',
                                  'UserSelected': false,
                                  'System':
                                      'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                                  'Display': 'Normal Range'
                                }
                              ]
                            }
                          }
                        ],
                        'Interpretation': <dynamic>[
                          <String, dynamic>{
                            'Text': 'NORMAL',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Display': 'NORMAL',
                                'Code': 'N',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Category': <dynamic>[
                          <String, dynamic>{
                            'Text': 'Vital Signs',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Code': 'vital-signs',
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/observation-category',
                                'Display': 'Vital Signs',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Issued': '2021-01-25T15:59:24.841651Z',
                        'EffectiveInstant': '2021-01-25T15:59:24.841651Z',
                        'Subject': <String, dynamic>{
                          'Reference':
                              'Patient/6fb889bf-a5f1-4ef3-ab1e-6f9d467c4fc9',
                          'Type': 'Patient',
                          'Display': 'Shikami, Will '
                        },
                        'Encounter': <String, dynamic>{
                          'Reference':
                              'Encounter/33a3f330-a998-487a-aaf7-f04e5e41860e',
                          'Type': 'Encounter',
                          'Display': ''
                        }
                      }
                    },
                  ]
                }
              },
            }),
            201),
      );
    }
    if (queryString.contains(searchCompositionQuery)) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'searchFHIRComposition': <String, dynamic>{
                  'edges': <dynamic>[
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': '01d83c04-4fcd-4a59-8bb5-b7a264eda8f8',
                        'Status': 'preliminary',
                        'Type': <String, dynamic>{
                          'Text': 'Consult Note',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'System': 'http://loinc.org',
                              'Code': '11488-4',
                              'Display': 'Consult Note',
                              'UserSelected': false
                            }
                          ]
                        },
                        'Category': <dynamic>[
                          <String, dynamic>{
                            'Text': 'Consult Note',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System': 'http://loinc.org',
                                'Code': '11488-4',
                                'Display': 'Consult Note',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Author': <dynamic>[
                          <String, dynamic>{
                            'Reference': null,
                            'Display': 'Natasha Kiara'
                          }
                        ],
                        'Title': 'patient-history',
                        'Section': <dynamic>[
                          <String, dynamic>{
                            'Title': 'patientHistory',
                            'Text': <String, dynamic>{
                              'Status': 'generated',
                              'Div': json.encode(patientHistoryJSON)
                            }
                          }
                        ]
                      }
                    },
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': 'bdf4d884-f312-43e5-a512-1d8dcaa64114',
                        'Status': 'preliminary',
                        'Type': <String, dynamic>{
                          'Text': 'Consult Note',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'System': 'http://loinc.org',
                              'Code': '11488-4',
                              'Display': 'Consult Note',
                              'UserSelected': false
                            }
                          ]
                        },
                        'Category': <dynamic>[
                          <String, dynamic>{
                            'Text': 'Consult Note',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System': 'http://loinc.org',
                                'Code': '11488-4',
                                'Display': 'Consult Note',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Author': <dynamic>[
                          <String, dynamic>{
                            'Reference': null,
                            'Display': 'Abiud Orina'
                          }
                        ],
                        'Title': 'review-of-systems',
                        'Section': <dynamic>[
                          <String, dynamic>{
                            'Title': 'respiratory',
                            'Text': <String, dynamic>{
                              'Status': 'generated',
                              'Div': json.encode(reviewOfSystemRespiratoryJson)
                            }
                          }
                        ]
                      }
                    },
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': 'f50e702a-963b-4825-82a3-f8746ee0e893',
                        'Status': 'preliminary',
                        'Type': <String, dynamic>{
                          'Text': 'Consult Note',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'System': 'http://loinc.org',
                              'Code': '11488-4',
                              'Display': 'Consult Note',
                              'UserSelected': false
                            }
                          ]
                        },
                        'Category': <dynamic>[
                          <String, dynamic>{
                            'Text': 'Consult Note',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System': 'http://loinc.org',
                                'Code': '11488-4',
                                'Display': 'Consult Note',
                                'UserSelected': false
                              }
                            ]
                          }
                        ],
                        'Author': <dynamic>[
                          <String, dynamic>{
                            'Reference': null,
                            'Display': 'Abiud Orina'
                          }
                        ],
                        'Title': 'general-examination',
                        'Section': <dynamic>[
                          <String, dynamic>{
                            'Title': 'generalExam',
                            'Text': <String, dynamic>{
                              'Status': 'generated',
                              'Div': json.encode(genExamJSON)
                            }
                          }
                        ]
                      }
                    },
                  ]
                }
              },
            }),
            201),
      );
    }

    if (queryString.contains('hc_submit_dialog_data')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'loading': true,
              'data': <String, dynamic>{}
            }),
            201),
      );
    }

    if (queryString.contains('verifyMember')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'verifyMember': true},
            }),
            201),
      );
    }

    if (queryString.contains('verifyEmailOTP')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'verifyEmailOTP': <String, String>{
                  'email': 'demo@gmail.com',
                  'otp': '123456'
                }
              },
            }),
            201),
      );
    }

    if (queryString.contains('recordPostVisitSurvey')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'recordPostVisitSurvey': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains('generateRetryOTP')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'generateRetryOTP': '123456'}
          }),
          201));
    }

    if (queryString.contains('deleteFHIRMedicationRequest')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, bool>{
              'deleteFHIRMedicationRequest': true,
            }
          }),
          201,
        ),
      );
    }
    if (queryString.contains('endEncounter')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, bool>{'endEncounter': true}
          }),
          201));
    }

    if (queryString.contains('emailVerificationOTP')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, String>{'emailVerificationOTP': '123456'}
          }),
          201));
    }
    if (queryString.contains('generateAndEmailOTP')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, String>{'generateAndEmailOTP': '123456'}
          }),
          201));
    }

    if (queryString.contains('endEncounter')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, bool>{'endEncounter': true}
          }),
          201));
    }

    if (queryString.contains('problemSummary')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'problemSummary': <String>[
                'Ciguatera fish poisoning',
                'Sea Sickness',
                'ALLERGY TO PENICILLIN',
                'Malignant neoplasm of skin',
                'Skin Sinus'
              ],
              'allergySummary': <String>[
                'CUTTLE FISH INK',
                'PLACEBO (SUBSTANCE)',
                'Eggs',
                'Dust',
              ]
            }
          }),
          201));
    }

    if (queryString.contains('visitSummary')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'visitSummary': <String, dynamic>{
                'AllergyIntolerance': <dynamic>[
                  <String, dynamic>{
                    'asserter': <String, dynamic>{'display': 'L B'},
                    'category': <dynamic>['medication'],
                    'clinicalStatus': <String, dynamic>{
                      'coding': <dynamic>[
                        <String, dynamic>{
                          'code': 'active',
                          'display': 'Active',
                          'system':
                              'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
                          'userSelected': false
                        }
                      ],
                      'text': 'Active'
                    },
                    'code': <String, dynamic>{
                      'coding': <dynamic>[
                        <String, dynamic>{
                          'code': '70848',
                          'display': 'ALLERGENIC EXTRACT,POLLEN',
                          'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                          'userSelected': false
                        }
                      ],
                      'text': 'ALLERGENIC EXTRACT,POLLEN'
                    },
                    'criticality': 'high',
                    'encounter': <String, dynamic>{
                      'display':
                          'Encounter5377d069-cb0a-4fde-a3a3-d654e1710dab',
                      'reference':
                          'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab',
                      'type': 'Encounter'
                    },
                    'id': '3ae4a80a-c446-4e41-938c-01765a532d68',
                    'note': <dynamic>[
                      <String, dynamic>{
                        'authorString': 'L B',
                        'text': 'pollen ni noma'
                      }
                    ],
                    'patient': <String, dynamic>{
                      'display': 'bichanga, lbbc ',
                      'reference':
                          'Patient/284ce6c5-13ff-4ba5-9838-20cd9417b071',
                      'type': 'Patient'
                    },
                    'reaction': <dynamic>[
                      <String, dynamic>{
                        'description': 'pollen ni noma',
                        'manifestation': <dynamic>[
                          <String, dynamic>{
                            'coding': <dynamic>[
                              <String, dynamic>{
                                'code': 'Manifestation ID',
                                'display': 'No manifestation provided',
                                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                                'userSelected': true
                              }
                            ],
                            'text': 'Manifestation Name'
                          }
                        ],
                        'severity': 'severe',
                        'substance': <String, dynamic>{
                          'coding': <dynamic>[
                            <String, dynamic>{
                              'code': '70848',
                              'display': 'ALLERGENIC EXTRACT,POLLEN',
                              'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                              'userSelected': true
                            }
                          ],
                          'text': 'ALLERGENIC EXTRACT,POLLEN'
                        }
                      }
                    ],
                    'recordedDate': '2021-02-19',
                    'recorder': <String, dynamic>{'display': 'L B'},
                    'type': 'allergy',
                    'verificationStatus': <String, dynamic>{
                      'coding': <dynamic>[
                        <String, dynamic>{
                          'code': 'confirmed',
                          'display': 'confirmed',
                          'system':
                              'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
                          'userSelected': false
                        }
                      ],
                      'text': 'Confirmed'
                    }
                  },
                ],
                'Composition': <dynamic>[
                  <String, dynamic>{
                    'author': <dynamic>[
                      <String, dynamic>{'display': 'Jane Doe'}
                    ],
                    'category': <dynamic>[
                      <String, dynamic>{
                        'coding': <dynamic>[
                          <String, dynamic>{
                            'code': '11488-4',
                            'display': 'Consult Note',
                            'system': 'http://loinc.org',
                            'userSelected': false
                          }
                        ],
                        'text': 'Consult Note'
                      }
                    ],
                    'date': '2021-02-03',
                    'encounter': <String, dynamic>{
                      'display':
                          'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
                      'reference':
                          'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
                      'type': 'Encounter'
                    },
                    'id': '5ecc77a3-df2e-47a6-95a9-58ee4b8415bb',
                    'section': <dynamic>[
                      <String, dynamic>{
                        'text': <String, dynamic>{
                          'div': '''
{"description":null,"symptomNoneKnown":"false","symptomCough":"true","symptomCongest":"false","symptomSOB":"false","symptomHaemoptysis":"true"}''',
                          'status': 'generated'
                        },
                        'title': 'respiratory'
                      }
                    ],
                    'status': 'preliminary',
                    'subject': <String, dynamic>{
                      'display': 'doe, jane ',
                      'reference':
                          'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                      'type': 'Patient'
                    },
                    'title': 'review-of-systems',
                    'type': <String, dynamic>{
                      'coding': <dynamic>[
                        <String, dynamic>{
                          'code': '11488-4',
                          'display': 'Consult Note',
                          'system': 'http://loinc.org',
                          'userSelected': false
                        }
                      ],
                      'text': 'Consult Note'
                    }
                  }
                ],
                'Condition': <dynamic>[
                  <String, dynamic>{
                    'asserter': <String, dynamic>{'display': 'john doe'},
                    'category': <dynamic>[
                      <String, dynamic>{
                        'coding': <dynamic>[
                          <String, dynamic>{
                            'code': 'encounter-diagnosis',
                            'display': 'problem-list-item',
                            'system':
                                'http://terminology.hl7.org/CodeSystem/condition-category',
                            'userSelected': false
                          }
                        ],
                        'text': 'problem-list-item'
                      }
                    ],
                    'clinicalStatus': <String, dynamic>{
                      'coding': <dynamic>[
                        <String, dynamic>{
                          'code': 'Active',
                          'display': 'Active',
                          'system':
                              'http://terminology.hl7.org/CodeSystem/condition-clinical',
                          'userSelected': false
                        }
                      ],
                      'text': 'Active'
                    },
                    'code': <String, dynamic>{
                      'coding': <dynamic>[
                        <String, dynamic>{
                          'code': '154531',
                          'display': 'Adverse reaction to flu shot',
                          'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                          'userSelected': true
                        }
                      ],
                      'text': 'Adverse reaction to flu shot'
                    },
                    'encounter': <String, dynamic>{
                      'display': 'Encounter',
                      'reference':
                          'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab',
                      'type': 'Encounter'
                    },
                    'id': 'c18455e1-670b-4dd9-859c-878065dcb084',
                    'note': <dynamic>[
                      <String, dynamic>{
                        'authorString': 'john doe',
                        'text': 'Consult Note'
                      }
                    ],
                    'recordedDate': '2021-02-03',
                    'recorder': <String, dynamic>{'display': 'john doe'},
                    'subject': <String, dynamic>{
                      'display': 'doe, john ',
                      'reference':
                          'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                      'type': 'Patient'
                    },
                    'verificationStatus': <String, dynamic>{
                      'coding': <dynamic>[
                        <String, dynamic>{
                          'code': 'confirmed',
                          'display': 'Confirmed',
                          'system':
                              'http://terminology.hl7.org/CodeSystem/condition-ver-status',
                          'userSelected': false
                        }
                      ],
                      'text': 'Confirmed'
                    }
                  }
                ],
                'Encounter': <dynamic>[
                  <String, dynamic>{
                    'class': <String, dynamic>{
                      'code': 'AMB',
                      'display': 'ambulatory',
                      'system':
                          'http://terminology.hl7.org/CodeSystem/v3-ActCode',
                      'userSelected': false,
                      'version': '2018-08-12'
                    },
                    'episodeOfCare': <dynamic>[
                      <String, dynamic>{
                        'reference':
                            'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
                      }
                    ],
                    'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
                    'period': <String, dynamic>{
                      'end': '2021-02-11T11:36:56+11:00',
                      'start': '2021-02-03T11:33:31+11:00'
                    },
                    'serviceProvider': <String, dynamic>{
                      'display': '123',
                      'type': 'Organization'
                    },
                    'status': 'finished',
                    'subject': <String, dynamic>{
                      'display': '+254718490169',
                      'reference':
                          'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                      'type': 'Patient'
                    }
                  }
                ],
                'MedicationRequest': <dynamic>[
                  <String, dynamic>{
                    'authoredOn': '2021-02-03',
                    'dosageInstruction': <dynamic>[
                      <String, dynamic>{
                        'patientInstruction': 'Take 5 capsules',
                        'text': 'Take 5 Capsules every 2 Hours for 3 Hours.'
                      }
                    ],
                    'encounter': <String, dynamic>{
                      'display': 'Encounter',
                      'reference':
                          'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
                      'type': 'Encounter'
                    },
                    'id': '496eb5af-6be1-4c8d-94ce-44e72f27fea7',
                    'intent': 'proposal',
                    'medicationCodeableConcept': <String, dynamic>{
                      'coding': <dynamic>[
                        <String, dynamic>{
                          'code': '71161',
                          'display': 'AMOXICILLIN MONOSODIUM SALT',
                          'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                          'userSelected': true
                        }
                      ],
                      'text': 'AMOXICILLIN MONOSODIUM SALT'
                    },
                    'note': <dynamic>[
                      <String, dynamic>{
                        'authorString': 'john doe',
                        'text': ' careful'
                      }
                    ],
                    'priority': 'routine',
                    'requester': <String, dynamic>{'display': 'john doe'},
                    'status': 'active',
                    'subject': <String, dynamic>{
                      'display': 'doe, john ',
                      'reference':
                          'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                      'type': 'Patient'
                    },
                    'supportingInformation': <dynamic>[
                      <String, dynamic>{
                        'display': 'Mal de Ojo',
                        'id': '24fe5480-6ced-47b2-8bbd-4dcd2b9b9598',
                        'reference':
                            'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326'
                      }
                    ]
                  }
                ],
                'Observation': <dynamic>[
                  <String, dynamic>{
                    'id': '4430faf1-8d82-4de2-8eda-bbb380b3bede',
                    'status': 'preliminary',
                    'code': <String, dynamic>{
                      'text': 'Heart Rate',
                      'coding': <dynamic>[
                        <String, dynamic>{
                          'display': 'Heart Rate',
                          'code': '8867-4',
                          'system': 'http://loinc.org',
                          'userSelected': true
                        }
                      ]
                    },
                    'valueQuantity': <String, dynamic>{
                      'value': 90,
                      'unit': '/min',
                      'system': 'http://unitsofmeasure.org',
                      'code': '/min'
                    },
                    'referenceRange': <dynamic>[
                      <String, dynamic>{
                        'text': '0/min to 300/min',
                        'low': <String, dynamic>{
                          'value': 0,
                          'unit': '/min',
                          'system': 'http://unitsofmeasure.org',
                          'code': 'min'
                        },
                        'high': <String, dynamic>{
                          'value': 300,
                          'unit': '/min',
                          'system': 'http://unitsofmeasure.org',
                          'code': '/min'
                        },
                        'type': <String, dynamic>{
                          'text': 'Normal Range',
                          'coding': <dynamic>[
                            <String, dynamic>{
                              'code': 'normal',
                              'userSelected': false,
                              'system':
                                  'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                              'display': 'Normal Range'
                            }
                          ]
                        }
                      }
                    ],
                    'interpretation': <dynamic>[
                      <String, dynamic>{
                        'text': 'NOMAL',
                        'coding': <dynamic>[
                          <String, dynamic>{
                            'display': 'NORMAL',
                            'code': 'N',
                            'system':
                                'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
                            'userSelected': false
                          }
                        ]
                      }
                    ],
                    'category': <dynamic>[
                      <String, dynamic>{
                        'text': 'Vital Signs',
                        'coding': <dynamic>[
                          <String, dynamic>{
                            'code': 'vital-signs',
                            'system':
                                'http://terminology.hl7.org/CodeSystem/observation-category',
                            'display': 'Vital Signs',
                            'userSelected': false
                          }
                        ]
                      }
                    ],
                    'issued': '2020-12-22T18:32:07.052015Z',
                    'effectiveInstant': '2020-12-22T18:32:07.052015Z',
                    'subject': <String, dynamic>{
                      'reference':
                          'Patient/68f7edf0-44fa-4d4d-970c-79eb6069908b',
                      'type': 'Patient',
                      'display': 'kiara, natasha '
                    },
                    'encounter': <String, dynamic>{
                      'reference':
                          'Encounter/e3af8ce5-8c75-45d9-a05f-03b9a3f57e04',
                      'type': 'Encounter',
                      'display': ''
                    }
                  }
                ],
                'ServiceRequest': <dynamic>[
                  <String, dynamic>{
                    'category': <dynamic>[
                      <String, dynamic>{
                        'coding': <dynamic>[
                          <String, dynamic>{
                            'code': '108252007',
                            'display': 'Laboratory procedure',
                            'system': 'http://snomed.info/sct',
                            'userSelected': false
                          }
                        ],
                        'text': 'Laboratory procedure'
                      }
                    ],
                    'code': <String, dynamic>{
                      'coding': <dynamic>[
                        <String, dynamic>{
                          'code': '76629-5',
                          'display': 'Fasting glucose [Moles/volume] in Blood',
                          'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                          'userSelected': true
                        }
                      ],
                      'text': 'Fasting glucose [Moles/volume] in Blood'
                    },
                    'encounter': <String, dynamic>{
                      'display': '2021-02-03',
                      'reference':
                          'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
                      'type': 'Encounter'
                    },
                    'id': '13130dcc-f244-4bb9-90c7-1fe4435d6a30',
                    'intent': 'plan',
                    'priority': 'routine',
                    'requester': <String, dynamic>{'display': 'doe, john'},
                    'status': 'active',
                    'subject': <String, dynamic>{
                      'display': 'doe, john ',
                      'reference':
                          'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                      'type': 'Patient'
                    },
                    'supportingInfo': <dynamic>[
                      <String, dynamic>{
                        'display': 'Diet Poor',
                        'id': 'f722f3c1-7705-4f32-b041-599f85a3ee1c',
                        'reference':
                            'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326'
                      }
                    ]
                  }
                ]
              }
            }
          }),
          201));
    }

    if (queryString.contains('getFeed')) {
      return Future<http.Response>.value(
        http.Response(json.encode(mockUserFeed), 201),
      );
    }

    if (queryString.contains('genericSearchFunction')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'searchFhirCondition': <String, dynamic>{
                  'id': '1',
                  'name': 'Amoxil'
                },
              }
            }),
            201),
      );
    }
    if (queryString.contains(updateMedicationMutation)) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'updateFHIRMedicationRequest': <String, dynamic>{
                  'resource': <String, dynamic>{
                    'ID': 'aea00008-4da3-4025-bff4-c2a00acdbf64'
                  }
                }
              }
            }),
            201),
      );
    }
    if (queryString.contains('searchFHIREncounter')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'searchFHIREncounter': <String, dynamic>{
                  'edges': <dynamic>[
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': 'f6c90224-c5bb-445f-a171-26f4a3b6b91b',
                        'Status': 'finished'
                      }
                    },
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': 'caa78b98-a84e-411f-82e4-202b273b7de8',
                        'Status': 'finished'
                      }
                    },
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': 'ea50718f-fc9e-45d2-8ca2-1b8b4bb17d91',
                        'Status': 'finished'
                      }
                    },
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': '82fc8bb2-055f-4deb-addd-feef4c4c75cc',
                        'Status': 'finished'
                      }
                    },
                  ]
                }
              }
            }),
            201),
      );
    }

    if (queryString == addVitalsMutation) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'createFHIRObservation': <String, dynamic>{
                  'id': '1',
                },
              }
            }),
            201),
      );
    }
    if (queryString == endVisitMutation) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'endEpisode': true}
            }),
            201),
      );
    }

    if (queryString == retireTestMutation) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'deleteFHIRServiceRequest': true}
            }),
            201),
      );
    }
    if (queryString == updateAllergyMutation) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'updateFHIRAllergyIntolerance': <String, dynamic>{
                  'resource': <String, dynamic>{
                    'ID': '753a7d8a-d296-40a7-ba30-2789ab56cbb0',
                    'Type': 'allergy',
                    'Category': <dynamic>['medication'],
                    'Criticality': 'low',
                    'ClinicalStatus': <String, dynamic>{
                      'Text': 'Active',
                      'Coding': <dynamic>[
                        <String, dynamic>{
                          'System':
                              'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
                          'Code': 'active',
                          'Display': 'Active',
                          'UserSelected': false
                        }
                      ]
                    },
                    'VerificationStatus': <String, dynamic>{
                      'Text': 'Confirmed',
                      'Coding': <dynamic>[
                        <String, dynamic>{
                          'System':
                              'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
                          'Code': 'confirmed',
                          'Display': 'Confirmed',
                          'UserSelected': false
                        }
                      ]
                    },
                    'Patient': <String, dynamic>{
                      'Reference':
                          'Patient/1a11256d-d908-463b-a930-5867fc670f5e',
                      'Type': 'Patient',
                      'Display': 'Shikami the Tall'
                    },
                    'Encounter': <String, dynamic>{
                      'Reference':
                          'Encounter/cf8567ba-d430-4ed0-b00d-23b2d6e10a2d',
                      'Type': 'Encounter'
                    },
                    'Recorder': <String, dynamic>{
                      'Display': 'DJ Dexter, Consultant Surgeon'
                    },
                    'Asserter': <String, dynamic>{
                      'Display': 'DJ Dexter, Consultant Surgeon'
                    },
                    'Note': <dynamic>[
                      <String, dynamic>{
                        'AuthorString': 'DJ Dexter',
                        'Text':
                            'This should be a Markdown note...stuff goes here'
                      }
                    ],
                    'Reaction': <dynamic>[
                      <String, dynamic>{
                        'Description': 'An allergy reaction in text',
                        'Severity': 'severe',
                        'Substance': <String, dynamic>{
                          'Text': 'Acetaminophen / Caffeine',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'System': 'OCL:/orgs/CIEL/sources/CIEL/',
                              'Code': '165447',
                              'Display':
                                  'Acetaminophen / Caffeine / Chlorpheniramine maleate / Phenylephrine hydrochloride',
                              'UserSelected': true
                            }
                          ]
                        }
                      }
                    ]
                  }
                }
              }
            }),
            201),
      );
    }

    if (queryString.contains('GetPatientInfo')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getPatient': <String, dynamic>{
                  'hasOpenEpisodes': true,
                  'openEpisodes': <dynamic>[
                    <String, dynamic>{
                      'ID': '9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d',
                      'Status': 'active',
                      'Patient': <String, dynamic>{
                        'Reference':
                            'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                        'Type': 'Patient',
                        'Display': '+254718490169',
                      }
                    },
                  ],
                  'patientRecord': <String, dynamic>{
                    'ID': '4b179736-f31a-4c55-986c-0c0785717748',
                    'Name': <dynamic>[
                      <String, dynamic>{
                        'Text': 'john, demo',
                      }
                    ],
                    'Telecom': <dynamic>[
                      <String, dynamic>{
                        'Value': '+254712345678',
                      }
                    ]
                  }
                },
                'findPatientsByMSISDN': <String, dynamic>{
                  'edges': <dynamic>[
                    <String, dynamic>{
                      'hasOpenEpisodes': true,
                      'node': <String, dynamic>{
                        'ID': '4b179736-f31a-4c55-986c-0c0785717748',
                        'Active': true,
                        'Gender': 'male',
                        'BirthDate': '2002-12-16',
                        'Telecom': <dynamic>[
                          <String, dynamic>{
                            'System': 'info@healthcloud.co.ke',
                            'Value': '+254712345678',
                          }
                        ],
                        'Name': <dynamic>[
                          <String, dynamic>{
                            'Given': <String>['john'],
                            ' Family': 'demo',
                            'Use': 'official',
                            'Text': 'john, demo',
                            'Prefix': null,
                            'Suffix': null,
                            'Period': <String, dynamic>{
                              'start': '2020-12-16T14:26:50+02:00',
                              'End': '2121-03-02T14:26:50+02:00',
                            }
                          }
                        ],
                        'Photo': <dynamic>[
                          <String, dynamic>{
                            'contentType': 'JPG',
                            'language': 'English',
                            'Data': '/9j/4AAQSkZJRgABAQAASABIAAD',
                            'URL':
                                'https://storage.googleapis.com/healthcloud_bewell_api_gateway_uploads/image_picker_97C0EF6F-39F1-4F48-91B4-9CC6AA227762-24717-000009864F540F05.jpg',
                            'size': 52757,
                            'Hash':
                                '67R7oAvE8rIfFrsIZ65zVd4c34MaErSvKullfwxQ6iAIDcRdtmEl86sQi6vpCu+K3cKmAcWbgGXvWO8mdA7Bcg==',
                            'Title': null,
                          }
                        ]
                      }
                    }
                  ],
                }
              }
            }),
            201),
      );
    }

    if (queryString.contains(deleteCompositionMutation)) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'deleteFHIRComposition': true}
            }),
            201),
      );
    }

    if (queryString.contains('getErrorFAQ')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'error': 'no FAQ'}), 201),
      );
    }

    if (queryString.contains('getNullFAQ')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'data': null}), 201),
      );
    }

    if (queryString.contains('searchFHIRServiceRequest')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'searchFHIRServiceRequest': <String, dynamic>{
                    'edges': <dynamic>[
                      <String, dynamic>{
                        'node': <String, dynamic>{
                          'ID': '1a4a56e4-4956-4022-9c75-5af61ef8d99f',
                          'Status': 'active',
                          'Intent': 'plan',
                          'Priority': 'routine',
                          'Subject': <String, dynamic>{
                            'Reference':
                                'Patient/284ce6c5-13ff-4ba5-9838-20cd9417b071',
                            'Type': 'Patient',
                            'Display': 'bichanga, lbbc '
                          },
                          'Encounter': <String, dynamic>{
                            'Reference':
                                'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab',
                            'Type': 'Encounter',
                            'Display': '2021-02-19'
                          },
                          'SupportingInfo': <dynamic>[
                            <String, dynamic>{
                              'ID': '9db28c1f-259f-4d74-918e-f84975c33005',
                              'Reference':
                                  'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab',
                              'Display': 'Diabetes Mellitus'
                            }
                          ],
                          'Requester': <String, dynamic>{'Display': 'L B'},
                          'Code': <String, dynamic>{
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'Display':
                                    'Fasting glucose [Moles/volume] in Blood',
                                'Code': '76629-5'
                              }
                            ]
                          },
                          'Category': <dynamic>[
                            <String, dynamic>{
                              'Text': 'Laboratory procedure',
                              'Coding': <dynamic>[
                                <String, dynamic>{
                                  'System': 'http://snomed.info/sct',
                                  'Code': '108252007',
                                  'Display': 'Laboratory procedure',
                                  'UserSelected': false
                                }
                              ]
                            }
                          ]
                        }
                      },
                    ]
                  }
                }
              },
            ),
            201),
      );
    }

    if (queryString.contains('searchFHIRMedicationRequest')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'searchFHIRMedicationRequest': <String, dynamic>{
                    'edges': <dynamic>[
                      <String, dynamic>{
                        'node': <String, dynamic>{
                          'ID': '1846e8be-ebec-4f80-b5f2-239dcac1e5fc',
                          'Status': 'active',
                          'Intent': 'proposal',
                          'Priority': 'routine',
                          'Subject': <String, dynamic>{
                            'Reference':
                                'Patient/284ce6c5-13ff-4ba5-9838-20cd9417b071',
                            'Type': 'Patient',
                            'Display': 'bichanga, lbbc '
                          },
                          'MedicationCodeableConcept': <String, dynamic>{
                            'Text': 'PENICILLIN INJECTION',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System': 'OCL:/orgs/CIEL/sources/CIEL/',
                                'Code': '292',
                                'Display': 'PENICILLIN INJECTION',
                                'UserSelected': true
                              }
                            ]
                          },
                          'DosageInstruction': <dynamic>[
                            <String, dynamic>{
                              'Text':
                                  'Take 1 Capsules every 3 Hours for 3 Days.',
                              'PatientInstruction': null
                            }
                          ],
                          'Requester': <String, dynamic>{'Display': 'L B'},
                          'Encounter': <String, dynamic>{
                            'Reference':
                                'Encounter/6c1d0043-965a-4830-b9d1-6b42390eed18',
                            'Type': 'Encounter',
                            'Display': 'Encounter'
                          },
                          'SupportingInformation': <dynamic>[
                            <String, dynamic>{
                              'ID': '1f852829-9469-4e41-954a-d34dc8074c37',
                              'Reference':
                                  'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab',
                              'Display':
                                  'Benign Hypertensive Renal Disease With Renal Failure'
                            }
                          ],
                          'AuthoredOn': '2021-02-15',
                          'Note': <dynamic>[
                            <String, dynamic>{'AuthorString': 'L B'}
                          ]
                        }
                      },
                    ]
                  }
                }
              },
            ),
            201),
      );
    }

    if (queryString.contains('searchFHIRCondition')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'searchFHIRCondition': <String, dynamic>{
                    'edges': <dynamic>[
                      <String, dynamic>{
                        'node': <String, dynamic>{
                          'ID': '7bdba5ac-f726-4cec-8064-12328f9032f6',
                          'RecordedDate': '2021-02-05',
                          'ClinicalStatus': <String, dynamic>{
                            'Text': 'Active',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/condition-clinical',
                                'Code': 'Active',
                                'Display': 'Active',
                                'UserSelected': false
                              }
                            ]
                          },
                          'VerificationStatus': <String, dynamic>{
                            'Text': 'Confirmed',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/condition-ver-status',
                                'Code': 'confirmed',
                                'Display': 'Confirmed',
                                'UserSelected': false
                              }
                            ]
                          },
                          'Category': <dynamic>[
                            <String, dynamic>{
                              'Text': 'problem-list-item',
                              'Coding': <dynamic>[
                                <String, dynamic>{
                                  'System':
                                      'http://terminology.hl7.org/CodeSystem/condition-category',
                                  'Code': 'problem-list-item',
                                  'Display': 'problem-list-item',
                                  'UserSelected': false
                                }
                              ]
                            }
                          ],
                          'Subject': <String, dynamic>{
                            'Reference':
                                'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                            'Type': 'Patient',
                            'Display':
                                'Patient/4b179736-f31a-4c55-986c-0c0785717748'
                          },
                          'Encounter': <String, dynamic>{
                            'Reference':
                                'Encounter/ff31e342-6ccf-4878-ad57-d43a9b06db78',
                            'Type': 'Encounter'
                          },
                          'Evidence': null,
                          'Asserter': <String, dynamic>{'Display': 'John Doe'},
                          'Note': <dynamic>[
                            <String, dynamic>{
                              'AuthorString': 'John Doe',
                              'Text': 'No notes provided'
                            }
                          ],
                          'Severity': null,
                          'OnsetString': null,
                          'Recorder': <String, dynamic>{'Display': 'John Doe'},
                          'Code': <String, dynamic>{
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System': 'OCL:/orgs/CIEL/sources/CIEL/',
                                'Code': '',
                                'Display': 'Chronic Congestive Heart Failure',
                                'UserSelected': true
                              }
                            ],
                            'Text': 'Chronic Congestive Heart Failure'
                          }
                        }
                      },
                      <String, dynamic>{
                        'node': <String, dynamic>{
                          'ID': '7bdba5ac-f726-4cec-8064-12328f9032f6',
                          'RecordedDate': '2021-02-03',
                          'ClinicalStatus': <String, dynamic>{
                            'Text': 'Active',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/condition-clinical',
                                'Code': 'Active',
                                'Display': 'Active',
                                'UserSelected': false
                              }
                            ]
                          },
                          'VerificationStatus': <String, dynamic>{
                            'Text': 'Confirmed',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System':
                                    'http://terminology.hl7.org/CodeSystem/condition-ver-status',
                                'Code': 'confirmed',
                                'Display': 'Confirmed',
                                'UserSelected': false
                              }
                            ]
                          },
                          'Category': <dynamic>[
                            <String, dynamic>{
                              'Text': 'encounter-diagnosis',
                              'Coding': <dynamic>[
                                <String, dynamic>{
                                  'System':
                                      'http://terminology.hl7.org/CodeSystem/condition-category',
                                  'Code': 'encounter-diagnosis',
                                  'Display': 'encounter-diagnosis',
                                  'UserSelected': false
                                }
                              ]
                            }
                          ],
                          'Subject': <String, dynamic>{
                            'Reference':
                                'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                            'Type': 'Patient',
                            'Display':
                                'Patient/4b179736-f31a-4c55-986c-0c0785717748'
                          },
                          'Encounter': <String, dynamic>{
                            'Reference':
                                'Encounter/ff31e342-6ccf-4878-ad57-d43a9b06db78',
                            'Type': 'Encounter'
                          },
                          'Evidence': null,
                          'Asserter': <String, dynamic>{'Display': 'Jane Doe'},
                          'Note': <dynamic>[
                            <String, dynamic>{
                              'AuthorString': 'John Doe',
                              'Text': 'No notes provided',
                            }
                          ],
                          'Severity': <String, dynamic>{
                            'Text': 'spmethomng',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System': 'OCL:/orgs/CIEL/sources/CIEL/',
                                'Code': '',
                                'Display': 'Mal de Ojo',
                                'UserSelected': true
                              }
                            ],
                          },
                          'OnsetString': null,
                          'Recorder': <String, dynamic>{'Display': 'Jane Doe'},
                          'Code': <String, dynamic>{
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System': 'OCL:/orgs/CIEL/sources/CIEL/',
                                'Code': '',
                                'Display': 'Mal de Ojo',
                                'UserSelected': true
                              }
                            ],
                            'Text': 'Mal de Ojo'
                          }
                        }
                      },
                    ]
                  }
                }
              },
            ),
            201),
      );
    }

    if (queryString.contains('searchFHIRAllergyIntolerance')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'searchFHIRAllergyIntolerance': <String, dynamic>{
                  'edges': <dynamic>[
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': 'd0ff46d9-4767-4653-82b2-22c5713d5b46',
                        'Type': 'allergy',
                        'RecordedDate': '2021-02-17',
                        'Category': <dynamic>['medication'],
                        'Criticality': 'high',
                        'ClinicalStatus': <String, dynamic>{
                          'Text': 'Active',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'System':
                                  'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
                              'Code': 'active',
                              'Display': 'Active',
                              'UserSelected': false
                            }
                          ]
                        },
                        'VerificationStatus': <String, dynamic>{
                          'Text': 'Confirmed',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'System':
                                  'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
                              'Code': 'confirmed',
                              'Display': 'confirmed',
                              'UserSelected': false
                            }
                          ]
                        },
                        'Patient': <String, dynamic>{
                          'Reference':
                              'Patient/284ce6c5-13ff-4ba5-9838-20cd9417b071',
                          'Type': 'Patient',
                          'Display': 'bichanga, lbbc '
                        },
                        'Code': <String, dynamic>{
                          'Text': 'OSPA PROTEIN',
                          'Coding': <dynamic>[
                            <String, dynamic>{
                              'Code': '81243',
                              'System': 'OCL:/orgs/CIEL/sources/CIEL/',
                              'Display': 'OSPA PROTEIN'
                            }
                          ]
                        },
                        'Encounter': <String, dynamic>{
                          'Reference':
                              'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab',
                          'Type': 'Encounter'
                        },
                        'Asserter': <String, dynamic>{'Display': 'L B'},
                        'Note': <dynamic>[
                          <String, dynamic>{
                            'AuthorString': 'L B',
                            'Text': 'sick'
                          }
                        ],
                        'Reaction': <dynamic>[
                          <String, dynamic>{
                            'Description': 'sick',
                            'Severity': 'severe',
                            'Substance': <String, dynamic>{
                              'Text': 'OSPA PROTEIN',
                              'Coding': <dynamic>[
                                <String, dynamic>{
                                  'System': 'OCL:/orgs/CIEL/sources/CIEL/',
                                  'Code': '81243',
                                  'Display': 'OSPA PROTEIN',
                                  'UserSelected': true
                                }
                              ]
                            }
                          }
                        ],
                        'Recorder': <String, dynamic>{'Display': 'L B'}
                      }
                    }
                  ]
                }
              }
            }),
            201),
      );
    }

    if (queryString.contains('SearchFHIREncounter')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'SearchFHIREncounter': <String, dynamic>{
                  'edges': <dynamic>[
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': 'ff31e342-6ccf-4878-ad57-d43a9b06db78',
                        'Status': 'finished'
                      }
                    },
                    <String, dynamic>{
                      'node': <String, dynamic>{
                        'ID': 'f6c90224-c5bb-445f-a171-26f4a3b6b91b',
                        'Status': 'finished'
                      }
                    },
                  ]
                }
              }
            }),
            201),
      );
    }

    if (queryString.contains('StartEncounter')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'startEncounter': '4b179736-f31a-4c55-986c-0c0785717748'
                }
              },
            ),
            201),
      );
    }

    if (queryString == listConceptsQuery) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'listConcepts': <dynamic>[
                  <String, dynamic>{
                    'concept_class': 'Drug',
                    'datatype': 'N/A',
                    'id': '81243',
                    'display_name': 'OSPA PROTEIN',
                  },
                  <String, dynamic>{
                    'concept_class': 'Diagnosis',
                    'datatype': 'N/A',
                    'id': '158522',
                    'descriptions': null,
                    'display_name': 'primary exertional headache',
                  },
                  <String, dynamic>{
                    'concept_class': 'Diagnosis',
                    'datatype': 'N/A',
                    'descriptions': null,
                    'display_locale': 'en',
                    'id': '160148',
                    'display_name': 'Malaria, confirmed',
                  },
                  <String, dynamic>{
                    'concept_class': 'Test',
                    'datatype': 'Coded',
                    'display_name': 'CXR',
                    'id': '645',
                  },
                  <String, dynamic>{
                    'concept_class': 'Drug',
                    'datatype': 'N/A',
                    'id': '466',
                    'display_locale': 'en',
                    'display_name': 'PARACETAMOL SYRUP',
                    'mappings': null,
                  },
                ]
              }
            }),
            201),
      );
    }

    if (queryString.contains('CreateAllergy')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'createFHIRAllergyIntolerance': <String, dynamic>{
                  'resource': <String, String>{
                    'ID': '3df5ff8a-ce33-4aa2-8b60-74bdea7a0f33'
                  }
                }
              }
            }),
            201),
      );
    }

    if (queryString == getFAQQuery) {
      return Future<http.Response>.value(
        http.Response(json.encode(helpCenterFAQMock), 201),
      );
    }

    if (queryString.contains('CreateFHIRCondition')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'createFHIRCondition': <String, dynamic>{
                  'resource': <String, String>{
                    'ID': '49690e3e-1313-435d-9ef7-a8d1040198cb'
                  }
                }
              }
            }),
            201),
      );
    }

    if (queryString.contains('CreateServiceRequest')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'createFHIRServiceRequest': <String, dynamic>{
                  'resource': <String, String>{
                    'ID': 'ba4e772c-7ad3-4bd7-99f9-7eb9ffd9659c'
                  }
                }
              }
            }),
            201),
      );
    }

    if (queryString.contains('CreateMedicationRequest')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'createFHIRMedicationRequest': <String, dynamic>{
                  'resource': <String, String>{
                    'ID': 'deff1755-f70e-4486-aae5-d80647740ba3'
                  }
                }
              }
            }),
            201),
      );
    }

    if (queryString.contains('CreateComposition')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'createFHIRComposition': <String, dynamic>{
                  'resource': <String, String>{
                    'ID': '2cbb619e-682d-446c-b782-5c547093a702'
                  }
                }
              }
            }),
            201),
      );
    }

    if (queryString.contains('UpdateComposition')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'updateFHIRComposition': <String, dynamic>{
                  'resource': <String, String>{
                    'ID': '2cbb619e-682d-446c-b782-5c547093a702'
                  }
                }
              }
            }),
            201),
      );
    }

    if (queryString.contains('updateFHIRCondition')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'updateFHIRCondition': <String, dynamic>{
                  'resource': <String, dynamic>{
                    'ID': 'b284bc7a-e7a6-4f02-908d-e021f73f54ac'
                  }
                }
              },
            }),
            201),
      );
    }

    if (queryString.contains('patientTimelineWithCount')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'episodeID': '4b179736-f31a-4c55-986c-0c0785717748',
                  'count': 1,
                  'patientTimelineWithCount': <dynamic>[
                    ...List<Map<String, dynamic>>.generate(
                      7,
                      (int index) => <String, dynamic>{
                        'AllergyIntolerance': <dynamic>[
                          <String, dynamic>{
                            'asserter': <String, dynamic>{
                              'display': 'john doe'
                            },
                            'category': <dynamic>['medication'],
                            'clinicalStatus': <String, dynamic>{
                              'coding': <dynamic>[
                                <String, dynamic>{
                                  'code': 'active',
                                  'display': 'Active',
                                  'system':
                                      'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
                                  'userSelected': false
                                }
                              ],
                              'text': 'Active'
                            },
                            'code': <String, dynamic>{
                              'coding': <dynamic>[
                                <String, dynamic>{
                                  'code': '75541',
                                  'display': 'EGG YOLK PHOSPHATIDES',
                                  'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                                  'userSelected': false
                                }
                              ],
                              'text': 'EGG YOLK PHOSPHATIDES'
                            },
                            'criticality': 'high',
                            'encounter': <String, dynamic>{
                              'display':
                                  'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
                              'reference':
                                  'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
                              'type': 'Encounter'
                            },
                            'id': '023850c5-83d8-4f99-b633-a31ec48130ef',
                            'note': <dynamic>[
                              <String, dynamic>{
                                'authorString': 'john doe',
                                'text': 'very bad'
                              }
                            ],
                            'patient': <String, dynamic>{
                              'display': 'doe, john ',
                              'reference':
                                  'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                              'type': 'Patient'
                            },
                            'reaction': <dynamic>[
                              <String, dynamic>{
                                'description': 'very bad',
                                'manifestation': <dynamic>[
                                  <String, dynamic>{
                                    'coding': <dynamic>[
                                      <String, dynamic>{
                                        'code': 'Manifestation ID',
                                        'display': 'No manifestation provided',
                                        'system':
                                            'OCL:/orgs/CIEL/sources/CIEL/',
                                        'userSelected': true
                                      }
                                    ],
                                    'text': 'Manifestation Name'
                                  }
                                ],
                                'severity': 'severe',
                                'substance': <String, dynamic>{
                                  'coding': <dynamic>[
                                    <String, dynamic>{
                                      'code': '75541',
                                      'display': 'EGG YOLK PHOSPHATIDES',
                                      'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                                      'userSelected': true
                                    }
                                  ],
                                  'text': 'EGG YOLK PHOSPHATIDES'
                                }
                              }
                            ],
                            'recordedDate': '2021-02-03',
                            'recorder': <String, dynamic>{
                              'display': 'john doe'
                            },
                            'type': 'allergy',
                            'verificationStatus': <String, dynamic>{
                              'coding': <dynamic>[
                                <String, dynamic>{
                                  'code': 'confirmed',
                                  'display': 'confirmed',
                                  'system':
                                      'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
                                  'userSelected': false
                                }
                              ],
                              'text': 'Confirmed'
                            }
                          },
                        ],
                        'Composition': <dynamic>[
                          <String, dynamic>{
                            'author': <dynamic>[
                              <String, dynamic>{'display': 'Jane Doe'}
                            ],
                            'category': <dynamic>[
                              <String, dynamic>{
                                'coding': <dynamic>[
                                  <String, dynamic>{
                                    'code': '11488-4',
                                    'display': 'Consult Note',
                                    'system': 'http://loinc.org',
                                    'userSelected': false
                                  }
                                ],
                                'text': 'Consult Note'
                              }
                            ],
                            'date': '2021-02-03',
                            'encounter': <String, dynamic>{
                              'display':
                                  'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
                              'reference':
                                  'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
                              'type': 'Encounter'
                            },
                            'id': '5ecc77a3-df2e-47a6-95a9-58ee4b8415bb',
                            'section': <dynamic>[
                              <String, dynamic>{
                                'text': <String, dynamic>{
                                  'div':
                                      '{"description":null,"symptomNoneKnown":"false","symptomCough":"true","symptomCongest":"false","symptomSOB":"false","symptomHaemoptysis":"true"}',
                                  'status': 'generated'
                                },
                                'title': 'respiratory'
                              }
                            ],
                            'status': 'preliminary',
                            'subject': <String, dynamic>{
                              'display': 'doe, jane ',
                              'reference':
                                  'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                              'type': 'Patient'
                            },
                            'title': 'review-of-systems',
                            'type': <String, dynamic>{
                              'coding': <dynamic>[
                                <String, dynamic>{
                                  'code': '11488-4',
                                  'display': 'Consult Note',
                                  'system': 'http://loinc.org',
                                  'userSelected': false
                                }
                              ],
                              'text': 'Consult Note'
                            }
                          }
                        ],
                        'Condition': <dynamic>[
                          <String, dynamic>{
                            'asserter': <String, dynamic>{
                              'display': 'john doe'
                            },
                            'category': <dynamic>[
                              <String, dynamic>{
                                'coding': <dynamic>[
                                  <String, dynamic>{
                                    'code': 'problem-list-item',
                                    'display': 'problem-list-item',
                                    'system':
                                        'http://terminology.hl7.org/CodeSystem/condition-category',
                                    'userSelected': false
                                  }
                                ],
                                'text': 'problem-list-item'
                              }
                            ],
                            'clinicalStatus': <String, dynamic>{
                              'coding': <dynamic>[
                                <String, dynamic>{
                                  'code': 'Active',
                                  'display': 'Active',
                                  'system':
                                      'http://terminology.hl7.org/CodeSystem/condition-clinical',
                                  'userSelected': false
                                }
                              ],
                              'text': 'Active'
                            },
                            'code': <String, dynamic>{
                              'coding': <dynamic>[
                                <String, dynamic>{
                                  'code': '154531',
                                  'display': 'Adverse reaction to flu shot',
                                  'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                                  'userSelected': true
                                }
                              ],
                              'text': 'Adverse reaction to flu shot'
                            },
                            'encounter': <String, dynamic>{
                              'display': 'Encounter',
                              'reference':
                                  'Encounter/522ece6f-0e44-435e-8bcb-38f919b901d1',
                              'type': 'Encounter'
                            },
                            'id': 'c18455e1-670b-4dd9-859c-878065dcb084',
                            'note': <dynamic>[
                              <String, dynamic>{
                                'authorString': 'john doe',
                                'text': 'Consult Note'
                              }
                            ],
                            'recordedDate': '2021-02-03',
                            'recorder': <String, dynamic>{
                              'display': 'john doe'
                            },
                            'subject': <String, dynamic>{
                              'display': 'doe, john ',
                              'reference':
                                  'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                              'type': 'Patient'
                            },
                            'verificationStatus': <String, dynamic>{
                              'coding': <dynamic>[
                                <String, dynamic>{
                                  'code': 'confirmed',
                                  'display': 'Confirmed',
                                  'system':
                                      'http://terminology.hl7.org/CodeSystem/condition-ver-status',
                                  'userSelected': false
                                }
                              ],
                              'text': 'Confirmed'
                            }
                          }
                        ],
                        'Encounter': <dynamic>[
                          <String, dynamic>{
                            'class': <String, dynamic>{
                              'code': 'AMB',
                              'display': 'ambulatory',
                              'system':
                                  'http://terminology.hl7.org/CodeSystem/v3-ActCode',
                              'userSelected': false,
                              'version': '2018-08-12'
                            },
                            'episodeOfCare': <dynamic>[
                              <String, dynamic>{
                                'reference':
                                    'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
                              }
                            ],
                            'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
                            'period': <String, dynamic>{
                              'end': '2021-02-11T11:36:56+11:00',
                              'start': '2021-02-03T11:33:31+11:00'
                            },
                            'serviceProvider': <String, dynamic>{
                              'display': '123',
                              'type': 'Organization'
                            },
                            'status': 'finished',
                            'subject': <String, dynamic>{
                              'display': '+254718490169',
                              'reference':
                                  'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                              'type': 'Patient'
                            }
                          }
                        ],
                        'MedicationRequest': <dynamic>[
                          <String, dynamic>{
                            'authoredOn': '2021-02-03',
                            'dosageInstruction': <dynamic>[
                              <String, dynamic>{
                                'patientInstruction': 'Take 5 capsules',
                                'text':
                                    'Take 5 Capsules every 2 Hours for 3 Hours.'
                              }
                            ],
                            'encounter': <String, dynamic>{
                              'display': 'Encounter',
                              'reference':
                                  'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
                              'type': 'Encounter'
                            },
                            'id': '496eb5af-6be1-4c8d-94ce-44e72f27fea7',
                            'intent': 'proposal',
                            'medicationCodeableConcept': <String, dynamic>{
                              'coding': <dynamic>[
                                <String, dynamic>{
                                  'code': '71161',
                                  'display': 'AMOXICILLIN MONOSODIUM SALT',
                                  'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                                  'userSelected': true
                                }
                              ],
                              'text': 'AMOXICILLIN MONOSODIUM SALT'
                            },
                            'note': <dynamic>[
                              <String, dynamic>{
                                'authorString': 'john doe',
                                'text': ' careful'
                              }
                            ],
                            'priority': 'routine',
                            'requester': <String, dynamic>{
                              'display': 'john doe'
                            },
                            'status': 'active',
                            'subject': <String, dynamic>{
                              'display': 'doe, john ',
                              'reference':
                                  'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                              'type': 'Patient'
                            },
                            'supportingInformation': <dynamic>[
                              <String, dynamic>{
                                'display': 'Mal de Ojo',
                                'id': '24fe5480-6ced-47b2-8bbd-4dcd2b9b9598',
                                'reference':
                                    'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326'
                              }
                            ]
                          }
                        ],
                        'Observation': <dynamic>[
                          <String, dynamic>{
                            'id': '4430faf1-8d82-4de2-8eda-bbb380b3bede',
                            'status': 'preliminary',
                            'code': <String, dynamic>{
                              'text': 'Heart Rate',
                              'coding': <dynamic>[
                                <String, dynamic>{
                                  'display': 'Heart Rate',
                                  'code': '8867-4',
                                  'system': 'http://loinc.org',
                                  'userSelected': true
                                }
                              ]
                            },
                            'valueQuantity': <String, dynamic>{
                              'value': 90,
                              'unit': '/min',
                              'system': 'http://unitsofmeasure.org',
                              'code': '/min'
                            },
                            'referenceRange': <dynamic>[
                              <String, dynamic>{
                                'text': '0/min to 300/min',
                                'low': <String, dynamic>{
                                  'value': 0,
                                  'unit': '/min',
                                  'system': 'http://unitsofmeasure.org',
                                  'code': 'min'
                                },
                                'high': <String, dynamic>{
                                  'value': 300,
                                  'unit': '/min',
                                  'system': 'http://unitsofmeasure.org',
                                  'code': '/min'
                                },
                                'type': <String, dynamic>{
                                  'text': 'Normal Range',
                                  'coding': <dynamic>[
                                    <String, dynamic>{
                                      'code': 'normal',
                                      'userSelected': false,
                                      'system':
                                          'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                                      'display': 'Normal Range'
                                    }
                                  ]
                                }
                              }
                            ],
                            'interpretation': <dynamic>[
                              <String, dynamic>{
                                'text': 'NOMAL',
                                'coding': <dynamic>[
                                  <String, dynamic>{
                                    'display': 'NORMAL',
                                    'code': 'N',
                                    'system':
                                        'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
                                    'userSelected': false
                                  }
                                ]
                              }
                            ],
                            'category': <dynamic>[
                              <String, dynamic>{
                                'text': 'Vital Signs',
                                'coding': <dynamic>[
                                  <String, dynamic>{
                                    'code': 'vital-signs',
                                    'system':
                                        'http://terminology.hl7.org/CodeSystem/observation-category',
                                    'display': 'Vital Signs',
                                    'userSelected': false
                                  }
                                ]
                              }
                            ],
                            'issued': '2020-12-22T18:32:07.052015Z',
                            'effectiveInstant': '2020-12-22T18:32:07.052015Z',
                            'subject': <String, dynamic>{
                              'reference':
                                  'Patient/68f7edf0-44fa-4d4d-970c-79eb6069908b',
                              'type': 'Patient',
                              'display': 'kiara, natasha '
                            },
                            'encounter': <String, dynamic>{
                              'reference':
                                  'Encounter/e3af8ce5-8c75-45d9-a05f-03b9a3f57e04',
                              'type': 'Encounter',
                              'display': ''
                            }
                          }
                        ],
                        'ServiceRequest': <dynamic>[
                          <String, dynamic>{
                            'category': <dynamic>[
                              <String, dynamic>{
                                'coding': <dynamic>[
                                  <String, dynamic>{
                                    'code': '108252007',
                                    'display': 'Laboratory procedure',
                                    'system': 'http://snomed.info/sct',
                                    'userSelected': false
                                  }
                                ],
                                'text': 'Laboratory procedure'
                              }
                            ],
                            'code': <String, dynamic>{
                              'coding': <dynamic>[
                                <String, dynamic>{
                                  'code': '76629-5',
                                  'display':
                                      'Fasting glucose [Moles/volume] in Blood',
                                  'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                                  'userSelected': true
                                }
                              ],
                              'text': 'Fasting glucose [Moles/volume] in Blood'
                            },
                            'encounter': <String, dynamic>{
                              'display': '2021-02-03',
                              'reference':
                                  'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
                              'type': 'Encounter'
                            },
                            'id': '13130dcc-f244-4bb9-90c7-1fe4435d6a30',
                            'intent': 'plan',
                            'priority': 'routine',
                            'requester': <String, dynamic>{
                              'display': 'doe, john'
                            },
                            'status': 'active',
                            'subject': <String, dynamic>{
                              'display': 'doe, john ',
                              'reference':
                                  'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                              'type': 'Patient'
                            },
                            'supportingInfo': <dynamic>[
                              <String, dynamic>{
                                'display': 'Diet Poor',
                                'id': 'f722f3c1-7705-4f32-b041-599f85a3ee1c',
                                'reference':
                                    'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326'
                              }
                            ]
                          }
                        ]
                      },
                    ),
                  ]
                }
              },
            ),
            201),
      );
    }

    // mock data for problemSummary
    if (queryString.contains('ProblemSummary')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'problemSummary': <dynamic>[],
                  'allergySummary': <dynamic>[]
                }
              },
            ),
            201),
      );
    }
    if (queryString.contains('EndEpisode')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'endEpisode': true,
              },
            }),
            201),
      );
    }
    if (queryString.contains('getEmptyFAQ')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{'getFaqsContent': <dynamic>[]}
              },
            ),
            201),
      );
    }
    if (queryString.contains('generateAndEmailOtpQuery')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'generateAndEmailOtpQuery': <String, dynamic>{
                    'msisdn': '0712345678',
                  }
                }
              },
            ),
            201),
      );
    }

    if (queryString.contains('findPatientsByMSISDN')) {
      return Future<http.Response>.value(
        http.Response(findPatientByMSISDNJson, 200),
      );
    }

    if (queryString.contains('getFaqsContent')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'getFaqsContent': <dynamic>[
                    <String, dynamic>{
                      'title': 'How to add your cover',
                      'excerpt':
                          ' * Login to your Be.Well accountn * Navigate to the cover pagen * Choose the insurance provider you want attached to your covern * Add your member insurance as indicated in your insurance cardn * Then press the submit button'
                    }
                  ]
                }
              },
            ),
            201),
      );
    }

    if (queryString.contains('registerPatient')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'registerPatient': <String, dynamic>{
                    'patientRecord': <String, dynamic>{
                      'ID': '123456789',
                      'Name': <Map<String, dynamic>>[
                        <String, dynamic>{
                          'Text': 'Doe John',
                          'Given': <String>['John']
                        },
                      ],
                      'Telecom': <Map<String, String>>[
                        <String, String>{
                          'Value': '+254712345678',
                          'System': 'phone'
                        }
                      ],
                    },
                  },
                }
              },
            ),
            201),
      );
    }

    if (queryString.contains('addNextOfKin')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'addNextOfKin': <String, dynamic>{
                  'patientRecord': <String, dynamic>{
                    'ID': testPatientId,
                  }
                },
              },
            }),
            201),
      );
    }

    if (queryString.contains('addNewNextOfKin')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'addNewNextOfKin': <String, dynamic>{
                  'patientRecord': <String, dynamic>{
                    'ID': testPatientId,
                    'Telecom': <dynamic>[
                      <String, dynamic>{
                        'System': 'info@healthcloud.co.ke',
                        'Value': '+254712345678',
                      }
                    ],
                    'Name': <dynamic>[
                      <String, String>{'text': 'TestName'}
                    ],
                    'Gender': 'male',
                    'BirthDate': '01121997',
                  }
                },
              },
            }),
            201),
      );
    }

    if (queryString.contains('UpdateComposition')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'updateFHIRComposition': <String, dynamic>{
                  'resource': <String, dynamic>{
                    'ID': 'c26947db-d701-4836-a2ac-07a0b847cf3b',
                  }
                },
              },
            }),
            201),
      );
    }

    if (queryString.contains('CreateComposition')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'createFHIRComposition': <String, dynamic>{
                  'resource': <String, dynamic>{
                    'ID': 'c26947db-d701-4836-a2ac-07a0b847cf3b',
                  }
                },
              },
            }),
            201),
      );
    }

    if (queryString.contains('UpdateFHIRCondition')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'updateFHIRCondition': <String, dynamic>{
                  'resource': <String, dynamic>{
                    'ID': 'c26947db-d701-4836-a2ac-07a0b847cf3b',
                  }
                },
              },
            }),
            201),
      );
    }

    if (queryString.contains('SearchCompositions')) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'searchFHIRComposition': <String, dynamic>{
                    'edges': <dynamic>[
                      <String, dynamic>{
                        'node': <String, dynamic>{
                          'ID': 'c26947db-d701-4836-a2ac-07a0b847cf3b',
                          'Status': 'Preliminary',
                          'Type': <String, dynamic>{
                            'Text': 'Consult Note',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System': 'http://loinc.org',
                                'Code': '11488-4',
                                'Display': 'Consult Note',
                                'UserSelected': false
                              }
                            ]
                          },
                          'Category': <String, dynamic>{
                            'Text': 'Consult Note',
                            'Coding': <dynamic>[
                              <String, dynamic>{
                                'System': '',
                                'Code': '',
                                'Display': '',
                                'UserSelected': '',
                              }
                            ]
                          },
                          'Author': <String, dynamic>{
                            'Reference': null,
                            'Display': 'Jane Doe'
                          },
                          'Title': 'patient-history',
                          'Section': <dynamic>[
                            <String, dynamic>{
                              'Title': 'patient-history',
                              'Text': <String, dynamic>{
                                'Status': 'generated',
                                'Div':
                                    '{"description":null,"symptomNoneKnown":"false","symptomCough":"true","symptomCongest":"false","symptomSOB":"false","symptomHaemoptysis":"false"}'
                              }
                            }
                          ]
                        }
                      }
                    ],
                  },
                },
              },
            ),
            201),
      );
    }

    if (queryString.contains('StartOTPEpisode')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'startEpisodeByOTP': <String, dynamic>{
                'episodeOfCare': <String, dynamic>{
                  'ID': '7940d7ba-f316-4a76-a03f-bcd366a8d9f7',
                  'Status': 'active',
                  'Period': <String, dynamic>{
                    'Start': '2021-02-16T10:38:16+10:00'
                  },
                  'ManagingOrganization': <String, String>{'Display': '123'},
                  'Patient': <String, dynamic>{
                    'Identifier': null,
                    'Display': '+254717356476'
                  },
                  'Type': <dynamic>[
                    <String, String>{'Text': 'PROFILE_AND_RECENT_VISITS_ACCESS'}
                  ]
                }
              }
            }
          }),
          201));
    }

    if (queryString.contains('StartBreakGlassEpisode')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'startEpisodeByBreakGlass': <String, dynamic>{
                'episodeOfCare': <String, dynamic>{
                  'ID': '7940d7ba-f316-4a76-a03f-bcd366a8d9f7',
                  'Status': 'active',
                  'Period': <String, dynamic>{
                    'Start': '2021-02-16T10:38:16+10:00'
                  },
                  'ManagingOrganization': <String, String>{'Display': '123'},
                  'Patient': <String, dynamic>{
                    'Identifier': null,
                    'Display': '+254717356476'
                  },
                  'Type': <dynamic>[
                    <String, String>{'Text': 'PROFILE_AND_RECENT_VISITS_ACCESS'}
                  ]
                }
              }
            }
          }),
          201));
    }

    if (queryString.contains('updatePatientExtraInformation')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'createUpdatePatientExtraInformation': true
            }
          }),
          201));
    }

    if (queryString.contains('UpgradeEpisode')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'upgradeEpisode': <String, dynamic>{
                'episodeOfCare': <String, dynamic>{
                  'ID': '7940d7ba-f316-4a76-a03f-bcd366a8d9f7'
                },
                'totalVisits': 34
              }
            }
          }),
          201));
    }

    if (queryString.contains('EndEpisode')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'endEpisode': <String, dynamic>{}}
          }),
          201));
    }

    if (queryString == processEventMutation) {
      return Future<http.Response>.value(
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'processEvent': true}
            }),
            201),
      );
    }

    if (queryString.contains('ResolveFeedItem')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'resolveFeedItem': <String, dynamic>{
                'id': '1opb2r9WPsbN0OmWySaPho8agbx'
              }
            }
          }),
          201));
    }

    if (queryString.contains('SetUserCommunicationsSettings')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'setUserCommunicationsSettings': <String, dynamic>{
                'allowWhatsApp': false,
                'allowPush': false,
                'allowEmail': true,
                'allowTextSMS': false
              }
            }
          }),
          201));
    }

    if (queryString == registerDeviceTokenMutation) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'registerPushToken': true}
          }),
          201));
    }

    if (queryString.contains('addNHIF')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'addNHIF': <String, dynamic>{
                'patientRecord': <String, dynamic>{
                  'ID': 'fda0f399-57c8-4a31-9308-2d01eb767f96'
                }
              }
            }
          }),
          201));
    }

    if (queryString.contains('Trace')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'logDebugInfo': true}
          }),
          201));
    }

    if (queryString.contains('setupUserAsExperimentParticipant')) {
      return Future<http.Response>.value(http.Response(
          json.encode(<String, dynamic>{
            'data': <String, bool>{'setupAsExperimentParticipant': true}
          }),
          201));
    }

    return Future<http.Response>.value();
  }
}

/// constants used in patient exam
const String testPatientReference =
    'Patient/4b179736-f31a-4c55-986c-0c0785717748';
const String testEncounterReference =
    'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab';
const String testEncounterId = '5377d069-cb0a-4fde-a3a3-d654e1710dab';
const String testEpisodeId = '4b179736-f31a-4c55-986c-0c0785717748';
const String testPatientId = '4b179736-f31a-4c55-986c-0c0785717748';
const String testPatientName = 'Be Well';
Name testFirstName = Name.fromJson('Happy');
Name testLastName = Name.fromJson('User');
const Gender testGender = Gender.male;
const String testDOB = '2020-03-13T17:18:21+03:00';
const String testDate = '2021-02-03T17:18:21+03:00';
PhoneNumber testPhoneNumber = PhoneNumber.withValue('+254721123456');
EmailAddress testEmailAddress = EmailAddress.withValue('demo@gmail.com');

final Map<String, dynamic> mockedPatientData = <String, dynamic>{
  'edges': <dynamic>[
    <String, dynamic>{
      'hasOpenEpisodes': true,
      'node': <String, dynamic>{
        'ID': testPatientId,
        'Active': true,
        'Gender': 'male',
        'BirthDate': '2002-12-16',
        'Telecom': <dynamic>[
          <String, dynamic>{
            'System': 'info@healthcloud.co.ke',
            'Value': '+254712345678',
          }
        ],
        'Name': <dynamic>[
          <String, dynamic>{
            'Given': <String>['john'],
            'Family': 'demo',
            'Use': 'official',
            'Text': testPatientName,
            'Prefix': null,
            'Suffix': null,
            'Period': <String, dynamic>{
              'start': '2020-12-16T14:26:50+02:00',
              'End': '2121-03-02T14:26:50+02:00',
            }
          }
        ],
        'Photo': <Map<String, dynamic>>[
          <String, dynamic>{
            'Data':
                'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+P+/HgAFhAJ/wlseKgAAAABJRU5ErkJggg=='
          }
        ]
      }
    }
  ],
};

final List<dynamic> mockPatientVisits = <dynamic>[
  <String, dynamic>{
    'AllergyIntolerance': <dynamic>[],
    'ServiceRequest': <dynamic>[],
    'Condition': <dynamic>[],
    'Observation': <dynamic>[],
    'MedicationRequest': <dynamic>[
      <String, dynamic>{
        'asserter': <String, dynamic>{'display': 'john doe'},
        'category': <dynamic>['medication'],
        'clinicalStatus': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': 'active',
              'display': 'Active',
              'system':
                  'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
              'userSelected': false
            }
          ],
          'text': 'Active'
        },
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '75541',
              'display': 'EGG YOLK PHOSPHATIDES',
              'system': 'OCL:/orgs/CIEL/sources/CIEL/',
              'userSelected': false
            }
          ],
          'text': 'EGG YOLK PHOSPHATIDES'
        },
        'criticality': 'high',
        'encounter': <String, dynamic>{
          'display': 'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
          'reference': 'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
          'type': 'Encounter'
        },
        'id': '023850c5-83d8-4f99-b633-a31ec48130ef',
        'note': <dynamic>[
          <String, dynamic>{'authorString': 'john doe', 'text': 'very bad'}
        ],
        'patient': <String, dynamic>{
          'display': 'doe, john ',
          'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
          'type': 'Patient'
        },
        'reaction': <dynamic>[
          <String, dynamic>{
            'description': 'very bad',
            'manifestation': <dynamic>[
              <String, dynamic>{
                'coding': <dynamic>[
                  <String, dynamic>{
                    'code': 'Manifestation ID',
                    'display': 'No manifestation provided',
                    'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                    'userSelected': true
                  }
                ],
                'text': 'Manifestation Name'
              }
            ],
            'severity': 'severe',
            'substance': <String, dynamic>{
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': '75541',
                  'display': 'EGG YOLK PHOSPHATIDES',
                  'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                  'userSelected': true
                }
              ],
              'text': 'EGG YOLK PHOSPHATIDES'
            }
          }
        ],
        'recordedDate': '2021-02-03',
        'recorder': <String, dynamic>{'display': 'john doe'},
        'type': 'allergy',
        'verificationStatus': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': 'confirmed',
              'display': 'confirmed',
              'system':
                  'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
              'userSelected': false
            }
          ],
          'text': 'Confirmed'
        }
      },
    ],
    'Encounter': <dynamic>[
      <String, dynamic>{
        'period': <String, dynamic>{'start': '2021-02-03T08:16:14+08:00'},
      },
    ],
  },
];

void startMockVisitAndExam() {
  /// starts a visit
  final CurrentPatientInEpisode _current = CurrentPatientInEpisode();

  _current.patientConnection.add(PatientConnection.fromJson(mockedPatientData));

  final EpisodeOfCarePayload _episodePayload = EpisodeOfCarePayload(
    episodeOfCare: EpisodeOfCare(
      id: testEpisodeId,
      patient: Reference(reference: testPatientReference),
    ),
  );

  _current.episodeOfCarePayload.add(_episodePayload);

  /// start an exam
  CurrentPatientInEpisode().encounterID.add(testEncounterId);
}

const String testCompositionID = '4b179736-f31a-4c55-986c-0c0785717748';
const String testPatientID = 'fcc04ab6-90df-4d58-99e5-d6741c92ed45';
const String testPatientNumber = '0712345678';
const String testCompositionTitle = 'family history';
const String testPatientHistory = 'patient history';
const String testPatientHistoryCompositionID =
    'fcc04ab6-90df-4d58-99e5-d6741c92ed45';
const String testRecordingDoctor = 'Jane Doe';
const String testDateRecorded = '2021-02-09';
const String testReviewCompositionID = 'c26947db-d701-4836-a2ac-07a0b847cf3b';
const String testGeneralCompositionID = 'c25741db-d701-5749-a2ac-07a0b847cf3b';
const String testGeneralExamComposition = 'general exam composition';

io.File testImage = io.File('assets/images/try_feature.jpg');

List<dynamic> testExamTests = <dynamic>[
  <String, dynamic>{
    'category': <dynamic>[
      <String, dynamic>{'text': 'Laboratory procedure'}
    ],
    'code': <String, dynamic>{
      'text': 'Fasting glucose [Moles/volume] in Blood'
    },
    'requester': <String, dynamic>{'display': 'doe, john'},
  }
];

List<dynamic> testExamMedications = <dynamic>[
  <String, dynamic>{
    'authoredOn': '2021-02-03',
    'dosageInstruction': <dynamic>[
      <String, dynamic>{'text': 'Take 5 Capsules every 2 Hours for 3 Hours.'}
    ],
    'medicationCodeableConcept': <String, dynamic>{
      'text': 'AMOXICILLIN MONOSODIUM SALT'
    },
    'id': '496eb5af-6be1-4c8d-94ce-44e72f27fea7',
    'requester': <String, dynamic>{'display': 'john doe'},
    'subject': <String, dynamic>{
      'display': 'doe, john ',
    },
  }
];

Map<String, dynamic> testRegisteredPatientData = <String, dynamic>{
  'registerPatient': <String, dynamic>{
    'patientRecord': <String, dynamic>{
      'ID': '4b179736-f31a-4c55-986c-0c0785717748',
      'Name': <dynamic>[
        <String, dynamic>{
          'Text': 'john, demo',
        }
      ],
      'Telecom': <dynamic>[
        <String, dynamic>{
          'Value': '+254712345678',
        }
      ]
    },
  }
};
Map<String, dynamic> medicationMockedData = <String, dynamic>{
  'edges': <dynamic>[
    <String, dynamic>{
      'node': <String, dynamic>{
        'ID': 'a421d3dc-9a13-42e6-b26e-425ab8be27a3',
        'Status': 'active',
        'Intent': 'proposal',
        'Priority': 'routine',
        'Subject': <String, dynamic>{
          'Reference': 'Patient/e8dc1f10-aece-4340-b1c3-aa778e0eff01',
          'Type': 'Patient',
          'Display': 'Orina, Abiud '
        },
        'MedicationCodeableConcept': <String, dynamic>{
          'Text': 'Dimethicone / pramoxine',
          'Coding': <dynamic>[
            <String, dynamic>{
              'System': 'OCL:/orgs/CIEL/sources/CIEL/',
              'Code': '104497',
              'Display': 'Dimethicone / pramoxine',
              'UserSelected': true
            }
          ]
        },
        'DosageInstruction': <dynamic>[
          <String, dynamic>{
            'Text': 'Take 3 Capsules every 3 Hours for 3 Hours.',
            'PatientInstruction': null
          }
        ],
        'Requester': <String, dynamic>{'Display': 'Abiud Orina'},
        'Encounter': <String, dynamic>{
          'Reference': 'Encounter/cf3f6c06-2454-4c5f-8e10-6015c1273031',
          'Type': 'Encounter',
          'Display': 'Encounter'
        },
        'SupportingInformation': <dynamic>[
          <String, dynamic>{
            'ID': '5cb7faf4-37f1-47a8-9865-00307b840994',
            'Reference': 'Encounter/cf3f6c06-2454-4c5f-8e10-6015c1273031',
            'Display': 'Diabetes Mellitus'
          }
        ],
        'AuthoredOn': '2021-04-14',
        'Note': <dynamic>[
          <String, dynamic>{'AuthorString': 'Abiud Orina'}
        ]
      }
    },
    <String, dynamic>{
      'node': <String, dynamic>{
        'ID': 'be674046-d5f1-40c9-b3d9-f7bba74f4b30',
        'Status': 'active',
        'Intent': 'proposal',
        'Priority': 'routine',
        'Subject': <String, dynamic>{
          'Reference': 'Patient/e8dc1f10-aece-4340-b1c3-aa778e0eff01',
          'Type': 'Patient',
          'Display': 'Orina, Abiud '
        },
        'MedicationCodeableConcept': <String, dynamic>{
          'Text': 'Hydrocortisone / pramoxine',
          'Coding': <dynamic>[
            <String, dynamic>{
              'System': 'OCL:/orgs/CIEL/sources/CIEL/',
              'Code': '104865',
              'Display': 'Hydrocortisone / pramoxine',
              'UserSelected': true
            }
          ]
        },
        'DosageInstruction': <dynamic>[
          <String, dynamic>{
            'Text': 'Take 2 Capsules every 2 Hours for 2 Hours.',
            'PatientInstruction': null
          }
        ],
        'Requester': <String, dynamic>{'Display': 'Abiud Orina'},
        'Encounter': <String, dynamic>{
          'Reference': 'Encounter/cf3f6c06-2454-4c5f-8e10-6015c1273031',
          'Type': 'Encounter',
          'Display': 'Encounter'
        },
        'SupportingInformation': <dynamic>[
          <String, dynamic>{
            'ID': '5cb7faf4-37f1-47a8-9865-00307b840994',
            'Reference': 'Encounter/cf3f6c06-2454-4c5f-8e10-6015c1273031',
            'Display': 'Diabetes Mellitus'
          }
        ],
        'AuthoredOn': '2021-04-13',
        'Note': <dynamic>[
          <String, dynamic>{'AuthorString': 'Abiud Orina'}
        ]
      }
    },
  ],
};
List<dynamic> listMedicationMockedData = <dynamic>[
  <String, dynamic>{
    'node': <String, dynamic>{
      'ID': 'a421d3dc-9a13-42e6-b26e-425ab8be27a3',
      'Status': 'active',
      'Intent': 'proposal',
      'Priority': 'routine',
      'Subject': <String, dynamic>{
        'Reference': 'Patient/e8dc1f10-aece-4340-b1c3-aa778e0eff01',
        'Type': 'Patient',
        'Display': 'Orina, Abiud '
      },
      'MedicationCodeableConcept': <String, dynamic>{
        'Text': 'Dimethicone / pramoxine',
        'Coding': <dynamic>[
          <String, dynamic>{
            'System': 'OCL:/orgs/CIEL/sources/CIEL/',
            'Code': '104497',
            'Display': 'Dimethicone / pramoxine',
            'UserSelected': true
          }
        ]
      },
      'DosageInstruction': <dynamic>[
        <String, dynamic>{
          'Text': 'Take 3 Capsules every 3 Hours for 3 Hours.',
          'PatientInstruction': null
        }
      ],
      'Requester': <String, dynamic>{'Display': 'Abiud Orina'},
      'Encounter': <String, dynamic>{
        'Reference': 'Encounter/cf3f6c06-2454-4c5f-8e10-6015c1273031',
        'Type': 'Encounter',
        'Display': 'Encounter'
      },
      'SupportingInformation': <dynamic>[
        <String, dynamic>{
          'ID': '5cb7faf4-37f1-47a8-9865-00307b840994',
          'Reference': 'Encounter/cf3f6c06-2454-4c5f-8e10-6015c1273031',
          'Display': 'Diabetes Mellitus'
        }
      ],
      'AuthoredOn': '2021-04-14',
      'Note': <dynamic>[
        <String, dynamic>{'AuthorString': 'Abiud Orina'}
      ]
    }
  },
  <String, dynamic>{
    'node': <String, dynamic>{
      'ID': 'be674046-d5f1-40c9-b3d9-f7bba74f4b30',
      'Status': 'active',
      'Intent': 'proposal',
      'Priority': 'routine',
      'Subject': <String, dynamic>{
        'Reference': 'Patient/e8dc1f10-aece-4340-b1c3-aa778e0eff01',
        'Type': 'Patient',
        'Display': 'Orina, Abiud '
      },
      'MedicationCodeableConcept': <String, dynamic>{
        'Text': 'Hydrocortisone / pramoxine',
        'Coding': <dynamic>[
          <String, dynamic>{
            'System': 'OCL:/orgs/CIEL/sources/CIEL/',
            'Code': '104865',
            'Display': 'Hydrocortisone / pramoxine',
            'UserSelected': true
          }
        ]
      },
      'DosageInstruction': <dynamic>[
        <String, dynamic>{
          'Text': 'Take 2 Capsules every 2 Hours for 2 Hours.',
          'PatientInstruction': null
        }
      ],
      'Requester': <String, dynamic>{'Display': 'Abiud Orina'},
      'Encounter': <String, dynamic>{
        'Reference': 'Encounter/cf3f6c06-2454-4c5f-8e10-6015c1273031',
        'Type': 'Encounter',
        'Display': 'Encounter'
      },
      'SupportingInformation': <dynamic>[
        <String, dynamic>{
          'ID': '5cb7faf4-37f1-47a8-9865-00307b840994',
          'Reference': 'Encounter/cf3f6c06-2454-4c5f-8e10-6015c1273031',
          'Display': 'Diabetes Mellitus'
        }
      ],
      'AuthoredOn': '2021-04-13',
      'Note': <dynamic>[
        <String, dynamic>{'AuthorString': 'Abiud Orina'}
      ]
    }
  },
];

Map<String, dynamic> allergyIntoleranceRelayConnectionMockedData =
    <String, dynamic>{
  'edges': <dynamic>[
    <String, dynamic>{
      'node': <String, dynamic>{
        'ID': 'a588145e-faed-45a3-b973-da2003e05a54',
        'Type': 'allergy',
        'RecordedDate': '2021-04-16',
        'Category': <dynamic>['medication'],
        'Criticality': 'high',
        'ClinicalStatus': <String, dynamic>{
          'Text': 'Active',
          'Coding': <dynamic>[
            <String, dynamic>{
              'System':
                  'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
              'Code': 'active',
              'Display': 'Active',
              'UserSelected': false
            }
          ]
        },
        'VerificationStatus': <String, dynamic>{
          'Text': 'Confirmed',
          'Coding': <dynamic>[
            <String, dynamic>{
              'System':
                  'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
              'Code': 'confirmed',
              'Display': 'confirmed',
              'UserSelected': false
            }
          ]
        },
        'Patient': <String, dynamic>{
          'Reference': 'Patient/e8dc1f10-aece-4340-b1c3-aa778e0eff01',
          'Type': 'Patient',
          'Display': 'Orina, Abiud '
        },
        'Code': <String, dynamic>{
          'Text': 'Allergenic extract, grass, johnson',
          'Coding': <dynamic>[
            <String, dynamic>{
              'Code': '70744',
              'System': 'OCL:/orgs/CIEL/sources/CIEL/',
              'Display': 'Allergenic extract, grass, johnson'
            }
          ]
        },
        'Encounter': <String, dynamic>{
          'Reference': 'Encounter/fe9d2aa7-5b64-4c75-a145-d4a855a9a529',
          'Type': 'Encounter'
        },
        'Asserter': <String, dynamic>{'Display': 'Calvine Otieno '},
        'Note': <dynamic>[
          <String, dynamic>{
            'AuthorString': 'Calvine Otieno ',
            'Text': 'just for test '
          }
        ],
        'Reaction': <dynamic>[
          <String, dynamic>{
            'Description': 'just for test ',
            'Severity': 'severe',
            'Substance': <String, dynamic>{
              'Text': 'Allergenic extract, grass, johnson',
              'Coding': <dynamic>[
                <String, dynamic>{
                  'System': 'OCL:/orgs/CIEL/sources/CIEL/',
                  'Code': '70744',
                  'Display': 'Allergenic extract, grass, johnson',
                  'UserSelected': true
                }
              ]
            }
          }
        ],
        'Recorder': <String, dynamic>{'Display': 'Calvine Otieno '}
      },
    },
    <String, dynamic>{
      'node': <String, dynamic>{
        'ID': 'f7e7bb9a-6285-46dc-adf8-4b538a7df669',
        'Type': 'allergy',
        'RecordedDate': '2021-04-16',
        'Category': <dynamic>['medication'],
        'Criticality': 'high',
        'ClinicalStatus': <String, dynamic>{
          'Text': 'Active',
          'Coding': <dynamic>[
            <String, dynamic>{
              'System':
                  'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
              'Code': 'active',
              'Display': 'Active',
              'UserSelected': false
            }
          ]
        },
        'VerificationStatus': <String, dynamic>{
          'Text': 'Confirmed',
          'Coding': <dynamic>[
            <String, dynamic>{
              'System':
                  'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
              'Code': 'confirmed',
              'Display': 'confirmed',
              'UserSelected': false
            }
          ]
        },
        'Patient': <String, dynamic>{
          'Reference': 'Patient/e8dc1f10-aece-4340-b1c3-aa778e0eff01',
          'Type': 'Patient',
          'Display': 'Orina, Abiud '
        },
        'Code': <String, dynamic>{
          'Text': 'Allergenic extract, mouse',
          'Coding': <dynamic>[
            <String, dynamic>{
              'Code': '70774',
              'System': 'OCL:/orgs/CIEL/sources/CIEL/',
              'Display': 'Allergenic extract, mouse'
            }
          ]
        },
        'Encounter': <String, dynamic>{
          'Reference': 'Encounter/fe9d2aa7-5b64-4c75-a145-d4a855a9a529',
          'Type': 'Encounter'
        },
        'Asserter': <String, dynamic>{'Display': 'Calvine Otieno '},
        'Note': <dynamic>[
          <String, dynamic>{
            'AuthorString': 'Calvine Otieno ',
            'Text': 'just for test '
          }
        ],
        'Reaction': <dynamic>[
          <String, dynamic>{
            'Description': 'just for test ',
            'Severity': 'severe',
            'Substance': <String, dynamic>{
              'Text': 'Allergenic extract, mouse',
              'Coding': <dynamic>[
                <String, dynamic>{
                  'System': 'OCL:/orgs/CIEL/sources/CIEL/',
                  'Code': '70774',
                  'Display': 'Allergenic extract, mouse',
                  'UserSelected': true
                }
              ]
            }
          }
        ],
        'Recorder': <String, dynamic>{'Display': 'Calvine Otieno '}
      }
    }
  ]
};

Map<String, dynamic> conditionRelayConnectionMock = <String, dynamic>{
  'edges': <dynamic>[
    <String, dynamic>{
      'node': <String, dynamic>{
        'ID': '1f8ed9cd-8d1f-4fc8-866f-67af390a02de',
        'RecordedDate': '2021-04-20',
        'ClinicalStatus': <String, dynamic>{
          'Text': 'Active',
          'Coding': <dynamic>[
            <String, dynamic>{
              'System':
                  'http://terminology.hl7.org/CodeSystem/condition-clinical',
              'Code': 'resolved',
              'Display': 'Resolved',
              'UserSelected': true
            }
          ]
        },
        'VerificationStatus': <String, dynamic>{
          'Text': 'Confirmed',
          'Coding': <dynamic>[
            <String, dynamic>{
              'System':
                  'http://terminology.hl7.org/CodeSystem/condition-ver-status',
              'Code': 'confirmed',
              'Display': 'Confirmed',
              'UserSelected': true
            }
          ]
        },
        'Category': <dynamic>[
          <String, dynamic>{
            'Text': 'problem-list-item',
            'Coding': <dynamic>[
              <String, dynamic>{
                'System':
                    'http://terminology.hl7.org/CodeSystem/condition-category',
                'Code': 'problem-list-item',
                'Display': 'problem-list-item',
                'UserSelected': true
              }
            ]
          }
        ],
        'Subject': <String, dynamic>{
          'Reference': 'Patient/e8dc1f10-aece-4340-b1c3-aa778e0eff01',
          'Type': 'Patient',
          'Display': 'Orina, Abiud '
        },
        'Encounter': <String, dynamic>{
          'Reference': 'Encounter/45a38ba8-6c1c-491d-8ef2-350f3742f64f',
          'Type': 'Encounter'
        },
        'Evidence': null,
        'Asserter': <String, dynamic>{'Display': 'Abiud Orina'},
        'Note': <dynamic>[
          <String, dynamic>{'AuthorString': 'Abiud Orina', 'Text': 'noted'}
        ],
        'Severity': null,
        'OnsetString': null,
        'Recorder': <String, dynamic>{'Display': 'Abiud Orina'},
        'Code': <String, dynamic>{
          'Coding': <dynamic>[
            <String, dynamic>{
              'System': 'OCL:/orgs/CIEL/sources/CIEL/',
              'Code': '154531',
              'Display': 'HIV staging - mucocutaneous herpes simplex',
              'UserSelected': true
            }
          ],
          'Text': 'HIV staging - mucocutaneous herpes simplex'
        }
      },
    },
  ]
};

Map<String, dynamic> registeredPatientData = <String, dynamic>{
  'registerPatient': <String, dynamic>{
    'patientRecord': <String, dynamic>{
      'ID': '4b179736-f31a-4c55-986c-0c0785717748',
      'Name': <dynamic>[
        <String, dynamic>{
          'Text': 'john, demo',
          'Family': 'demo',
          'Given': <String>['john'],
        }
      ],
      'Telecom': <dynamic>[
        <String, dynamic>{
          'Value': '+254712345678',
        }
      ],
      'BirthDate': '2003-01-01',
      'Gender': 'male',
    },
  }
};
final Map<String, dynamic> testPatientEmptyResponses = <String, dynamic>{
  'AllergyIntolerance': <dynamic>[],
  'MedicationRequest': <dynamic>[],
  'Condition': <dynamic>[],
  'ServiceRequest': <dynamic>[],
  'Observation': <dynamic>[],
  'Encounter': <dynamic>[
    <String, dynamic>{
      'period': <String, dynamic>{'start': testDate}
    }
  ]
};
final Map<String, dynamic> testExamCompositionObjectData = <String, dynamic>{
  'ID': 'c26947db-d701-4836-a2ac-07a0b847cf3b',
  'Status': 'Preliminary',
  'Type': <String, dynamic>{
    'Text': 'Consult Note',
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': 'http://loinc.org',
        'Code': '11488-4',
        'Display': 'Consult Note',
        'UserSelected': false
      }
    ]
  },
  'Category': <String, dynamic>{
    'Text': 'Consult Note',
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': '',
        'Code': '',
        'Display': '',
        'UserSelected': '',
      }
    ]
  },
  'Author': <String, dynamic>{'Reference': null, 'Display': 'Jane Doe'},
  'Title': 'patient-history',
  'Section': <dynamic>[
    <String, dynamic>{
      'Title': 'patient-history',
      'Text': <String, dynamic>{
        'Status': 'generated',
        'Div':
            '{"description":"Consultation","symptomFever":"true","symptomNausea":"true","symptomRash":"true","symptomFatigue":"false","symptomWeighGain":"true","symptomWeightLoss":"true"}'
      }
    }
  ]
};
Map<String, dynamic> testExamCompositionObjectDataLoading = <String, dynamic>{
  'loading': true
};
Map<String, dynamic> testExamCompositionObjectDataNull = <String, dynamic>{
  'data': null
};

Map<String, dynamic> testCompositionObjectData = <String, dynamic>{
  'id': testPatientID,
  'patientRef': testPatientReference,
  'patientName': testPatientName,
  'encounterRef': testEncounterReference,
  'compositionTitle': testCompositionTitle,
  'patientHistory': testPatientHistory,
};

Map<String, dynamic> compositionData = <String, dynamic>{
  'ID': 'c26947db-d701-4836-a2ac-07a0b847cf3b',
  'Status': 'Preliminary',
  'Type': <String, dynamic>{
    'Text': 'Consult Note',
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': 'http://loinc.org',
        'Code': '11488-4',
        'Display': 'Consult Note',
        'UserSelected': false
      }
    ]
  },
  'Category': <String, dynamic>{
    'Text': 'Consult Note',
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': '',
        'Code': '',
        'Display': '',
        'UserSelected': '',
      }
    ]
  },
  'Author': <String, dynamic>{'Reference': null, 'Display': 'Jane Doe'},
  'Title': 'patient-history',
  'Section': <dynamic>[
    <String, dynamic>{
      'Title': 'patient-history',
      'Text': <String, dynamic>{
        'Status': 'generated',
        'Div':
            '{"description":"Consultation","symptomNoneKnown":"false","symptomCough":"true","symptomCongest":"false","symptomSOB":"false","symptomHaemoptysis":"false"}'
      }
    }
  ]
};

Map<String, dynamic> fhirConditionCompositionEmpty = <String, dynamic>{
  'ID': '24fe5480-6ced-47b2-8bbd-4dcd2b9b9598',
  'RecordedDate': '2021-02-03',
  'ClinicalStatus': <String, dynamic>{
    'Text': '',
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': '',
        'Code': 'Active',
        'Display': 'Active',
        'UserSelected': false
      }
    ]
  },
  'VerificationStatus': <String, dynamic>{
    'Text': 'Confirmed',
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': '',
        'Code': 'Confirmed',
        'Display': 'Confirmed',
        'UserSelected': false
      }
    ]
  },
  'Category': <dynamic>[
    <String, dynamic>{
      'Text': '',
      'Coding': <dynamic>[
        <String, dynamic>{
          'System': '',
          'Code': 'encounter-diagnosis',
          'Display': 'encounter-diagnosis',
          'UserSelected': false
        }
      ]
    }
  ],
  'Subject': <String, dynamic>{
    'Reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
    'Type': 'Patient',
    'Display': 'Patient/4b179736-f31a-4c55-986c-0c0785717748'
  },
  'Encounter': <String, dynamic>{
    'Reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
    'Type': 'Encounter'
  },
  'Evidence': null,
  'Asserter': <String, dynamic>{'Display': 'Jane Doe'},
  'Note': null,
  'Severity': null,
  'OnsetString': null,
  'Recorder': <String, String>{'Display': 'Jane Doe'},
  'Code': null
};

List<List<dynamic>> testTimelineVisitsData = <List<dynamic>>[
  <dynamic>[
    <String, dynamic>{
      'Encounter': <dynamic>[
        <String, dynamic>{
          'class': <String, dynamic>{
            'code': 'AMB',
            'display': 'ambulatory',
            'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
            'userSelected': false,
            'version': '2018-08-12'
          },
          'episodeOfCare': <dynamic>[
            <String, dynamic>{
              'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
            }
          ],
          'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
          'period': <String, dynamic>{
            'end': '2021-02-11T11:36:56+11:00',
            'start': '2021-02-03T11:33:31+11:00'
          },
          'serviceProvider': <String, dynamic>{
            'display': '123',
            'type': 'Organization'
          },
          'status': 'finished',
          'subject': <String, dynamic>{
            'display': '+254718490169',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          }
        },
      ],
    },
  ],
  <dynamic>[
    <String, dynamic>{
      'Encounter': <dynamic>[
        <String, dynamic>{
          'class': <String, dynamic>{
            'code': 'AMB',
            'display': 'ambulatory',
            'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
            'userSelected': false,
            'version': '2018-08-12'
          },
          'episodeOfCare': <dynamic>[
            <String, dynamic>{
              'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
            }
          ],
          'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
          'period': <String, dynamic>{
            'end': '2021-02-11T11:36:56+11:00',
            'start': '2021-02-03T11:33:31+11:00'
          },
          'serviceProvider': <String, dynamic>{
            'display': '123',
            'type': 'Organization'
          },
          'status': 'finished',
          'subject': <String, dynamic>{
            'display': '+254718490169',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          }
        },
      ],
    },
  ]
];

Map<String, dynamic> testEmptyPatientVisit = <String, dynamic>{
  'Encounter': <dynamic>[
    <String, dynamic>{
      'class': <String, dynamic>{
        'code': 'AMB',
        'display': 'ambulatory',
        'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
        'userSelected': false,
        'version': '2018-08-12'
      },
      'episodeOfCare': <dynamic>[
        <String, dynamic>{
          'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
        }
      ],
      'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
      'period': <String, dynamic>{
        'end': '2021-02-11T11:36:56+11:00',
        'start': '2021-02-03T11:33:31+11:00'
      },
      'serviceProvider': <String, dynamic>{
        'display': '123',
        'type': 'Organization'
      },
      'status': 'finished',
      'subject': <String, dynamic>{
        'display': '+254718490169',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      }
    }
  ],
};

Map<String, dynamic> testPatientVisitAllergy = <String, dynamic>{
  'AllergyIntolerance': <dynamic>[
    <String, dynamic>{
      'asserter': <String, dynamic>{'display': 'john doe'},
      'category': <dynamic>['medication'],
      'clinicalStatus': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': 'active',
            'display': 'Active',
            'system':
                'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
            'userSelected': false
          }
        ],
        'text': 'Active'
      },
      'code': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': '75541',
            'display': 'EGG YOLK PHOSPHATIDES',
            'system': 'OCL:/orgs/CIEL/sources/CIEL/',
            'userSelected': false
          }
        ],
        'text': 'EGG YOLK PHOSPHATIDES'
      },
      'criticality': 'high',
      'encounter': <String, dynamic>{
        'display': 'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
        'reference': 'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
        'type': 'Encounter'
      },
      'id': '023850c5-83d8-4f99-b633-a31ec48130ef',
      'note': <dynamic>[
        <String, dynamic>{'authorString': 'john doe', 'text': 'very bad'}
      ],
      'patient': <String, dynamic>{
        'display': 'doe, john ',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      },
      'reaction': <dynamic>[
        <String, dynamic>{
          'description': 'very bad',
          'manifestation': <dynamic>[
            <String, dynamic>{
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': 'Manifestation ID',
                  'display': 'No manifestation provided',
                  'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                  'userSelected': true
                }
              ],
              'text': 'Manifestation Name'
            }
          ],
          'severity': 'severe',
          'substance': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '75541',
                'display': 'EGG YOLK PHOSPHATIDES',
                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                'userSelected': true
              }
            ],
            'text': 'EGG YOLK PHOSPHATIDES'
          }
        }
      ],
      'recordedDate': '2021-02-03',
      'recorder': <String, dynamic>{'display': 'john doe'},
      'type': 'allergy',
      'verificationStatus': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': 'confirmed',
            'display': 'confirmed',
            'system':
                'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
            'userSelected': false
          }
        ],
        'text': 'Confirmed'
      }
    }
  ],
  'ServiceRequest': <dynamic>[],
  'Condition': <dynamic>[],
  'Observation': <dynamic>[],
  'MedicationRequest': <dynamic>[
    <String, dynamic>{
      'asserter': <String, dynamic>{'display': 'john doe'},
      'category': <dynamic>['medication'],
      'clinicalStatus': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': 'active',
            'display': 'Active',
            'system':
                'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
            'userSelected': false
          }
        ],
        'text': 'Active'
      },
      'code': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': '75541',
            'display': 'EGG YOLK PHOSPHATIDES',
            'system': 'OCL:/orgs/CIEL/sources/CIEL/',
            'userSelected': false
          }
        ],
        'text': 'EGG YOLK PHOSPHATIDES'
      },
      'criticality': 'high',
      'encounter': <String, dynamic>{
        'display': 'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
        'reference': 'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
        'type': 'Encounter'
      },
      'id': '023850c5-83d8-4f99-b633-a31ec48130ef',
      'note': <dynamic>[
        <String, dynamic>{'authorString': 'john doe', 'text': 'very bad'}
      ],
      'patient': <String, dynamic>{
        'display': 'doe, john ',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      },
      'reaction': <dynamic>[
        <String, dynamic>{
          'description': 'very bad',
          'manifestation': <dynamic>[
            <String, dynamic>{
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': 'Manifestation ID',
                  'display': 'No manifestation provided',
                  'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                  'userSelected': true
                }
              ],
              'text': 'Manifestation Name'
            }
          ],
          'severity': 'severe',
          'substance': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '75541',
                'display': 'EGG YOLK PHOSPHATIDES',
                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                'userSelected': true
              }
            ],
            'text': 'EGG YOLK PHOSPHATIDES'
          }
        }
      ],
      'recordedDate': '2021-02-03',
      'recorder': <String, dynamic>{'display': 'john doe'},
      'type': 'allergy',
      'verificationStatus': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': 'confirmed',
            'display': 'confirmed',
            'system':
                'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
            'userSelected': false
          }
        ],
        'text': 'Confirmed'
      }
    },
  ],
  'Encounter': <dynamic>[
    <String, dynamic>{
      'class': <String, dynamic>{
        'code': 'AMB',
        'display': 'ambulatory',
        'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
        'userSelected': false,
        'version': '2018-08-12'
      },
      'episodeOfCare': <dynamic>[
        <String, dynamic>{
          'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
        }
      ],
      'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
      'period': <String, dynamic>{
        'end': '2021-02-11T11:36:56+11:00',
        'start': '2021-02-03T11:33:31+11:00'
      },
      'serviceProvider': <String, dynamic>{
        'display': '123',
        'type': 'Organization'
      },
      'status': 'finished',
      'subject': <String, dynamic>{
        'display': '+254718490169',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      }
    }
  ],
};

dynamic testPatientVisitMedication = <String, dynamic>{
  'AllergyIntolerance': <dynamic>[],
  'ServiceRequest': <dynamic>[],
  'Condition': <dynamic>[],
  'Observation': <dynamic>[],
  'Encounter': <dynamic>[
    <String, dynamic>{
      'class': <String, dynamic>{
        'code': 'AMB',
        'display': 'ambulatory',
        'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
        'userSelected': false,
        'version': '2018-08-12'
      },
      'episodeOfCare': <dynamic>[
        <String, dynamic>{
          'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
        }
      ],
      'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
      'period': <String, dynamic>{
        'end': '2021-02-11T11:36:56+11:00',
        'start': '2021-02-03T11:33:31+11:00'
      },
      'serviceProvider': <String, dynamic>{
        'display': '123',
        'type': 'Organization'
      },
      'status': 'finished',
      'subject': <String, dynamic>{
        'display': '+254718490169',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      }
    }
  ],
  'MedicationRequest': <dynamic>[
    <String, dynamic>{
      'authoredOn': '2021-02-03',
      'dosageInstruction': <dynamic>[
        <String, dynamic>{
          'patientInstruction': 'Take 5 capsules',
          'text': 'Take 5 Capsules every 2 Hours for 3 Days.'
        }
      ],
      'encounter': <String, dynamic>{
        'display': 'Encounter',
        'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
        'type': 'Encounter'
      },
      'id': '496eb5af-6be1-4c8d-94ce-44e72f27fea7',
      'intent': 'proposal',
      'medicationCodeableConcept': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': '71161',
            'display': 'AMOXICILLIN MONOSODIUM SALT',
            'system': 'OCL:/orgs/CIEL/sources/CIEL/',
            'userSelected': true
          }
        ],
        'text': 'AMOXICILLIN MONOSODIUM SALT'
      },
      'note': <dynamic>[
        <String, dynamic>{'authorString': 'john doe', 'text': ' careful'}
      ],
      'priority': 'routine',
      'requester': <String, dynamic>{'display': 'john doe'},
      'status': 'active',
      'subject': <String, dynamic>{
        'display': 'doe, john ',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      },
      'supportingInformation': <dynamic>[
        <String, dynamic>{
          'display': 'Mal de Ojo',
          'id': '24fe5480-6ced-47b2-8bbd-4dcd2b9b9598',
          'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326'
        }
      ]
    }
  ],
};

Map<String, dynamic> testPatientVisitMedicationNoMedicationAndDosage =
    <String, dynamic>{
  'AllergyIntolerance': <dynamic>[],
  'ServiceRequest': <dynamic>[],
  'Condition': <dynamic>[],
  'Observation': <dynamic>[],
  'Encounter': <dynamic>[
    <String, dynamic>{
      'class': <String, dynamic>{
        'code': 'AMB',
        'display': 'ambulatory',
        'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
        'userSelected': false,
        'version': '2018-08-12'
      },
      'episodeOfCare': <dynamic>[
        <String, dynamic>{
          'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
        }
      ],
      'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
      'period': <String, dynamic>{
        'end': '2021-02-11T11:36:56+11:00',
        'start': '2021-02-03T11:33:31+11:00'
      },
      'serviceProvider': <String, dynamic>{
        'display': '123',
        'type': 'Organization'
      },
      'status': 'finished',
      'subject': <String, dynamic>{
        'display': '+254718490169',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      }
    }
  ],
  'MedicationRequest': <dynamic>[
    <String, dynamic>{
      'authoredOn': '2021-02-03',
      'dosageInstruction': null,
      'encounter': <String, dynamic>{
        'display': 'Encounter',
        'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
        'type': 'Encounter'
      },
      'id': '496eb5af-6be1-4c8d-94ce-44e72f27fea7',
      'intent': 'proposal',
      'medicationCodeableConcept': null,
      'note': <dynamic>[
        <String, dynamic>{'authorString': 'john doe', 'text': ' careful'}
      ],
      'priority': 'routine',
      'requester': <String, dynamic>{'display': 'john doe'},
      'status': 'active',
      'subject': <String, dynamic>{
        'display': 'doe, john ',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      },
      'supportingInformation': <dynamic>[
        <String, dynamic>{
          'display': 'Mal de Ojo',
          'id': '24fe5480-6ced-47b2-8bbd-4dcd2b9b9598',
          'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326'
        }
      ]
    }
  ],
};

Map<String, dynamic> testPatientVisitServiceRequest = <String, dynamic>{
  'AllergyIntolerance': <dynamic>[],
  'MedicationRequest': <dynamic>[],
  'Condition': <dynamic>[],
  'Observation': <dynamic>[],
  'Encounter': <dynamic>[
    <String, dynamic>{
      'class': <String, dynamic>{
        'code': 'AMB',
        'display': 'ambulatory',
        'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
        'userSelected': false,
        'version': '2018-08-12'
      },
      'episodeOfCare': <dynamic>[
        <String, dynamic>{
          'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
        }
      ],
      'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
      'period': <String, dynamic>{
        'end': '2021-02-11T11:36:56+11:00',
        'start': '2021-02-03T11:33:31+11:00'
      },
      'serviceProvider': <String, dynamic>{
        'display': '123',
        'type': 'Organization'
      },
      'status': 'finished',
      'subject': <String, dynamic>{
        'display': '+254718490169',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      }
    }
  ],
  'ServiceRequest': <dynamic>[
    <String, dynamic>{
      'category': <dynamic>[
        <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '108252007',
              'display': 'Laboratory procedure',
              'system': 'http://snomed.info/sct',
              'userSelected': false
            }
          ],
          'text': 'Laboratory procedure'
        }
      ],
      'code': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': '76629-5',
            'display': 'Fasting glucose [Moles/volume] in Blood',
            'system': 'OCL:/orgs/CIEL/sources/CIEL/',
            'userSelected': true
          }
        ],
        'text': 'Fasting glucose [Moles/volume] in Blood'
      },
      'encounter': <String, dynamic>{
        'display': '2021-02-03',
        'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
        'type': 'Encounter'
      },
      'id': '13130dcc-f244-4bb9-90c7-1fe4435d6a30',
      'intent': 'plan',
      'priority': 'routine',
      'requester': <String, dynamic>{'display': 'doe, john'},
      'status': 'active',
      'subject': <String, dynamic>{
        'display': 'doe, john ',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      },
      'supportingInfo': <dynamic>[
        <String, dynamic>{
          'display': 'Diet Poor',
          'id': 'f722f3c1-7705-4f32-b041-599f85a3ee1c',
          'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326'
        }
      ]
    }
  ]
};

Map<String, dynamic> testPatientVisitServiceRequestNullDisplay =
    <String, dynamic>{
  'AllergyIntolerance': <dynamic>[],
  'MedicationRequest': <dynamic>[],
  'Observation': <dynamic>[],
  'Condition': <dynamic>[],
  'Encounter': <dynamic>[
    <String, dynamic>{
      'class': <String, dynamic>{
        'code': 'AMB',
        'display': 'ambulatory',
        'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
        'userSelected': false,
        'version': '2018-08-12'
      },
      'episodeOfCare': <dynamic>[
        <String, dynamic>{
          'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
        }
      ],
      'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
      'period': <String, dynamic>{
        'end': '2021-02-11T11:36:56+11:00',
        'start': '2021-02-03T11:33:31+11:00'
      },
      'serviceProvider': <String, dynamic>{
        'display': '123',
        'type': 'Organization'
      },
      'status': 'finished',
      'subject': <String, dynamic>{
        'display': '+254718490169',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      }
    }
  ],
  'ServiceRequest': <dynamic>[
    <String, dynamic>{
      'category': <dynamic>[
        <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '108252007',
              'display': 'Laboratory procedure',
              'system': 'http://snomed.info/sct',
              'userSelected': false
            }
          ],
          'text': 'Laboratory procedure'
        }
      ],
      'code': null,
      'encounter': <String, dynamic>{
        'display': '2021-02-03',
        'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
        'type': 'Encounter'
      },
      'id': '13130dcc-f244-4bb9-90c7-1fe4435d6a30',
      'intent': 'plan',
      'priority': 'routine',
      'requester': <String, dynamic>{'display': 'doe, john'},
      'status': 'active',
      'subject': <String, dynamic>{
        'display': 'doe, john ',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      },
      'supportingInfo': <dynamic>[
        <String, dynamic>{
          'display': 'Diet Poor',
          'id': 'f722f3c1-7705-4f32-b041-599f85a3ee1c',
          'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326'
        }
      ]
    }
  ]
};

Map<String, dynamic> testPatientVisitObservation = <String, dynamic>{
  'AllergyIntolerance': <dynamic>[],
  'MedicationRequest': <dynamic>[],
  'ServiceRequest': <dynamic>[],
  'Condition': <dynamic>[],
  'Encounter': <dynamic>[
    <String, dynamic>{
      'class': <String, dynamic>{
        'code': 'AMB',
        'display': 'ambulatory',
        'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
        'userSelected': false,
        'version': '2018-08-12'
      },
      'episodeOfCare': <dynamic>[
        <String, dynamic>{
          'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
        }
      ],
      'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
      'period': <String, dynamic>{
        'end': '2021-02-11T11:36:56+11:00',
        'start': '2021-02-03T11:33:31+11:00'
      },
      'serviceProvider': <String, dynamic>{
        'display': '123',
        'type': 'Organization'
      },
      'status': 'finished',
      'subject': <String, dynamic>{
        'display': '+254718490169',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      }
    }
  ],
  'Observation': <dynamic>[
    <String, dynamic>{
      'id': '4430faf1-8d82-4de2-8eda-bbb380b3bede',
      'status': 'preliminary',
      'code': <String, dynamic>{
        'text': 'Heart Rate',
        'coding': <dynamic>[
          <String, dynamic>{
            'display': 'Heart Rate',
            'code': '8867-4',
            'system': 'http://loinc.org',
            'userSelected': true
          }
        ]
      },
      'valueQuantity': <String, dynamic>{
        'value': 90,
        'unit': '/min',
        'system': 'http://unitsofmeasure.org',
        'code': '/min'
      },
      'referenceRange': <dynamic>[
        <String, dynamic>{
          'text': '0/min to 300/min',
          'low': <String, dynamic>{
            'value': 0,
            'unit': '/min',
            'system': 'http://unitsofmeasure.org',
            'code': 'min'
          },
          'high': <String, dynamic>{
            'value': 300,
            'unit': '/min',
            'system': 'http://unitsofmeasure.org',
            'code': '/min'
          },
          'type': <String, dynamic>{
            'text': 'Normal Range',
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'normal',
                'userSelected': false,
                'system':
                    'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                'display': 'Normal Range'
              }
            ]
          }
        }
      ],
      'interpretation': <dynamic>[
        <String, dynamic>{
          'text': 'NOMAL',
          'coding': <dynamic>[
            <String, dynamic>{
              'display': 'NORMAL',
              'code': 'N',
              'system':
                  'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
              'userSelected': false
            }
          ]
        }
      ],
      'category': <dynamic>[
        <String, dynamic>{
          'text': 'Vital Signs',
          'coding': <dynamic>[
            <String, dynamic>{
              'code': 'vital-signs',
              'system':
                  'http://terminology.hl7.org/CodeSystem/observation-category',
              'display': 'Vital Signs',
              'userSelected': false
            }
          ]
        }
      ],
      'issued': '2020-12-22T18:32:07.052015Z',
      'effectiveInstant': '2020-12-22T18:32:07.052015Z',
      'subject': <String, dynamic>{
        'reference': 'Patient/68f7edf0-44fa-4d4d-970c-79eb6069908b',
        'type': 'Patient',
        'display': 'kiara, natasha '
      },
      'encounter': <String, dynamic>{
        'reference': 'Encounter/e3af8ce5-8c75-45d9-a05f-03b9a3f57e04',
        'type': 'Encounter',
        'display': ''
      }
    }
  ],
};

Map<String, dynamic> testPatientVisitCondition = <String, dynamic>{
  'Condition': <dynamic>[
    <String, dynamic>{
      'asserter': <String, dynamic>{'display': 'john doe'},
      'category': <dynamic>[
        <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': 'problem-list-item',
              'display': 'problem-list-item',
              'system':
                  'http://terminology.hl7.org/CodeSystem/condition-category',
              'userSelected': false
            }
          ],
          'text': 'problem-list-item'
        }
      ],
      'clinicalStatus': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': 'Active',
            'display': 'Active',
            'system':
                'http://terminology.hl7.org/CodeSystem/condition-clinical',
            'userSelected': false
          }
        ],
        'text': 'Active'
      },
      'code': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': '154531',
            'display': 'Adverse reaction to flu shot',
            'system': 'OCL:/orgs/CIEL/sources/CIEL/',
            'userSelected': true
          }
        ],
        'text': 'Adverse reaction to flu shot'
      },
      'encounter': <String, dynamic>{
        'display': 'Encounter',
        'reference': 'Encounter/522ece6f-0e44-435e-8bcb-38f919b901d1',
        'type': 'Encounter'
      },
      'id': 'c18455e1-670b-4dd9-859c-878065dcb084',
      'note': <dynamic>[
        <String, dynamic>{'authorString': 'john doe', 'text': 'Consult Note'}
      ],
      'recordedDate': <dynamic>[
        <String, dynamic>{'text': '2021-02-03'}
      ],
      'recorder': <String, dynamic>{'display': 'john doe'},
      'subject': <String, dynamic>{
        'display': 'doe, john ',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      },
      'verificationStatus': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': 'confirmed',
            'display': 'Confirmed',
            'system':
                'http://terminology.hl7.org/CodeSystem/condition-ver-status',
            'userSelected': false
          }
        ],
        'text': 'Confirmed'
      }
    }
  ],
  'AllergyIntolerance': <dynamic>[],
  'MedicationRequest': <dynamic>[],
  'ServiceRequest': <dynamic>[],
  'Observation': <dynamic>[],
  'Encounter': <dynamic>[
    <String, dynamic>{
      'class': <String, dynamic>{
        'code': 'AMB',
        'display': 'ambulatory',
        'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
        'userSelected': false,
        'version': '2018-08-12'
      },
      'episodeOfCare': <dynamic>[
        <String, dynamic>{
          'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
        }
      ],
      'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
      'period': <String, dynamic>{
        'end': '2021-02-11T11:36:56+11:00',
        'start': '2021-02-03T11:33:31+11:00'
      },
      'serviceProvider': <String, dynamic>{
        'display': '123',
        'type': 'Organization'
      },
      'status': 'finished',
      'subject': <String, dynamic>{
        'display': '+254718490169',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      }
    }
  ],
};

Map<String, dynamic> testPatientVisitNullCondition = <String, dynamic>{
  'Condition': <dynamic>[
    <String, dynamic>{
      'asserter': <String, dynamic>{'display': 'john doe'},
      'category': <dynamic>[
        <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': 'problem-list-item',
              'display': 'problem-list-item',
              'system':
                  'http://terminology.hl7.org/CodeSystem/condition-category',
              'userSelected': false
            }
          ],
          'text': 'problem-list-item'
        }
      ],
      'clinicalStatus': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': 'Active',
            'display': 'Active',
            'system':
                'http://terminology.hl7.org/CodeSystem/condition-clinical',
            'userSelected': false
          }
        ],
        'text': 'Active'
      },
      'code': null,
      'encounter': <String, dynamic>{
        'display': 'Encounter',
        'reference': 'Encounter/522ece6f-0e44-435e-8bcb-38f919b901d1',
        'type': 'Encounter'
      },
      'id': 'c18455e1-670b-4dd9-859c-878065dcb084',
      'note': <dynamic>[
        <String, dynamic>{'authorString': 'john doe', 'text': 'Consult Note'}
      ],
      'recordedDate': <dynamic>[
        <String, dynamic>{'text': '2021-02-03'}
      ],
      'recorder': <String, dynamic>{'display': 'john doe'},
      'subject': <String, dynamic>{
        'display': 'doe, john ',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      },
      'verificationStatus': <String, dynamic>{
        'coding': <dynamic>[
          <String, dynamic>{
            'code': 'confirmed',
            'display': 'Confirmed',
            'system':
                'http://terminology.hl7.org/CodeSystem/condition-ver-status',
            'userSelected': false
          }
        ],
        'text': 'Confirmed'
      }
    }
  ],
  'AllergyIntolerance': <dynamic>[],
  'MedicationRequest': <dynamic>[],
  'ServiceRequest': <dynamic>[],
  'Observation': <dynamic>[],
  'Encounter': <dynamic>[
    <String, dynamic>{
      'class': <String, dynamic>{
        'code': 'AMB',
        'display': 'ambulatory',
        'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
        'userSelected': false,
        'version': '2018-08-12'
      },
      'episodeOfCare': <dynamic>[
        <String, dynamic>{
          'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
        }
      ],
      'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
      'period': <String, dynamic>{
        'end': '2021-02-11T11:36:56+11:00',
        'start': '2021-02-03T11:33:31+11:00'
      },
      'serviceProvider': <String, dynamic>{
        'display': '123',
        'type': 'Organization'
      },
      'status': 'finished',
      'subject': <String, dynamic>{
        'display': '+254718490169',
        'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
        'type': 'Patient'
      }
    }
  ],
};

Map<String, dynamic> loginByPhoneEndpointResponse = <String, dynamic>{
  'auth': <String, dynamic>{
    'can_experiment': false,
    'customToken':
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI4NDE5NDc3NTQ4NDctY29tcHV0ZUBkZXZlbG9wZXIuZ3NlcnZpY2VhY2NvdW50LmNvbSIsImF1ZCI6Imh0dHBzOi8vaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tL2dvb2dsZS5pZGVudGl0eS5pZGVudGl0eXRvb2xraXQudjEuSWRlbnRpdHlUb29sa2l0IiwiZXhwIjoxNjE0MDg4MDk2LCJpYXQiOjE2MTQwODQ0OTYsInN1YiI6Ijg0MTk0Nzc1NDg0Ny1jb21wdXRlQGRldmVsb3Blci5nc2VydmljZWFjY291bnQuY29tIiwidWlkIjoiMGNOSUE5UVQyOGJlT3EwNWp5TXJkVXoxR3RFMiJ9.gW1D5PoediYBoyyy0IDGeznfyfSHc1Ismhfezb-AXzbsGaBFOP7GM2X4YrdSbOEBmRCawNYsxJt5pskl8S4Ixo45TFbh6_3vTfghJ5R3Dm8EIAzDYhhgbGLrjY6tUwkyeKF1rAyGAkARMZpE0ZBVBOXatmvYlFqssAj7ChWElyCaaq6sW_H5ZBS8z_u5FzkvccZzzaCfIB-VQCVyo_wRGwdjOxaa0QTbHk-5THQ7ePCHPIxYFvCRO9Jb8hlXqm1LtvEyhAFt34F9FWPTaKQfKNfD09kaM5UR5kck7iAtv4q2KKNrh4lHr_O0abGiR8DLj-XS9zTOr3cPHN4-51oUSQ',
    'expires_in': '3600',
    'id_token':
        'eyJhbGciOiJSUzI1NiIsImtpZCI6IjBlYmMyZmI5N2QyNWE1MmQ5MjJhOGRkNTRiZmQ4MzhhOTk4MjE2MmIiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiQWJkaSBBZGFuIiwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL2Jld2VsbC1hcHAiLCJhdWQiOiJiZXdlbGwtYXBwIiwiYXV0aF90aW1lIjoxNjE0MDg0NDk3LCJ1c2VyX2lkIjoiMGNOSUE5UVQyOGJlT3EwNWp5TXJkVXoxR3RFMiIsInN1YiI6IjBjTklBOVFUMjhiZU9xMDVqeU1yZFV6MUd0RTIiLCJpYXQiOjE2MTQwODQ0OTcsImV4cCI6MTYxNDA4ODA5NywicGhvbmVfbnVtYmVyIjoiKzI1NDcyMzA3MzU1MiIsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsicGhvbmUiOlsiKzI1NDcyMzA3MzU1MiJdfSwic2lnbl9pbl9wcm92aWRlciI6ImN1c3RvbSJ9fQ.mpZvC5NyFnV0M4dqnGEdCKrhjIVojCUsl6r9Fb6TfTcfwcJoNvDPdpv5c96EbeO5mpm_4-e1NjRPALEur8h_GCBMcrwgCXmuLnpVgoWo9qf9CYk4bDjOrSdq_gWPVeeRZ5by5FXtYDMCsG0eOESRTzAgYCDOEkFPeuCmavHax9ibyC_72A5Olxw7tFvGwx0Kh47H-H9k8ByiYzGTturA9zQ9Xndb3-Py8-TYvCy28TIk7uqQqqxVoo26IKzauDpqNCV-plsHvnHHe1y2rkAgcTRf5p2hQJiMlPBepr2pJuzW34l3D81lcs2mX3Y-9a_Sq16b9G4vR2zvAk2Bz0fqZw',
    'is_anonymous': false,
    'refresh_token':
        'AOvuKvRBjlFRoxbajfa6B8A7w2RNAXBGSJB--e1MZhF-VIuTAwpG9kmjOyjobZH2jZx6cAbSLZEpq_4TZZbjTS4IfXqmzmanmW3fHgWuSY3qVrZIKKuvjnBnqEAKP-k2jOK0_FU1z1GXlqLPlEXQ6_F9lfvTtXqjgNYlc-_8UXWUh3r9GBEl3J0',
    'uid': '0cNIA9QT28beOq05jyMrdUz1GtE2'
  },
  'communicationSettings': <String, dynamic>{
    'allowEmail': true,
    'allowPush': false,
    'allowTextSMS': false,
    'allowWhatsApp': false,
    'id': '4a404294-de60-4c9d-9413-42f707c98d05',
    'profileID': '96bcaf56-88fe-4f52-af96-a3d9a85568ed'
  },
  'customerProfile': null,
  'profile': <String, dynamic>{
    'id': '96bcaf56-88fe-4f52-af96-a3d9a85568ed',
    'primaryEmailAddress': null,
    'primaryPhone': '+254723073552',
    'pushTokens': <dynamic>[
      'caIjC3rASJuO4hWhyhCJrC:APA91bEzRDPYS3p1uMG6s9yC4mzYETN_0wNdF1rcplSraBa0SXLDXl4-RgdRVhm2geH62duki24UPOclnmb0SZrFI5ckj-YWodmDvdN3IT-QRUUpO87ZjA2gveqbUBmFLE_uzoPLgdd7',
      'dJw710d9ToaPcNgVBa1Nas:APA91bEfd6nFfqZnj1CL9WFyEFpxxAyex6ov-6MUaHFbOYEpcrwmk4o7c0yJWmHBplAI5rCFb0XuCMYEfsLEmrmPmIHuUs6ELCL2VD1Zja9GIF2MnIBFdQJs4ojsyArLBEWcNZJP7zsr',
      'eXSuHSroRwak94qBF7QG8Q:APA91bGGf0zMagCW3T-ZeyKhmB7-fKdkzhsLC2t8Mmf4nhzR6LC0xuOGd6gbk6bbySiQRfLHn03kePX4Z-oyqScmXgwCmjOZqWwMobxZwmROa8FDoLvAVGRmreO83ouv08p3qemdnnZ5',
      'fX4EJDmxTnycoiElcb-VFE:APA91bEilr4B32VKb2nDt2V-wDUZFPVOaUvEKMsu5AUzYueLfdyCCdc7gASzYE0hnaSqAD8zznLVvL1aUCI3BVApwG4HTkWLv72IlE7Ngryx_G1SkSq2AAPFbMM8hhmiCu2xxB4GI1hW',
      'fx_GqPnzTh-d7ieWdUmgdv:APA91bFRZV80Ql_-wBxoIoF34YUqEZ2q5I1W-18XX6gAd9MTYCwgazpQfeGVYb7WomxLue8yVDp2DaccO-oGM8H7jL9dLG0fW68TGmOpHANQoX3qXu9JPTDXwF7lkPT8VbKdfoi9jE6l',
      'c_33BrXzSyKybfwtwTK9sV:APA91bHAOBSTaaZZzoCmPIoRNJhnwIZNVlZIZ6Gn8keaZzdFwYPuzbK0bQ2vGGOxs0LKtdDHJTahFULsSMgpbeBwgJzwmg3F3K5uiXGcmBx9DuKiXhjFTn7rLxK-VRxWICKNQMZ5JQYJ',
      'dfjOkmHBSumAzOkmhQfu2t:APA91bGAznrB5sS978dXhma2XPMkUTBjnwvwE9JRG7OW-1Tebq32673Iiu5koLHWLhW70KKuV_KC2JvLUmC6Awp1MRzqGlwYHOeOZgPh0yajyafiNryzqc7Rg8GHWFIf_4nXBytt1OFk',
      'ephCJJakS7imrZFAJ1GB4X:APA91bGBIkb4Xa7V8TnaVtCAHVKMbcgfuZhLcVDNQUubNpM2XjG7LbBcaWQS7ZlWWWKDB8lI_oqUhb3hTwQXrNCTCXTyb1a_N32FfYR8st3bP7kAbWrp0vU5CJIopkHuyd3HSK8VDuEy',
      '359092050465370'
    ],
    'secondaryEmailAddresses': null,
    'secondaryPhoneNumbers': null,
    'suspended': false,
    'terms_accepted': true,
    'userBioData': <String, dynamic>{
      'dateOfBirth': null,
      'firstName': 'Test',
      'gender': '',
      'lastName': 'Be.Well'
    },
    'userName': '@pensive_lederberg9771254',
    'verifiedIdentifiers': <dynamic>[
      <String, dynamic>{
        'loginProvider': 'PHONE',
        'timeStamp': '2021-01-27T12:48:54.714554Z',
        'uid': '0cNIA9QT28beOq05jyMrdUz1GtE2'
      }
    ],
    'verifiedUIDS': <dynamic>['0cNIA9QT28beOq05jyMrdUz1GtE2']
  },
};

final Map<String, dynamic> patientDiagnosisEmpty = <String, dynamic>{
  'ID': '24fe5480-6ced-47b2-8bbd-4dcd2b9b9598',
  'RecordedDate': '2021-02-03',
  'ClinicalStatus': <String, dynamic>{
    'Text': '',
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': '',
        'Code': 'Active',
        'Display': 'Active',
        'UserSelected': false
      }
    ]
  },
  'VerificationStatus': <String, dynamic>{
    'Text': 'Confirmed',
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': '',
        'Code': 'Confirmed',
        'Display': 'Confirmed',
        'UserSelected': false
      }
    ]
  },
  'Category': <dynamic>[
    <String, dynamic>{
      'Text': '',
      'Coding': <dynamic>[
        <String, dynamic>{
          'System': '',
          'Code': null,
          'Display': 'encounter-diagnosis',
          'UserSelected': false
        }
      ]
    }
  ],
  'Subject': <String, dynamic>{
    'Reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
    'Type': 'Patient',
    'Display': 'Patient/4b179736-f31a-4c55-986c-0c0785717748'
  },
  'Encounter': <String, dynamic>{
    'Reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
    'Type': 'Encounter'
  },
  'Evidence': null,
  'Asserter': <String, dynamic>{'Display': 'Jane Doe'},
  'Note': null,
  'Severity': null,
  'OnsetString': null,
  'Recorder': <String, String>{'Display': 'Jane Doe'},
  'Code': null
};

final Map<String, dynamic> patientExamDiagnosisData = <String, dynamic>{
  'ID': '7bdba5ac-f726-4cec-8064-12328f9032f6',
  'RecordedDate': '2021-02-03',
  'ClinicalStatus': <String, dynamic>{
    'Text': 'Active',
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': 'http://terminology.hl7.org/CodeSystem/condition-clinical',
        'Code': 'Active',
        'Display': 'Active',
        'UserSelected': false
      }
    ]
  },
  'VerificationStatus': <String, dynamic>{
    'Text': 'Confirmed',
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': 'http://terminology.hl7.org/CodeSystem/condition-ver-status',
        'Code': 'confirmed',
        'Display': 'Confirmed',
        'UserSelected': false
      }
    ]
  },
  'Category': <dynamic>[
    <String, dynamic>{
      'Text': 'encounter-diagnosis',
      'Coding': <dynamic>[
        <String, dynamic>{
          'System': 'http://terminology.hl7.org/CodeSystem/condition-category',
          'Code': 'encounter-diagnosis',
          'Display': 'encounter-diagnosis',
          'UserSelected': false
        }
      ]
    }
  ],
  'Subject': <String, dynamic>{
    'Reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
    'Type': 'Patient',
    'Display': 'Patient/4b179736-f31a-4c55-986c-0c0785717748'
  },
  'Encounter': <String, dynamic>{
    'Reference': 'Encounter/ff31e342-6ccf-4878-ad57-d43a9b06db78',
    'Type': 'Encounter'
  },
  'Evidence': null,
  'Asserter': <String, dynamic>{'Display': 'Jane Doe'},
  'Note': <dynamic>[
    <String, dynamic>{
      'AuthorString': 'Jane Doe',
      'Text': 'No notes provided',
    }
  ],
  'Severity': null,
  'OnsetString': null,
  'Recorder': <String, dynamic>{'Display': 'Jane Doe'},
  'Code': <String, dynamic>{
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': 'OCL:/orgs/CIEL/sources/CIEL/',
        'Code': '',
        'Display': 'Mal de Ojo',
        'UserSelected': true
      }
    ],
    'Text': 'Mal de Ojo'
  }
};

//chief complaint
Map<String, dynamic> inactiveChiefComplaintMock = <String, dynamic>{
  'data': <String, dynamic>{
    'searchFHIRCondition': <String, dynamic>{
      'edges': <dynamic>[
        <String, dynamic>{
          'node': <String, dynamic>{
            'ClinicalStatus': <String, dynamic>{'Text': 'InActive'},
            'category': <dynamic>[
              <String, dynamic>{
                'coding': <dynamic>[
                  <String, dynamic>{
                    'code': 'encounter-diagnosis',
                    'display': 'encounter-diagnosis',
                    'system':
                        'http://terminology.hl7.org/CodeSystem/condition-category',
                    'userSelected': false
                  }
                ],
                'text': 'encounter-diagnosis'
              }
            ],
            'RecordedDate': '2021-02-03',
            'Recorder': <String, dynamic>{'Display': 'john doe'},
            'Code': <String, dynamic>{'Text': 'Adverse reaction to flu shot'},
          }
        }
      ]
    },
  },
};

Map<String, dynamic> patientExamSummaryMock = <String, dynamic>{
  'data': <String, dynamic>{
    'visitSummary': <String, dynamic>{
      'AllergyIntolerance': <dynamic>[
        <String, dynamic>{
          'asserter': <String, dynamic>{'display': 'L B'},
          'category': <dynamic>['medication'],
          'clinicalStatus': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'active',
                'display': 'Active',
                'system':
                    'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
                'userSelected': false
              }
            ],
            'text': 'Active'
          },
          'code': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '70848',
                'display': 'ALLERGENIC EXTRACT,POLLEN',
                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                'userSelected': false
              }
            ],
            'text': 'ALLERGENIC EXTRACT,POLLEN'
          },
          'criticality': 'high',
          'encounter': <String, dynamic>{
            'display': 'Encounter5377d069-cb0a-4fde-a3a3-d654e1710dab',
            'reference': 'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab',
            'type': 'Encounter'
          },
          'id': '3ae4a80a-c446-4e41-938c-01765a532d68',
          'note': <dynamic>[
            <String, dynamic>{'authorString': 'L B', 'text': 'pollen ni noma'}
          ],
          'patient': <String, dynamic>{
            'display': 'bichanga, lbbc ',
            'reference': 'Patient/284ce6c5-13ff-4ba5-9838-20cd9417b071',
            'type': 'Patient'
          },
          'reaction': <dynamic>[
            <String, dynamic>{
              'description': 'pollen ni noma',
              'manifestation': <dynamic>[
                <String, dynamic>{
                  'coding': <dynamic>[
                    <String, dynamic>{
                      'code': 'Manifestation ID',
                      'display': 'No manifestation provided',
                      'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                      'userSelected': true
                    }
                  ],
                  'text': 'Manifestation Name'
                }
              ],
              'severity': 'severe',
              'substance': <String, dynamic>{
                'coding': <dynamic>[
                  <String, dynamic>{
                    'code': '70848',
                    'display': 'ALLERGENIC EXTRACT,POLLEN',
                    'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                    'userSelected': true
                  }
                ],
                'text': 'ALLERGENIC EXTRACT,POLLEN'
              }
            }
          ],
          'recordedDate': '2021-02-19',
          'recorder': <String, dynamic>{'display': 'L B'},
          'type': 'allergy',
          'verificationStatus': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'confirmed',
                'display': 'confirmed',
                'system':
                    'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
                'userSelected': false
              }
            ],
            'text': 'Confirmed'
          }
        },
      ],
      'Composition': <dynamic>[
        <String, dynamic>{
          'author': <dynamic>[
            <String, dynamic>{'display': 'Jane Doe'}
          ],
          'category': <dynamic>[
            <String, dynamic>{
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': '11488-4',
                  'display': 'Consult Note',
                  'system': 'http://loinc.org',
                  'userSelected': false
                }
              ],
              'text': 'Consult Note'
            }
          ],
          'date': '2021-02-03',
          'encounter': <String, dynamic>{
            'display': 'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
            'reference': 'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
            'type': 'Encounter'
          },
          'id': '5ecc77a3-df2e-47a6-95a9-58ee4b8415bb',
          'section': <dynamic>[
            <String, dynamic>{
              'text': <String, dynamic>{
                'div': '''
{"description":null,"symptomNoneKnown":"false","symptomCough":"true","symptomCongest":"false","symptomSOB":"false","symptomHaemoptysis":"true"}''',
                'status': 'generated'
              },
              'title': 'respiratory'
            }
          ],
          'status': 'preliminary',
          'subject': <String, dynamic>{
            'display': 'doe, jane ',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          },
          'title': 'review-of-systems',
          'type': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '11488-4',
                'display': 'Consult Note',
                'system': 'http://loinc.org',
                'userSelected': false
              }
            ],
            'text': 'Consult Note'
          }
        }
      ],
      'Condition': <dynamic>[
        <String, dynamic>{
          'asserter': <String, dynamic>{'display': 'john doe'},
          'category': <dynamic>[
            <String, dynamic>{
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': 'encounter-diagnosis',
                  'display': 'problem-list-item',
                  'system':
                      'http://terminology.hl7.org/CodeSystem/condition-category',
                  'userSelected': false
                }
              ],
              'text': 'problem-list-item'
            }
          ],
          'clinicalStatus': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'Active',
                'display': 'Active',
                'system':
                    'http://terminology.hl7.org/CodeSystem/condition-clinical',
                'userSelected': false
              }
            ],
            'text': 'Active'
          },
          'code': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '154531',
                'display': 'Adverse reaction to flu shot',
                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                'userSelected': true
              }
            ],
            'text': 'Adverse reaction to flu shot'
          },
          'encounter': <String, dynamic>{
            'display': 'Encounter',
            'reference': 'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab',
            'type': 'Encounter'
          },
          'id': 'c18455e1-670b-4dd9-859c-878065dcb084',
          'note': <dynamic>[
            <String, dynamic>{
              'authorString': 'john doe',
              'text': 'Consult Note'
            }
          ],
          'recordedDate': '2021-02-03',
          'recorder': <String, dynamic>{'display': 'john doe'},
          'subject': <String, dynamic>{
            'display': 'doe, john ',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          },
          'verificationStatus': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'confirmed',
                'display': 'Confirmed',
                'system':
                    'http://terminology.hl7.org/CodeSystem/condition-ver-status',
                'userSelected': false
              }
            ],
            'text': 'Confirmed'
          }
        }
      ],
      'Encounter': <dynamic>[
        <String, dynamic>{
          'class': <String, dynamic>{
            'code': 'AMB',
            'display': 'ambulatory',
            'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
            'userSelected': false,
            'version': '2018-08-12'
          },
          'episodeOfCare': <dynamic>[
            <String, dynamic>{
              'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
            }
          ],
          'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
          'period': <String, dynamic>{
            'end': '2021-02-11T11:36:56+11:00',
            'start': '2021-02-03T11:33:31+11:00'
          },
          'serviceProvider': <String, dynamic>{
            'display': '123',
            'type': 'Organization'
          },
          'status': 'finished',
          'subject': <String, dynamic>{
            'display': '+254718490169',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          }
        }
      ],
      'MedicationRequest': <dynamic>[
        <String, dynamic>{
          'authoredOn': '2021-02-03',
          'dosageInstruction': <dynamic>[
            <String, dynamic>{
              'patientInstruction': 'Take 5 capsules',
              'text': 'Take 5 Capsules every 2 Hours for 3 Hours.'
            }
          ],
          'encounter': <String, dynamic>{
            'display': 'Encounter',
            'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
            'type': 'Encounter'
          },
          'id': '496eb5af-6be1-4c8d-94ce-44e72f27fea7',
          'intent': 'proposal',
          'medicationCodeableConcept': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '71161',
                'display': 'AMOXICILLIN MONOSODIUM SALT',
                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                'userSelected': true
              }
            ],
            'text': 'AMOXICILLIN MONOSODIUM SALT'
          },
          'note': <dynamic>[
            <String, dynamic>{'authorString': 'john doe', 'text': ' careful'}
          ],
          'priority': 'routine',
          'requester': <String, dynamic>{'display': 'john doe'},
          'status': 'active',
          'subject': <String, dynamic>{
            'display': 'doe, john ',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          },
          'supportingInformation': <dynamic>[
            <String, dynamic>{
              'display': 'Mal de Ojo',
              'id': 'c18455e1-670b-4dd9-859c-878065dcb084',
              'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
              'status': 'active'
            }
          ]
        }
      ],
      'Observation': <dynamic>[
        <String, dynamic>{
          'id': '4430faf1-8d82-4de2-8eda-bbb380b3bede',
          'status': 'preliminary',
          'code': <String, dynamic>{
            'text': 'Heart Rate',
            'coding': <dynamic>[
              <String, dynamic>{
                'display': 'Heart Rate',
                'code': '8867-4',
                'system': 'http://loinc.org',
                'userSelected': true
              }
            ]
          },
          'valueQuantity': <String, dynamic>{
            'value': 90,
            'unit': '/min',
            'system': 'http://unitsofmeasure.org',
            'code': '/min'
          },
          'referenceRange': <dynamic>[
            <String, dynamic>{
              'text': '0/min to 300/min',
              'low': <String, dynamic>{
                'value': 0,
                'unit': '/min',
                'system': 'http://unitsofmeasure.org',
                'code': 'min'
              },
              'high': <String, dynamic>{
                'value': 300,
                'unit': '/min',
                'system': 'http://unitsofmeasure.org',
                'code': '/min'
              },
              'type': <String, dynamic>{
                'text': 'Normal Range',
                'coding': <dynamic>[
                  <String, dynamic>{
                    'code': 'normal',
                    'userSelected': false,
                    'system':
                        'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                    'display': 'Normal Range'
                  }
                ]
              }
            }
          ],
          'interpretation': <dynamic>[
            <String, dynamic>{
              'text': 'NOMAL',
              'coding': <dynamic>[
                <String, dynamic>{
                  'display': 'NORMAL',
                  'code': 'N',
                  'system':
                      'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
                  'userSelected': false
                }
              ]
            }
          ],
          'category': <dynamic>[
            <String, dynamic>{
              'text': 'Vital Signs',
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': 'vital-signs',
                  'system':
                      'http://terminology.hl7.org/CodeSystem/observation-category',
                  'display': 'Vital Signs',
                  'userSelected': false
                }
              ]
            }
          ],
          'issued': '2020-12-22T18:32:07.052015Z',
          'effectiveInstant': '2020-12-22T18:32:07.052015Z',
          'subject': <String, dynamic>{
            'reference': 'Patient/68f7edf0-44fa-4d4d-970c-79eb6069908b',
            'type': 'Patient',
            'display': 'kiara, natasha '
          },
          'encounter': <String, dynamic>{
            'reference': 'Encounter/e3af8ce5-8c75-45d9-a05f-03b9a3f57e04',
            'type': 'Encounter',
            'display': ''
          }
        }
      ],
      'ServiceRequest': <dynamic>[
        <String, dynamic>{
          'category': <dynamic>[
            <String, dynamic>{
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': '108252007',
                  'display': 'Laboratory procedure',
                  'system': 'http://snomed.info/sct',
                  'userSelected': false
                }
              ],
              'text': 'Laboratory procedure'
            }
          ],
          'code': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '76629-5',
                'display': 'Fasting glucose [Moles/volume] in Blood',
                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                'userSelected': true
              }
            ],
            'text': 'Fasting glucose [Moles/volume] in Blood'
          },
          'encounter': <String, dynamic>{
            'display': '2021-02-03',
            'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
            'type': 'Encounter'
          },
          'id': '13130dcc-f244-4bb9-90c7-1fe4435d6a30',
          'intent': 'plan',
          'priority': 'routine',
          'requester': <String, dynamic>{'display': 'doe, john'},
          'status': 'active',
          'subject': <String, dynamic>{
            'display': 'doe, john ',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          },
          'supportingInfo': <dynamic>[
            <String, dynamic>{
              'display': 'Diet Poor',
              'id': 'f722f3c1-7705-4f32-b041-599f85a3ee1c',
              'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326'
            }
          ]
        }
      ]
    }
  }
};

Map<String, dynamic> patientExamSummaryEmptyConditionsMock = <String, dynamic>{
  'data': <String, dynamic>{
    'visitSummary': <String, dynamic>{
      'AllergyIntolerance': <dynamic>[
        <String, dynamic>{
          'asserter': <String, dynamic>{'display': 'L B'},
          'category': <dynamic>['medication'],
          'clinicalStatus': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'active',
                'display': 'Active',
                'system':
                    'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
                'userSelected': false
              }
            ],
            'text': 'Active'
          },
          'code': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '70848',
                'display': 'ALLERGENIC EXTRACT,POLLEN',
                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                'userSelected': false
              }
            ],
            'text': 'ALLERGENIC EXTRACT,POLLEN'
          },
          'criticality': 'high',
          'encounter': <String, dynamic>{
            'display': 'Encounter5377d069-cb0a-4fde-a3a3-d654e1710dab',
            'reference': 'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab',
            'type': 'Encounter'
          },
          'id': '3ae4a80a-c446-4e41-938c-01765a532d68',
          'note': <dynamic>[
            <String, dynamic>{'authorString': 'L B', 'text': 'pollen ni noma'}
          ],
          'patient': <String, dynamic>{
            'display': 'bichanga, lbbc ',
            'reference': 'Patient/284ce6c5-13ff-4ba5-9838-20cd9417b071',
            'type': 'Patient'
          },
          'reaction': <dynamic>[
            <String, dynamic>{
              'description': 'pollen ni noma',
              'manifestation': <dynamic>[
                <String, dynamic>{
                  'coding': <dynamic>[
                    <String, dynamic>{
                      'code': 'Manifestation ID',
                      'display': 'No manifestation provided',
                      'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                      'userSelected': true
                    }
                  ],
                  'text': 'Manifestation Name'
                }
              ],
              'severity': 'severe',
              'substance': <String, dynamic>{
                'coding': <dynamic>[
                  <String, dynamic>{
                    'code': '70848',
                    'display': 'ALLERGENIC EXTRACT,POLLEN',
                    'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                    'userSelected': true
                  }
                ],
                'text': 'ALLERGENIC EXTRACT,POLLEN'
              }
            }
          ],
          'recordedDate': '2021-02-19',
          'recorder': <String, dynamic>{'display': 'L B'},
          'type': 'allergy',
          'verificationStatus': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'confirmed',
                'display': 'confirmed',
                'system':
                    'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
                'userSelected': false
              }
            ],
            'text': 'Confirmed'
          }
        },
      ],
      'Composition': <dynamic>[
        <String, dynamic>{
          'author': <dynamic>[
            <String, dynamic>{'display': 'Jane Doe'}
          ],
          'category': <dynamic>[
            <String, dynamic>{
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': '11488-4',
                  'display': 'Consult Note',
                  'system': 'http://loinc.org',
                  'userSelected': false
                }
              ],
              'text': 'Consult Note'
            }
          ],
          'date': '2021-02-03',
          'encounter': <String, dynamic>{
            'display': 'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
            'reference': 'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
            'type': 'Encounter'
          },
          'id': '5ecc77a3-df2e-47a6-95a9-58ee4b8415bb',
          'section': <dynamic>[
            <String, dynamic>{
              'text': <String, dynamic>{
                'div': '''
{"description":null,"symptomNoneKnown":"false","symptomCough":"true","symptomCongest":"false","symptomSOB":"false","symptomHaemoptysis":"true"}''',
                'status': 'generated'
              },
              'title': 'respiratory'
            }
          ],
          'status': 'preliminary',
          'subject': <String, dynamic>{
            'display': 'doe, jane ',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          },
          'title': 'review-of-systems',
          'type': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '11488-4',
                'display': 'Consult Note',
                'system': 'http://loinc.org',
                'userSelected': false
              }
            ],
            'text': 'Consult Note'
          }
        }
      ],
      'Condition': <dynamic>[],
      'Encounter': <dynamic>[
        <String, dynamic>{
          'class': <String, dynamic>{
            'code': 'AMB',
            'display': 'ambulatory',
            'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
            'userSelected': false,
            'version': '2018-08-12'
          },
          'episodeOfCare': <dynamic>[
            <String, dynamic>{
              'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
            }
          ],
          'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
          'period': <String, dynamic>{
            'end': '2021-02-11T11:36:56+11:00',
            'start': '2021-02-03T11:33:31+11:00'
          },
          'serviceProvider': <String, dynamic>{
            'display': '123',
            'type': 'Organization'
          },
          'status': 'finished',
          'subject': <String, dynamic>{
            'display': '+254718490169',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          }
        }
      ],
      'MedicationRequest': <dynamic>[
        <String, dynamic>{
          'authoredOn': '2021-02-03',
          'dosageInstruction': <dynamic>[
            <String, dynamic>{
              'patientInstruction': 'Take 5 capsules',
              'text': 'Take 5 Capsules every 2 Hours for 3 Hours.'
            }
          ],
          'encounter': <String, dynamic>{
            'display': 'Encounter',
            'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
            'type': 'Encounter'
          },
          'id': '496eb5af-6be1-4c8d-94ce-44e72f27fea7',
          'intent': 'proposal',
          'medicationCodeableConcept': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '71161',
                'display': 'AMOXICILLIN MONOSODIUM SALT',
                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                'userSelected': true
              }
            ],
            'text': 'AMOXICILLIN MONOSODIUM SALT'
          },
          'note': <dynamic>[
            <String, dynamic>{'authorString': 'john doe', 'text': ' careful'}
          ],
          'priority': 'routine',
          'requester': <String, dynamic>{'display': 'john doe'},
          'status': 'active',
          'subject': <String, dynamic>{
            'display': 'doe, john ',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          },
          'supportingInformation': <dynamic>[
            <String, dynamic>{
              'display': 'Mal de Ojo',
              'id': 'c18455e1-670b-4dd9-859c-878065dcb084',
              'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
              'status': 'active'
            }
          ]
        }
      ],
      'Observation': <dynamic>[
        <String, dynamic>{
          'id': '4430faf1-8d82-4de2-8eda-bbb380b3bede',
          'status': 'preliminary',
          'code': <String, dynamic>{
            'text': 'Heart Rate',
            'coding': <dynamic>[
              <String, dynamic>{
                'display': 'Heart Rate',
                'code': '8867-4',
                'system': 'http://loinc.org',
                'userSelected': true
              }
            ]
          },
          'valueQuantity': <String, dynamic>{
            'value': 90,
            'unit': '/min',
            'system': 'http://unitsofmeasure.org',
            'code': '/min'
          },
          'referenceRange': <dynamic>[
            <String, dynamic>{
              'text': '0/min to 300/min',
              'low': <String, dynamic>{
                'value': 0,
                'unit': '/min',
                'system': 'http://unitsofmeasure.org',
                'code': 'min'
              },
              'high': <String, dynamic>{
                'value': 300,
                'unit': '/min',
                'system': 'http://unitsofmeasure.org',
                'code': '/min'
              },
              'type': <String, dynamic>{
                'text': 'Normal Range',
                'coding': <dynamic>[
                  <String, dynamic>{
                    'code': 'normal',
                    'userSelected': false,
                    'system':
                        'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                    'display': 'Normal Range'
                  }
                ]
              }
            }
          ],
          'interpretation': <dynamic>[
            <String, dynamic>{
              'text': 'NOMAL',
              'coding': <dynamic>[
                <String, dynamic>{
                  'display': 'NORMAL',
                  'code': 'N',
                  'system':
                      'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
                  'userSelected': false
                }
              ]
            }
          ],
          'category': <dynamic>[
            <String, dynamic>{
              'text': 'Vital Signs',
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': 'vital-signs',
                  'system':
                      'http://terminology.hl7.org/CodeSystem/observation-category',
                  'display': 'Vital Signs',
                  'userSelected': false
                }
              ]
            }
          ],
          'issued': '2020-12-22T18:32:07.052015Z',
          'effectiveInstant': '2020-12-22T18:32:07.052015Z',
          'subject': <String, dynamic>{
            'reference': 'Patient/68f7edf0-44fa-4d4d-970c-79eb6069908b',
            'type': 'Patient',
            'display': 'kiara, natasha '
          },
          'encounter': <String, dynamic>{
            'reference': 'Encounter/e3af8ce5-8c75-45d9-a05f-03b9a3f57e04',
            'type': 'Encounter',
            'display': ''
          }
        }
      ],
      'ServiceRequest': <dynamic>[
        <String, dynamic>{
          'category': <dynamic>[
            <String, dynamic>{
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': '108252007',
                  'display': 'Laboratory procedure',
                  'system': 'http://snomed.info/sct',
                  'userSelected': false
                }
              ],
              'text': 'Laboratory procedure'
            }
          ],
          'code': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '76629-5',
                'display': 'Fasting glucose [Moles/volume] in Blood',
                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                'userSelected': true
              }
            ],
            'text': 'Fasting glucose [Moles/volume] in Blood'
          },
          'encounter': <String, dynamic>{
            'display': '2021-02-03',
            'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
            'type': 'Encounter'
          },
          'id': '13130dcc-f244-4bb9-90c7-1fe4435d6a30',
          'intent': 'plan',
          'priority': 'routine',
          'requester': <String, dynamic>{'display': 'doe, john'},
          'status': 'active',
          'subject': <String, dynamic>{
            'display': 'doe, john ',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          },
          'supportingInfo': <dynamic>[
            <String, dynamic>{
              'display': 'Diet Poor',
              'id': 'f722f3c1-7705-4f32-b041-599f85a3ee1c',
              'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326'
            }
          ]
        }
      ]
    }
  }
};

Map<String, dynamic> patientExamSummaryNullMedicationRequestMock =
    <String, dynamic>{
  'data': <String, dynamic>{
    'visitSummary': <String, dynamic>{
      'AllergyIntolerance': <dynamic>[
        <String, dynamic>{
          'asserter': <String, dynamic>{'display': 'L B'},
          'category': <dynamic>['medication'],
          'clinicalStatus': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'active',
                'display': 'Active',
                'system':
                    'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
                'userSelected': false
              }
            ],
            'text': 'Active'
          },
          'code': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '70848',
                'display': 'ALLERGENIC EXTRACT,POLLEN',
                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                'userSelected': false
              }
            ],
            'text': 'ALLERGENIC EXTRACT,POLLEN'
          },
          'criticality': 'high',
          'encounter': <String, dynamic>{
            'display': 'Encounter5377d069-cb0a-4fde-a3a3-d654e1710dab',
            'reference': 'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab',
            'type': 'Encounter'
          },
          'id': '3ae4a80a-c446-4e41-938c-01765a532d68',
          'note': <dynamic>[
            <String, dynamic>{'authorString': 'L B', 'text': 'pollen ni noma'}
          ],
          'patient': <String, dynamic>{
            'display': 'bichanga, lbbc ',
            'reference': 'Patient/284ce6c5-13ff-4ba5-9838-20cd9417b071',
            'type': 'Patient'
          },
          'reaction': <dynamic>[
            <String, dynamic>{
              'description': 'pollen ni noma',
              'manifestation': <dynamic>[
                <String, dynamic>{
                  'coding': <dynamic>[
                    <String, dynamic>{
                      'code': 'Manifestation ID',
                      'display': 'No manifestation provided',
                      'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                      'userSelected': true
                    }
                  ],
                  'text': 'Manifestation Name'
                }
              ],
              'severity': 'severe',
              'substance': <String, dynamic>{
                'coding': <dynamic>[
                  <String, dynamic>{
                    'code': '70848',
                    'display': 'ALLERGENIC EXTRACT,POLLEN',
                    'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                    'userSelected': true
                  }
                ],
                'text': 'ALLERGENIC EXTRACT,POLLEN'
              }
            }
          ],
          'recordedDate': '2021-02-19',
          'recorder': <String, dynamic>{'display': 'L B'},
          'type': 'allergy',
          'verificationStatus': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'confirmed',
                'display': 'confirmed',
                'system':
                    'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
                'userSelected': false
              }
            ],
            'text': 'Confirmed'
          }
        },
      ],
      'Composition': <dynamic>[
        <String, dynamic>{
          'author': <dynamic>[
            <String, dynamic>{'display': 'Jane Doe'}
          ],
          'category': <dynamic>[
            <String, dynamic>{
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': '11488-4',
                  'display': 'Consult Note',
                  'system': 'http://loinc.org',
                  'userSelected': false
                }
              ],
              'text': 'Consult Note'
            }
          ],
          'date': '2021-02-03',
          'encounter': <String, dynamic>{
            'display': 'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
            'reference': 'Encounter/a6a3547c-7fad-497c-abd8-74091149a474',
            'type': 'Encounter'
          },
          'id': '5ecc77a3-df2e-47a6-95a9-58ee4b8415bb',
          'section': <dynamic>[
            <String, dynamic>{
              'text': <String, dynamic>{
                'div': '''
{"description":null,"symptomNoneKnown":"false","symptomCough":"true","symptomCongest":"false","symptomSOB":"false","symptomHaemoptysis":"true"}''',
                'status': 'generated'
              },
              'title': 'respiratory'
            }
          ],
          'status': 'preliminary',
          'subject': <String, dynamic>{
            'display': 'doe, jane ',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          },
          'title': 'review-of-systems',
          'type': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '11488-4',
                'display': 'Consult Note',
                'system': 'http://loinc.org',
                'userSelected': false
              }
            ],
            'text': 'Consult Note'
          }
        }
      ],
      'Condition': <dynamic>[
        <String, dynamic>{
          'asserter': <String, dynamic>{'display': 'john doe'},
          'category': <dynamic>[
            <String, dynamic>{
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': 'encounter-diagnosis',
                  'display': 'problem-list-item',
                  'system':
                      'http://terminology.hl7.org/CodeSystem/condition-category',
                  'userSelected': false
                }
              ],
              'text': 'problem-list-item'
            }
          ],
          'clinicalStatus': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'Active',
                'display': 'Active',
                'system':
                    'http://terminology.hl7.org/CodeSystem/condition-clinical',
                'userSelected': false
              }
            ],
            'text': 'Active'
          },
          'code': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '154531',
                'display': 'Adverse reaction to flu shot',
                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                'userSelected': true
              }
            ],
            'text': 'Adverse reaction to flu shot'
          },
          'encounter': <String, dynamic>{
            'display': 'Encounter',
            'reference': 'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab',
            'type': 'Encounter'
          },
          'id': 'c18455e1-670b-4dd9-859c-878065dcb084',
          'note': <dynamic>[
            <String, dynamic>{
              'authorString': 'john doe',
              'text': 'Consult Note'
            }
          ],
          'recordedDate': '2021-02-03',
          'recorder': <String, dynamic>{'display': 'john doe'},
          'subject': <String, dynamic>{
            'display': 'doe, john ',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          },
          'verificationStatus': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'confirmed',
                'display': 'Confirmed',
                'system':
                    'http://terminology.hl7.org/CodeSystem/condition-ver-status',
                'userSelected': false
              }
            ],
            'text': 'Confirmed'
          }
        }
      ],
      'Encounter': <dynamic>[
        <String, dynamic>{
          'class': <String, dynamic>{
            'code': 'AMB',
            'display': 'ambulatory',
            'system': 'http://terminology.hl7.org/CodeSystem/v3-ActCode',
            'userSelected': false,
            'version': '2018-08-12'
          },
          'episodeOfCare': <dynamic>[
            <String, dynamic>{
              'reference': 'EpisodeOfCare/9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d'
            }
          ],
          'id': '784171d3-1bbe-4a9e-9bf0-73de255b9326',
          'period': <String, dynamic>{
            'end': '2021-02-11T11:36:56+11:00',
            'start': '2021-02-03T11:33:31+11:00'
          },
          'serviceProvider': <String, dynamic>{
            'display': '123',
            'type': 'Organization'
          },
          'status': 'finished',
          'subject': <String, dynamic>{
            'display': '+254718490169',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          }
        }
      ],
      'MedicationRequest': <dynamic>[null],
      'Observation': <dynamic>[
        <String, dynamic>{
          'id': '4430faf1-8d82-4de2-8eda-bbb380b3bede',
          'status': 'preliminary',
          'code': <String, dynamic>{
            'text': 'Heart Rate',
            'coding': <dynamic>[
              <String, dynamic>{
                'display': 'Heart Rate',
                'code': '8867-4',
                'system': 'http://loinc.org',
                'userSelected': true
              }
            ]
          },
          'valueQuantity': <String, dynamic>{
            'value': 90,
            'unit': '/min',
            'system': 'http://unitsofmeasure.org',
            'code': '/min'
          },
          'referenceRange': <dynamic>[
            <String, dynamic>{
              'text': '0/min to 300/min',
              'low': <String, dynamic>{
                'value': 0,
                'unit': '/min',
                'system': 'http://unitsofmeasure.org',
                'code': 'min'
              },
              'high': <String, dynamic>{
                'value': 300,
                'unit': '/min',
                'system': 'http://unitsofmeasure.org',
                'code': '/min'
              },
              'type': <String, dynamic>{
                'text': 'Normal Range',
                'coding': <dynamic>[
                  <String, dynamic>{
                    'code': 'normal',
                    'userSelected': false,
                    'system':
                        'http://terminology.hl7.org/CodeSystem/referencerange-meaning',
                    'display': 'Normal Range'
                  }
                ]
              }
            }
          ],
          'interpretation': <dynamic>[
            <String, dynamic>{
              'text': 'NOMAL',
              'coding': <dynamic>[
                <String, dynamic>{
                  'display': 'NORMAL',
                  'code': 'N',
                  'system':
                      'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
                  'userSelected': false
                }
              ]
            }
          ],
          'category': <dynamic>[
            <String, dynamic>{
              'text': 'Vital Signs',
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': 'vital-signs',
                  'system':
                      'http://terminology.hl7.org/CodeSystem/observation-category',
                  'display': 'Vital Signs',
                  'userSelected': false
                }
              ]
            }
          ],
          'issued': '2020-12-22T18:32:07.052015Z',
          'effectiveInstant': '2020-12-22T18:32:07.052015Z',
          'subject': <String, dynamic>{
            'reference': 'Patient/68f7edf0-44fa-4d4d-970c-79eb6069908b',
            'type': 'Patient',
            'display': 'kiara, natasha '
          },
          'encounter': <String, dynamic>{
            'reference': 'Encounter/e3af8ce5-8c75-45d9-a05f-03b9a3f57e04',
            'type': 'Encounter',
            'display': ''
          }
        }
      ],
      'ServiceRequest': <dynamic>[
        <String, dynamic>{
          'category': <dynamic>[
            <String, dynamic>{
              'coding': <dynamic>[
                <String, dynamic>{
                  'code': '108252007',
                  'display': 'Laboratory procedure',
                  'system': 'http://snomed.info/sct',
                  'userSelected': false
                }
              ],
              'text': 'Laboratory procedure'
            }
          ],
          'code': <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': '76629-5',
                'display': 'Fasting glucose [Moles/volume] in Blood',
                'system': 'OCL:/orgs/CIEL/sources/CIEL/',
                'userSelected': true
              }
            ],
            'text': 'Fasting glucose [Moles/volume] in Blood'
          },
          'encounter': <String, dynamic>{
            'display': '2021-02-03',
            'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326',
            'type': 'Encounter'
          },
          'id': '13130dcc-f244-4bb9-90c7-1fe4435d6a30',
          'intent': 'plan',
          'priority': 'routine',
          'requester': <String, dynamic>{'display': 'doe, john'},
          'status': 'active',
          'subject': <String, dynamic>{
            'display': 'doe, john ',
            'reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
            'type': 'Patient'
          },
          'supportingInfo': <dynamic>[
            <String, dynamic>{
              'display': 'Diet Poor',
              'id': 'f722f3c1-7705-4f32-b041-599f85a3ee1c',
              'reference': 'Encounter/784171d3-1bbe-4a9e-9bf0-73de255b9326'
            }
          ]
        }
      ]
    }
  }
};

final http.Response getPatientInfoMockResponse = http.Response(
    json.encode(<String, dynamic>{
      'data': <String, dynamic>{
        'getPatient': <String, dynamic>{
          'hasOpenEpisodes': true,
          'openEpisodes': <dynamic>[
            <String, dynamic>{
              'ID': '9e8c04cb-5dcb-4fc6-a0bf-0e208acc262d',
              'Status': 'active',
              'Patient': <String, dynamic>{
                ' Reference': 'Patient/4b179736-f31a-4c55-986c-0c0785717748',
                ' Type': 'Patient',
                'Display': '+254718490169',
              }
            },
          ],
          'patientRecord': <String, dynamic>{
            'ID': '4b179736-f31a-4c55-986c-0c0785717748',
            'Name': <dynamic>[
              <String, dynamic>{
                'Text': 'john, demo',
              }
            ],
            'Telecom': <dynamic>[
              <String, dynamic>{
                'Value': '+254712345678',
              }
            ]
          }
        },
        'findPatientsByMSISDN': <String, dynamic>{
          'edges': <dynamic>[
            <String, dynamic>{
              'hasOpenEpisodes': true,
              'node': <String, dynamic>{
                ' ID': '4b179736-f31a-4c55-986c-0c0785717748',
                'Active': true,
                'Gender': 'male',
                'BirthDate': '2002-12-16',
                'Telecom': <dynamic>[
                  <String, dynamic>{
                    'System': 'info@healthcloud.co.ke',
                    'Value': '+254712345678',
                  }
                ],
                'Name': <dynamic>[
                  <String, dynamic>{
                    'Given': <String>['john'],
                    ' Family': 'demo',
                    'Use': 'official',
                    'Text': 'john, demo',
                    'Prefix': null,
                    'Suffix': null,
                    'Period': <String, dynamic>{
                      'start': '2020-12-16T14:26:50+02:00',
                      'End': '2121-03-02T14:26:50+02:00',
                    }
                  }
                ],
                'Photo': <dynamic>[
                  <String, dynamic>{
                    'contentType': 'JPG',
                    'language': 'English',
                    'Data': '/9j/4AAQSkZJRgABAQAASABIAAD',
                    'URL':
                        'https://storage.googleapis.com/healthcloud_bewell_api_gateway_uploads/image_picker_97C0EF6F-39F1-4F48-91B4-9CC6AA227762-24717-000009864F540F05.jpg',
                    'size': 52757,
                    'Hash':
                        '67R7oAvE8rIfFrsIZ65zVd4c34MaErSvKullfwxQ6iAIDcRdtmEl86sQi6vpCu+K3cKmAcWbgGXvWO8mdA7Bcg==',
                    'Title': null,
                  }
                ]
              }
            }
          ],
        }
      }
    }),
    201);

final http.Response findPatientResponseMock = http.Response(
    json.encode(
      <String, dynamic>{
        'data': <String, dynamic>{
          'findPatientsByMSISDN': <String, dynamic>{
            'edges': <dynamic>[
              <String, dynamic>{
                'hasOpenEpisodes': true,
                'node': <String, dynamic>{
                  ' ID': 'UID',
                  'Active': true,
                  'Gender': 'male',
                  'BirthDate': '2002-12-16',
                  'Telecom': <dynamic>[
                    <String, dynamic>{
                      'System': 'info@healthcloud.co.ke',
                      'Value': '+254712345678',
                    }
                  ],
                  'Name': <String, dynamic>{
                    'Given': <dynamic>['john'],
                    ' Family': 'demo',
                    'Use': 'official',
                    'Text': 'john, demo',
                    'Prefix': null,
                    'Suffix': null,
                    'Period': <String, dynamic>{
                      'start': '2020-12-16T14:26:50+02:00',
                      'End': '2121-03-02T14:26:50+02:00',
                    }
                  },
                  'Photo': <String, dynamic>{
                    'ID': 'PHOTOID',
                    'contentType': 'JPG',
                    'language': 'English',
                    'Data': '/9j/4AAQSkZJRgABAQAASABIAAD',
                    'URL':
                        'https://storage.googleapis.com/healthcloud_bewell_api_gateway_uploads/image_picker_97C0EF6F-39F1-4F48-91B4-9CC6AA227762-24717-000009864F540F05.jpg',
                    'size': 52757,
                    'Hash':
                        '67R7oAvE8rIfFrsIZ65zVd4c34MaErSvKullfwxQ6iAIDcRdtmEl86sQi6vpCu+K3cKmAcWbgGXvWO8mdA7Bcg==',
                    'Title': null,
                  }
                }
              }
            ],
          }
        }
      },
    ),
    201);

final String findPatientByMSISDNJson = json.encode(
  <String, dynamic>{
    'data': <String, dynamic>{
      'findPatientsByMSISDN': <String, dynamic>{
        'edges': <dynamic>[
          <String, dynamic>{
            'hasOpenEpisodes': false,
            'node': <String, dynamic>{
              'ID': '123456789',
              'Active': true,
              'Gender': 'male',
              'BirthDate': '01012000',
              'Telecom': <dynamic>[
                <String, dynamic>{
                  'System': 'info@healthcloud.co.ke',
                  'Value': '+254712345678',
                }
              ],
              'Name': <dynamic>[
                <String, dynamic>{
                  'Given': <dynamic>['john'],
                  ' Family': 'demo',
                  'Use': 'official',
                  'Text': 'john, demo',
                  'Prefix': null,
                  'Suffix': null,
                  'Period': <String, dynamic>{
                    'start': '2020-12-16T14:26:50+02:00',
                    'End': '2121-03-02T14:26:50+02:00',
                  }
                }
              ],
              'Photo': <dynamic>[
                <String, dynamic>{
                  'ID': 'PHOTOID',
                  'contentType': 'JPG',
                  'language': 'English',
                  'Data': mockBase64Image,
                  'URL':
                      'https://storage.googleapis.com/healthcloud_bewell_api_gateway_uploads/image_picker_97C0EF6F-39F1-4F48-91B4-9CC6AA227762-24717-000009864F540F05.jpg',
                  'size': 52757,
                  'Hash':
                      '67R7oAvE8rIfFrsIZ65zVd4c34MaErSvKullfwxQ6iAIDcRdtmEl86sQi6vpCu+K3cKmAcWbgGXvWO8mdA7Bcg==',
                  'Title': null,
                }
              ]
            }
          }
        ]
      }
    }
  },
);

Map<String, dynamic> helpCenterFAQMock = <String, dynamic>{
  'data': <String, dynamic>{
    'getFaqsContent': <dynamic>[
      <String, dynamic>{
        'id': '5f89b9120251c700391da360',
        'createdAt': '2020-10-16T18:15:30+03:00',
        'excerpt': 'PRO',
        'featureImage':
            'https://images.unsplash.com/photo-1525466760727-1d8be8721154?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2000&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ',
        'html': 'Reach 100 percent coverage first',
        'publishedAt': '2020-10-16T18:19:34+03:00',
        'slug': 'how-to-add-your-cover',
        'title': 'How to add your cover',
        'readingTime': 0,
        'tags': <dynamic>[
          <String, dynamic>{
            'id': '5f89b94a0251c700391da364',
            'name': 'faqs',
            'slug': 'faqs'
          }
        ]
      }
    ]
  }
};

final Map<String, dynamic> mockAuthLoginResponse = <String, dynamic>{
  'profile': <String, dynamic>{
    'id': 'cf77a543-d5cc-427a-94ed-1b1e12dfb8f4',
    'userName': '@gifted_leavitt53101254',
    'verifiedIdentifiers': <Map<String, String>>[
      <String, String>{
        'uid': 'rnq23JxDXNMLJK3sSKNwaGWrfzp2',
        'timeStamp': '2021-04-30T09:50:01.50004Z',
        'loginProvider': 'PHONE'
      }
    ],
    'verifiedUIDS': <String>['rnq23JxDXNMLJK3sSKNwaGWrfzp2'],
    'primaryPhone': '+254717356476',
    'primaryEmailAddress': 'savannahtestacc@gmail.com',
    'secondaryPhoneNumbers': null,
    'secondaryEmailAddresses': null,
    'terms_accepted': true,
    'suspended': false,
    'photoUploadID': UNKNOWN,
    'userBioData': <String, String>{
      'firstName': 'BeWell',
      'lastName': 'Test',
      'dateOfBirth': '2003-04-30',
      'gender': 'male'
    }
  },
  'customerProfile': null,
  'communicationSettings': <String, dynamic>{
    'id': '45423625-d794-47d3-9f87-32b5a5f80c84',
    'profileID': 'cf77a543-d5cc-427a-94ed-1b1e12dfb8f4',
    'allowWhatsApp': true,
    'allowTextSMS': true,
    'allowPush': true,
    'allowEmail': true
  },
  'auth': <String, dynamic>{
    'customToken': 'custom-token',
    'id_token': 'id_token',
    'expires_in': '3600',
    'refresh_token': 'refresh_token',
    'uid': 'rnq23JxDXNMLJK3sSKNwaGWrfzp2',
    'is_admin': false,
    'is_anonymous': false,
    'can_experiment': false,
    'change_pin': false,
  },
};

final Map<String, dynamic> mockChangePinAuthLoginResponse = <String, dynamic>{
  'profile': <String, dynamic>{
    'id': 'cf77a543-d5cc-427a-94ed-1b1e12dfb8f4',
    'userName': '@gifted_leavitt53101254',
    'verifiedIdentifiers': <Map<String, String>>[
      <String, String>{
        'uid': 'rnq23JxDXNMLJK3sSKNwaGWrfzp2',
        'timeStamp': '2021-04-30T09:50:01.50004Z',
        'loginProvider': 'PHONE'
      }
    ],
    'verifiedUIDS': <String>['rnq23JxDXNMLJK3sSKNwaGWrfzp2'],
    'primaryPhone': '+254717356476',
    'primaryEmailAddress': 'savannahtestacc@gmail.com',
    'secondaryPhoneNumbers': null,
    'secondaryEmailAddresses': null,
    'terms_accepted': true,
    'suspended': false,
    'photoUploadID': UNKNOWN,
    'userBioData': <String, String>{
      'firstName': 'BeWell',
      'lastName': 'Test',
      'dateOfBirth': '2003-04-30',
      'gender': 'male'
    }
  },
  'customerProfile': null,
  'communicationSettings': <String, dynamic>{
    'id': '45423625-d794-47d3-9f87-32b5a5f80c84',
    'profileID': 'cf77a543-d5cc-427a-94ed-1b1e12dfb8f4',
    'allowWhatsApp': true,
    'allowTextSMS': true,
    'allowPush': true,
    'allowEmail': true
  },
  'auth': <String, dynamic>{
    'customToken': 'custom-token',
    'id_token': 'id_token',
    'expires_in': '3600',
    'refresh_token': 'refresh_token',
    'uid': 'rnq23JxDXNMLJK3sSKNwaGWrfzp2',
    'is_anonymous': false,
    'is_admin': false,
    'can_experiment': false,
    'change_pin': true,
  },
};

Map<String, dynamic> patientHistoryJSON = <String, dynamic>{
  'presenting': 'none',
  'medical': 'none',
  'family': 'diabetes'
};

Map<String, dynamic> respiratoryJSON = <String, dynamic>{
  'description': 'null',
  'symptomNoneKnown': 'false',
  'symptomCough': 'true',
  'symptomCongest': 'false',
  'symptomSOB': 'true',
  'symptomHaemoptysis': 'false'
};

Map<String, dynamic> genExamJSON = <String, dynamic>{
  'description': 'Consultation',
  'symptomFever': 'true',
  'symptomNausea': 'false',
  'symptomRash': 'false',
  'symptomFatigue': 'true',
  'symptomWeighGain': 'true',
  'symptomWeightLoss': 'false',
};

Map<String, dynamic> reviewOfSystemRespiratoryJson = <String, dynamic>{
  'description': null,
  'symptomNoneKnown': 'false',
  'symptomCough': 'true',
  'symptomCongest': 'true',
  'symptomSOB': 'false',
  'symptomHaemoptysis': 'false',
};

String testPath(String relativePath) {
  final Directory current = Directory.current;
  final String path =
      current.path.endsWith('/test') ? current.path : '${current.path}/test';

  return '$path/$relativePath';
}

final Map<String, dynamic> mockUserFeed = <String, dynamic>{
  'data': <String, dynamic>{
    'getFeed': <String, dynamic>{
      'uid': 'LMqDCyyciFMWHfOsvYa76L6dya73',
      'isAnonymous': false,
      'flavour': feed_obj.Flavour.PRO.name,
      'actions': <dynamic>[
        <String, dynamic>{
          'id': '1nO8hIc8ZXThjaqmQFL1XHVXgCp',
          'sequenceNumber': 1,
          'name': 'SEARCH_PATIENT',
          'actionType': feed_obj.ActionType.SECONDARY.name,
          'handling': feed_obj.Handling.FULL_PAGE.name,
          'allowAnonymous': false
        }
      ],
      'nudges': <dynamic>[
        <String, dynamic>{
          'id': '1608729954',
          'sequenceNumber': 1608729964,
          'visibility': feed_obj.Visibility.SHOW.name,
          'status': feed_obj.Status.PENDING.name,
          'title': 'Complete your rider KYC',
          'text':
              'Fill in your Be.Well business KYC in order to start transacting',
          'actions': <dynamic>[
            <String, dynamic>{
              'id': '1608647889',
              'sequenceNumber': 1608647899,
              'name': 'COMPLETE_INDIVIDUAL_RIDER_KYC',
              'actionType': feed_obj.ActionType.PRIMARY.name,
              'handling': feed_obj.Handling.FULL_PAGE.name,
              'allowAnonymous': false
            }
          ],
          'groups': <String>['hOcaUv8dqqgmWYf9HEhjdudgf0b2'],
          'users': <String>['hOcaUv8dqqgmWYf9HEhjdudgf0b2'],
          'links': <dynamic>[
            <String, dynamic>{
              'id': '1608729974',
              'url': 'https://assets.healthcloud.co.ke/bewell_logo.png',
              'linkType': feed_obj.LinkType.PNG_IMAGE.name
            }
          ],
          'notificationChannels': <String>[
            feed_obj.Channel.EMAIL.name,
            feed_obj.Channel.FCM.name
          ],
        },
      ],
      'items': <dynamic>[]
    },
  }
};

//navigation actions

List<NavigationItem> secondaryActionsMockedData = <NavigationItem>[
  NavigationItem(
      id: '234432',
      title: 'Agent',
      route: '',
      icon: NavigationIcon(
          id: '1u7E6vQxZ7Le4ZyodCuXTSDaPLs',
          iconUrl:
              'https://assets.healthcloud.co.ke/actions/svg/agent_navaction.svg',
          iconTitle: 'Agent',
          iconDescription: 'Agent Navigation action'),
      isFavourite: true),
  NavigationItem(
      id: '234432',
      title: 'Patient',
      route: '',
      icon: NavigationIcon(
          id: '1u7E6vQxZ7Le4ZyodCuXTSDaPLs',
          iconUrl:
              'https://assets.healthcloud.co.ke/actions/svg/agent_navaction.svg',
          iconTitle: 'Agent',
          iconDescription: 'Agent Navigation action'),
      nestedItems: <NavigationNestedItem>[
        NavigationNestedItem(
          title: 'Patient Registration',
          route: '/addPatient',
        ),
        NavigationNestedItem(
          title: 'Patient Identification',
          route: '/patients',
        ),
      ],
      isFavourite: false),
  NavigationItem(
      id: '234432',
      title: 'About',
      route: '',
      icon: NavigationIcon(
          id: '1u7E6vQxZ7Le4ZyodCuXTSDaPLs',
          iconUrl:
              'https://assets.healthcloud.co.ke/actions/svg/agent_navaction.svg',
          iconTitle: 'About',
          iconDescription: 'About Navigation action'),
      nestedItems: <NavigationNestedItem>[
        NavigationNestedItem(
          title: 'About Us',
          route: '',
        ),
      ],
      isFavourite: true),
  NavigationItem(
      id: '234432',
      title: navGetHelpText,
      route: '/helpCenter',
      icon: NavigationIcon(
          id: '1u7E6vQxZ7Le4ZyodCuXTSDaPLs',
          iconUrl:
              'https://assets.healthcloud.co.ke/actions/svg/help_navaction.svg',
          iconTitle: 'Help',
          iconDescription: 'Help Navigation action'),
      isFavourite: true),
];

List<NavigationItem> secondaryActionsNoFavouriteMockedData = <NavigationItem>[
  NavigationItem(
    id: '234432',
    title: 'Agent',
    route: '',
    icon: NavigationIcon(
      id: '1u7E6vQxZ7Le4ZyodCuXTSDaPLs',
      iconUrl:
          'https://assets.healthcloud.co.ke/actions/svg/agent_navaction.svg',
      iconTitle: 'Agent',
      iconDescription: 'Agent Navigation action',
    ),
    isFavourite: false,
  ),
  NavigationItem(
      id: '234432',
      title: 'Patient',
      route: '',
      icon: NavigationIcon(
          id: '1u7E6vQxZ7Le4ZyodCuXTSDaPLs',
          iconUrl:
              'https://assets.healthcloud.co.ke/actions/svg/agent_navaction.svg',
          iconTitle: 'Agent',
          iconDescription: 'Agent Navigation action'),
      nestedItems: <NavigationNestedItem>[
        NavigationNestedItem(
          title: 'Patient Registration',
          route: '/addPatient',
        ),
        NavigationNestedItem(
          title: 'Patient Identification',
          route: '/patients',
        )
      ],
      isFavourite: false),
  NavigationItem(
      id: '234432',
      title: 'About',
      route: '',
      icon: NavigationIcon(
          id: '1u7E6vQxZ7Le4ZyodCuXTSDaPLs',
          iconUrl:
              'https://assets.healthcloud.co.ke/actions/svg/agent_navaction.svg',
          iconTitle: 'About',
          iconDescription: 'About Navigation action'),
      nestedItems: <NavigationNestedItem>[
        NavigationNestedItem(
          title: 'About Us',
          route: '',
        ),
      ],
      isFavourite: false),
  NavigationItem(
      id: '234432',
      title: navGetHelpText,
      route: '/helpCenter',
      icon: NavigationIcon(
          id: '1u7E6vQxZ7Le4ZyodCuXTSDaPLs',
          iconUrl:
              'https://assets.healthcloud.co.ke/actions/svg/help_navaction.svg',
          iconTitle: 'Help',
          iconDescription: 'Help Navigation action'),
      isFavourite: false),
];

List<NavigationItem> secondaryActionsEmptyMockedData = <NavigationItem>[];

List<NavigationItem> primaryActionsMockedData = <NavigationItem>[
  NavigationItem(
      icon: NavigationIcon(
          id: '1u7E6vQxZ7Le4ZyodCuXTSDaPLs',
          iconUrl:
              'https://assets.healthcloud.co.ke/actions/svg/home_navaction.svg',
          iconTitle: navHomeText,
          iconDescription: homeIconDescription),
      title: navHomeText,
      isFavourite: false,
      route: homePageRoute),
  NavigationItem(
      icon: NavigationIcon(
        id: '1uLlySEd2Em4PPPE2NQ8lFBbKEi',
        iconUrl:
            'https://assets.healthcloud.co.ke/actions/svg/kyc_navaction.svg',
        iconTitle: navRequestsText,
        iconDescription: requestsIconDescription,
      ),
      title: navRequestsText,
      isFavourite: false,
      route: ''),
  NavigationItem(
      icon: NavigationIcon(
          id: '1uLlyMkObz6sekIQhsRI1J1NBH8',
          iconUrl:
              'https://assets.healthcloud.co.ke/actions/svg/partner_navaction.svg',
          iconTitle: navPartnerText,
          iconDescription: partnerIconDescription),
      title: navPartnerText,
      isFavourite: false,
      route: ''),
  NavigationItem(
      icon: NavigationIcon(
          id: '1uLlyNoysESvkeXLrTN2oOCxz9x',
          iconUrl:
              'https://assets.healthcloud.co.ke/actions/svg/consumer_navaction.svg',
          iconTitle: navConsumerText,
          iconDescription: consumerIconDescription),
      title: navConsumerText,
      isFavourite: false,
      route: '')
];
