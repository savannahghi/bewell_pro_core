import 'dart:async';
import 'dart:convert';

import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

http.StreamedResponse simpleResponse(
    {required String body, required int status}) {
  final List<int> bytes = utf8.encode(body);
  final Stream<List<int>> stream =
      Stream<List<int>>.fromIterable(<List<int>>[bytes]);

  final http.StreamedResponse r = http.StreamedResponse(stream, status);

  return r;
}

typedef Callback = Function(MethodCall call);

dynamic setupFirebaseAuthMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFirebase.channel
      .setMockMethodCallHandler((MethodCall call) async {
    if (call.method == 'Firebase#initializeCore') {
      return <Map<String, dynamic>>[
        <String, dynamic>{
          'name': defaultFirebaseAppName,
          'options': <String, String>{
            'apiKey': '123',
            'appId': '123',
            'messagingSenderId': '123',
            'projectId': '123',
          },
          'pluginConstants': <String, String>{},
        }
      ];
    }

    if (call.method == 'Firebase#initializeApp') {
      return <String, dynamic>{
        'name': call.arguments['appName'],
        'options': call.arguments['options'],
        'pluginConstants': <String, dynamic>{},
      };
    }
    if (customHandlers != null) customHandlers(call);

    return null;
  });

  const MethodChannel('plugins.flutter.io/firebase_messaging')
      .setMockMethodCallHandler((MethodCall call) async {
    if (call.method == 'Messaging#deleteToken') {
      return null;
    }
    if (call.method == 'Messaging#getToken') {
      return <String, String>{'token': 'test token. tolkien token'};
    }

    return null;
  });
}
