import 'package:bewell_pro_core/domain/clinical/entities/allergy.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_category.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_criticality.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_reaction.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_type.dart';
import 'package:bewell_pro_core/domain/clinical/entities/annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/coding.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition.dart';
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative_status.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/allergy_intolerance_reaction_severity_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';
import 'package:user_feed/user_feed.dart';

const String setCommSettingsMutation = r'''
mutation SetUserCommunicationsSettings($allowWhatsApp: Boolean, $allowTextSMS: Boolean, $allowPush: Boolean, $allowEmail: Boolean) {
  setUserCommunicationsSettings(allowWhatsApp: $allowWhatsApp, allowTextSMS: $allowTextSMS, allowPush: $allowPush, allowEmail: $allowEmail){
    allowWhatsApp
    allowPush
    allowEmail
    allowTextSMS
  }
}
 ''';

// sends events to the backend
const String processEventMutation = r'''
mutation processEvent(
  $flavour: Flavour!
  $event: EventInput!
){
  processEvent(
    flavour: $flavour
    event: $event
  )
}
''';

Map<String, dynamic> processEventMutationVariables({
  required String eventName,
  required String uid,
  required Map<String, dynamic> payload,
}) {
  return <String, dynamic>{
    'flavour': Flavour.PRO.name,
    'event': <String, dynamic>{
      'name': eventName,
      'context': <String, dynamic>{
        'userID': uid,
        'locationID': 'placeholder',
        'timestamp':
            payload['timeTriggered'] ?? DateTime.now().toUtc().toIso8601String()
      },
      'payload': <String, dynamic>{'data': payload}
    }
  };
}

const String updateUserProfileMutation = r'''
mutation UpdateUserProfile($input: UserProfileInput!) {
  updateUserProfile(input: $input) {
    userBioData{
    firstName
    lastName
    }
  }
}
''';

const String registerDeviceTokenMutation = r'''
mutation RegisterPushToken($token: String!) {
  registerPushToken(token: $token)
}
''';

Map<String, dynamic> registerDeviceTokenMutationVariables(String deviceToken) {
  return <String, String>{'token': deviceToken};
}

const String updateUserPinMutation = r'''
mutation UpdateUserPin($phone: String!, $pin: String!) {
  updateUserPIN(phone: $phone, pin: $pin)
}
 ''';

const String setUserPinMutation = r'''
mutation SetUserPin($msisdn: String!, $pin: String!) {
  setUserPin(msisdn: $msisdn, pin: $pin)
}
 ''';

/// --------------------------------------------------------------------
/// CLINICAL MUTATIONS
/// --------------------------------------------------------------------

const String addVitalsMutation = r'''
mutation AddObservation($input: FHIRObservationInput!) {
  createFHIRObservation(input: $input) {
    resource {
      ID
    }
  }
}
''';

Map<String, dynamic> addWeightVitalMutationVariables(
    Map<String, dynamic> payload) {
  final Map<String, dynamic> inputVariables = <String, dynamic>{};
  inputVariables['Status'] = 'preliminary';
  inputVariables['Category'] = <dynamic>[
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
  ];
  inputVariables['Code'] = <String, dynamic>{
    'Text': 'Body Weight',
    'Coding': <dynamic>[
      <String, dynamic>{
        'Display': 'Body Weight',
        'Code': '29463-7',
        'System': 'http://loinc.org',
        'UserSelected': true
      }
    ]
  };

  inputVariables['ValueQuantity'] = <String, dynamic>{
    'Value': double.parse(payload['weight'].toString()),
    'Unit': 'kg',
    'System': 'http://unitsofmeasure.org',
    'Code': 'kg'
  };
  inputVariables['ReferenceRange'] = <dynamic>[
    <String, dynamic>{
      'Low': <String, dynamic>{
        'Value': 0,
        'Unit': 'kg',
        'System': 'http://unitsofmeasure.org',
        'Code': 'kg'
      },
      'High': <String, dynamic>{
        'Value': 300,
        'Unit': 'kg',
        'System': 'http://unitsofmeasure.org',
        'Code': 'kg'
      },
      'Text': '0kg to 300kg',
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
  ];
  inputVariables['Interpretation'] = <dynamic>[
    <String, dynamic>{
      'Text': 'Normal',
      'Coding': <dynamic>[
        <String, dynamic>{
          'Display': 'Normal',
          'Code': 'N',
          'System':
              'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
          'UserSelected': false
        }
      ]
    }
  ];
  inputVariables['Issued'] = payload['dateRecorded'];
  inputVariables['EffectiveInstant'] = payload['dateRecorded'];
  inputVariables['Subject'] = <String, dynamic>{
    'Reference': payload['patientRef'],
    'Type': 'Patient',
    'Display': payload['patientName']
  };
  inputVariables['Encounter'] = <String, dynamic>{
    'Reference': payload['encounterRef'],
    'Type': 'Encounter',
    'Display': ''
  };
  return <String, dynamic>{'input': inputVariables};
}

Map<String, dynamic> addBMIVitalMutationVariables(
    Map<String, dynamic> payload) {
  final Map<String, dynamic> inputVariables = <String, dynamic>{};
  inputVariables['Status'] = 'preliminary';
  inputVariables['Category'] = <dynamic>[
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
  ];
  inputVariables['Code'] = <String, dynamic>{
    'Text': 'Body Mass Index',
    'Coding': <dynamic>[
      <String, dynamic>{
        'Display': 'Body Mass Index',
        'Code': '39156-5',
        'System': 'http://loinc.org',
        'UserSelected': true
      }
    ]
  };
  inputVariables['ValueQuantity'] = <String, dynamic>{
    'Value': double.parse(payload['bmi'].toString()),
    'Unit': 'kg/m2',
    'System': 'http://unitsofmeasure.org',
    'Code': 'kg/m2'
  };
  inputVariables['ReferenceRange'] = <dynamic>[
    <String, dynamic>{
      'Low': <String, dynamic>{
        'Value': 18.4,
        'Unit': 'kg/m2',
        'System': 'http://unitsofmeasure.org',
        'Code': 'kg/m2'
      },
      'High': <String, dynamic>{
        'Value': 25.0,
        'Unit': 'kg/m2',
        'System': 'http://unitsofmeasure.org',
        'Code': 'kg/m2'
      },
      'Text': '18.5kg/m2 to 24.9kg/m2',
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
  ];
  inputVariables['Interpretation'] = <dynamic>[
    <String, dynamic>{
      'Text': payload['evaluatedReading'] ?? 'UNKNOWN',
      'Coding': <dynamic>[
        <String, dynamic>{
          'Display': payload['evaluatedReading'] ?? 'UNKNOWN',
          'Code': payload['evaluatedReading'].toString().substring(0, 1),
          'System':
              'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
          'UserSelected': false
        }
      ]
    }
  ];
  inputVariables['Issued'] = payload['dateRecorded'];
  inputVariables['EffectiveInstant'] = payload['dateRecorded'];
  inputVariables['Subject'] = <String, dynamic>{
    'Reference': payload['patientRef'],
    'Type': 'Patient',
    'Display': payload['patientName']
  };
  inputVariables['Encounter'] = <String, dynamic>{
    'Reference': payload['encounterRef'],
    'Type': 'Encounter',
    'Display': ''
  };
  return <String, dynamic>{'input': inputVariables};
}

Map<String, dynamic> addHeightVitals(Map<String, dynamic> payload) {
  final Map<String, dynamic> inputVariables = <String, dynamic>{};
  inputVariables['Status'] = 'preliminary';
  inputVariables['Category'] = <dynamic>[
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
  ];
  inputVariables['Code'] = <String, dynamic>{
    'Text': 'Body Height',
    'Coding': <dynamic>[
      <String, dynamic>{
        'Display': 'Body Height',
        'Code': '8302-2',
        'System': 'http://loinc.org',
        'UserSelected': true
      }
    ]
  };
  inputVariables['ValueQuantity'] = <String, dynamic>{
    'Value': payload['heightInCm'],
    'Unit': 'cm',
    'System': 'http://unitsofmeasure.org',
    'Code': 'cm'
  };
  inputVariables['ReferenceRange'] = <dynamic>[
    <String, dynamic>{
      'Low': <String, dynamic>{
        'Value': 0,
        'Unit': 'cm',
        'System': 'http://unitsofmeasure.org',
        'Code': 'cm'
      },
      'High': <String, dynamic>{
        'Value': 300,
        'Unit': 'cm',
        'System': 'http://unitsofmeasure.org',
        'Code': 'cm'
      },
      'Text': '0cm to 300cm',
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
  ];
  inputVariables['Interpretation'] = <dynamic>[
    <String, dynamic>{
      'Text': 'Normal',
      'Coding': <dynamic>[
        <String, dynamic>{
          'Display': 'Normal',
          'Code': 'N',
          'System':
              'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
          'UserSelected': false
        }
      ]
    }
  ];
  inputVariables['Issued'] = payload['dateRecorded'];
  inputVariables['EffectiveInstant'] = payload['dateRecorded'];
  inputVariables['Subject'] = <String, dynamic>{
    'Reference': payload['patientRef'],
    'Type': 'Patient',
    'Display': payload['patientName']
  };
  inputVariables['Encounter'] = <String, dynamic>{
    'Reference': payload['encounterRef'],
    'Type': 'Encounter',
    'Display': ''
  };
  return <String, dynamic>{'input': inputVariables};
}

Map<String, dynamic> addSystoleBloodPressureVitalMutationVariables(
    Map<String, dynamic> payload) {
  final Map<String, dynamic> inputVariables = <String, dynamic>{};
  inputVariables['Status'] = 'preliminary';
  inputVariables['Category'] = <dynamic>[
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
  ];
  inputVariables['Code'] = <String, dynamic>{
    'Text': 'Systolic Blood Pressure',
    'Coding': <dynamic>[
      <String, dynamic>{
        'Display': 'Systolic Blood Pressure',
        'Code': '8480-6',
        'System': 'http://loinc.org',
        'UserSelected': true
      }
    ]
  };
  inputVariables['ValueQuantity'] = <String, dynamic>{
    'Value': double.parse(payload['systole'].toString()),
    'Unit': 'mm[Hg]',
    'System': 'http://unitsofmeasure.org',
    'Code': 'mm[Hg]'
  };
  inputVariables['ReferenceRange'] = <dynamic>[
    <String, dynamic>{
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
      'Text': '0mm[Hg] to 300mm[Hg]',
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
  ];
  inputVariables['Interpretation'] = <dynamic>[
    <String, dynamic>{
      'Text': payload['evaluatedReading'] ?? 'UNKNOWN',
      'Coding': <dynamic>[
        <String, dynamic>{
          'Display': payload['evaluatedReading'] ?? 'UNKNOWN',
          'Code': payload['evaluatedReading'].toString().substring(0, 1),
          'System':
              'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
          'UserSelected': false
        }
      ]
    }
  ];
  inputVariables['Issued'] = payload['dateRecorded'];
  inputVariables['EffectiveInstant'] = payload['dateRecorded'];
  inputVariables['Subject'] = <String, dynamic>{
    'Reference': payload['patientRef'],
    'Type': 'Patient',
    'Display': payload['patientName']
  };
  inputVariables['Encounter'] = <String, dynamic>{
    'Reference': payload['encounterRef'],
    'Type': 'Encounter',
    'Display': ''
  };
  return <String, dynamic>{'input': inputVariables};
}

Map<String, dynamic> addDiastolicBloodPressureVitalMutationVariables(
    Map<String, dynamic> payload) {
  final Map<String, dynamic> inputVariables = <String, dynamic>{};
  inputVariables['Status'] = 'preliminary';
  inputVariables['Category'] = <dynamic>[
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
  ];
  inputVariables['Code'] = <String, dynamic>{
    'Text': 'Diastolic Blood Pressure',
    'Coding': <dynamic>[
      <String, dynamic>{
        'Display': 'Diastolic Blood Pressure',
        'Code': '8462-4',
        'System': 'http://loinc.org',
        'UserSelected': true
      }
    ]
  };
  inputVariables['ValueQuantity'] = <String, dynamic>{
    'Value': double.parse(payload['diastole'].toString()),
    'Unit': 'mm[Hg]',
    'System': 'http://unitsofmeasure.org',
    'Code': 'mm[Hg]'
  };
  inputVariables['ReferenceRange'] = <dynamic>[
    <String, dynamic>{
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
      'Text': '0mm[Hg] to 300mm[Hg]',
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
  ];
  inputVariables['Interpretation'] = <dynamic>[
    <String, dynamic>{
      'Text': payload['evaluatedReading'] ?? 'UNKNOWN',
      'Coding': <dynamic>[
        <String, dynamic>{
          'Display': payload['evaluatedReading'] ?? 'UNKNOWN',
          'Code': payload['evaluatedReading'].toString().substring(0, 1),
          'System':
              'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
          'UserSelected': false
        }
      ]
    }
  ];
  inputVariables['Issued'] = payload['dateRecorded'];
  inputVariables['EffectiveInstant'] = payload['dateRecorded'];
  inputVariables['Subject'] = <String, dynamic>{
    'Reference': payload['patientRef'],
    'Type': 'Patient',
    'Display': payload['patientName']
  };
  inputVariables['Encounter'] = <String, dynamic>{
    'Reference': payload['encounterRef'],
    'Type': 'Encounter',
    'Display': ''
  };
  return <String, dynamic>{'input': inputVariables};
}

Map<String, dynamic> addOxygenSaturationVariables(
    Map<String, dynamic> payload) {
  final Map<String, dynamic> inputVariables = <String, dynamic>{};
  inputVariables['Status'] = 'preliminary';
  inputVariables['Category'] = <dynamic>[
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
  ];
  inputVariables['Code'] = <String, dynamic>{
    'Text': 'Oxygen Saturation',
    'Coding': <dynamic>[
      <String, dynamic>{
        'Display': 'Oxygen Saturation',
        'Code': '2708-6',
        'System': 'http://loinc.org',
        'UserSelected': false
      }
    ]
  };
  inputVariables['ValueQuantity'] = <String, dynamic>{
    'Value': double.parse(payload['oxygenSaturation'].toString()),
    'Unit': '%',
    'System': 'http://unitsofmeasure.org',
    'Code': '%'
  };
  inputVariables['ReferenceRange'] = <dynamic>[
    <String, dynamic>{
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
      'Text': '88% to 92%',
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
  ];
  inputVariables['Interpretation'] = <dynamic>[
    <String, dynamic>{
      'Text': payload['evaluatedReading'] ?? 'UNKNOWN',
      'Coding': <dynamic>[
        <String, dynamic>{
          'Display': payload['evaluatedReading'] ?? 'UNKNOWN',
          'Code': payload['evaluatedReading'].toString().substring(0, 1),
          'System':
              'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
          'UserSelected': false
        }
      ]
    }
  ];
  inputVariables['Issued'] = payload['dateRecorded'];
  inputVariables['EffectiveInstant'] = payload['dateRecorded'];
  inputVariables['Subject'] = <String, dynamic>{
    'Reference': payload['patientRef'],
    'Type': 'Patient',
    'Display': payload['patientName']
  };
  inputVariables['Encounter'] = <String, dynamic>{
    'Reference': payload['encounterRef'],
    'Type': 'Encounter',
    'Display': ''
  };
  return <String, dynamic>{'input': inputVariables};
}

Map<String, dynamic> addPulseVariables(Map<String, dynamic> payload) {
  final Map<String, dynamic> inputVariables = <String, dynamic>{};
  inputVariables['Status'] = 'preliminary';
  inputVariables['Category'] = <dynamic>[
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
  ];
  inputVariables['Code'] = <String, dynamic>{
    'Text': 'Heart Rate',
    'Coding': <dynamic>[
      <String, dynamic>{
        'Display': 'Heart Rate',
        'Code': '8867-4',
        'System': 'http://loinc.org',
        'UserSelected': true
      }
    ]
  };
  inputVariables['ValueQuantity'] = <String, dynamic>{
    'Value': double.parse(payload['selectedReading'].toString()),
    'Unit': '/min',
    'System': 'http://unitsofmeasure.org',
    'Code': '/min'
  };
  inputVariables['ReferenceRange'] = <dynamic>[
    <String, dynamic>{
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
      'Text': '0/min to 300/min',
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
  ];
  inputVariables['Interpretation'] = <dynamic>[
    <String, dynamic>{
      'Text': payload['evaluatedReading'] ?? 'UNKNOWN',
      'Coding': <dynamic>[
        <String, dynamic>{
          'Display': payload['evaluatedReading'] ?? 'UNKNOWN',
          'Code': payload['evaluatedReading'].toString().substring(0, 1),
          'System':
              'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
          'UserSelected': false
        }
      ]
    }
  ];
  inputVariables['Issued'] = payload['dateRecorded'];
  inputVariables['EffectiveInstant'] = payload['dateRecorded'];
  inputVariables['Subject'] = <String, dynamic>{
    'Reference': payload['patientRef'],
    'Type': 'Patient',
    'Display': payload['patientName']
  };
  inputVariables['Encounter'] = <String, dynamic>{
    'Reference': payload['encounterRef'],
    'Type': 'Encounter',
    'Display': ''
  };
  return <String, dynamic>{'input': inputVariables};
}

Map<String, dynamic> addRespiratoryRateVariables(Map<String, dynamic> payload) {
  final Map<String, dynamic> inputVariables = <String, dynamic>{};
  inputVariables['Status'] = 'preliminary';
  inputVariables['Category'] = <dynamic>[
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
  ];
  inputVariables['Code'] = <String, dynamic>{
    'Text': 'Respiratory Rate',
    'Coding': <dynamic>[
      <String, dynamic>{
        'Display': 'Respiratory Rate',
        'Code': '9279-1',
        'System': 'http://loinc.org',
        'UserSelected': true
      }
    ]
  };
  inputVariables['ValueQuantity'] = <String, dynamic>{
    'Value': double.parse(payload['selectedReading'].toString()),
    'Unit': '/min',
    'System': 'http://unitsofmeasure.org',
    'Code': '/min'
  };
  inputVariables['ReferenceRange'] = <dynamic>[
    <String, dynamic>{
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
      'Text': '0/min to 300/min',
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
  ];
  inputVariables['Interpretation'] = <dynamic>[
    <String, dynamic>{
      'Text': payload['evaluatedReading'] ?? 'UNKNOWN',
      'Coding': <dynamic>[
        <String, dynamic>{
          'Display': payload['evaluatedReading'] ?? 'UNKNOWN',
          'Code': payload['evaluatedReading'].toString().substring(0, 1),
          'System':
              'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
          'UserSelected': false
        }
      ]
    }
  ];
  inputVariables['Issued'] = payload['dateRecorded'];
  inputVariables['EffectiveInstant'] = payload['dateRecorded'];
  inputVariables['Subject'] = <String, dynamic>{
    'Reference': payload['patientRef'],
    'Type': 'Patient',
    'Display': payload['patientName']
  };
  inputVariables['Encounter'] = <String, dynamic>{
    'Reference': payload['encounterRef'],
    'Type': 'Encounter',
    'Display': ''
  };
  return <String, dynamic>{'input': inputVariables};
}

Map<String, dynamic> addTemperatureReadingVariables(
    Map<String, dynamic> payload) {
  final Map<String, dynamic> inputVariables = <String, dynamic>{};
  inputVariables['Status'] = 'preliminary';
  inputVariables['Category'] = <dynamic>[
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
  ];
  inputVariables['Code'] = <String, dynamic>{
    'Text': 'Body Temperature',
    'Coding': <dynamic>[
      <String, dynamic>{
        'Display': 'Body Temperature',
        'Code': '8310-5',
        'System': 'http://loinc.org',
        'UserSelected': true
      }
    ]
  };
  inputVariables['ValueQuantity'] = <String, dynamic>{
    'Value': double.parse(payload['selectedReading'].toString()),
    'Unit': 'Cel',
    'System': 'http://unitsofmeasure.org',
    'Code': 'Cel'
  };
  inputVariables['ReferenceRange'] = <dynamic>[
    <String, dynamic>{
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
      'Text': '0Cel to 300Cel',
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
  ];
  inputVariables['Interpretation'] = <dynamic>[
    <String, dynamic>{
      'Text': payload['evaluatedReading'] ?? 'UNKNOWN',
      'Coding': <dynamic>[
        <String, dynamic>{
          'Display': payload['evaluatedReading'] ?? 'UNKNOWN',
          'Code': payload['interpretation'].toString().substring(0, 1),
          'System':
              'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
          'UserSelected': false
        }
      ]
    }
  ];
  inputVariables['Issued'] = payload['dateRecorded'];
  inputVariables['EffectiveInstant'] = payload['dateRecorded'];
  inputVariables['Subject'] = <String, dynamic>{
    'Reference': payload['patientRef'],
    'Type': 'Patient',
    'Display': payload['patientName']
  };
  inputVariables['Encounter'] = <String, dynamic>{
    'Reference': payload['encounterRef'],
    'Type': 'Encounter',
    'Display': ''
  };
  return <String, dynamic>{'input': inputVariables};
}

const String deleteCompositionMutation = r'''
mutation DeleteComposition($id: ID!) {
  deleteFHIRComposition(id: $id)
}
''';

const String addTestMutation = r'''
mutation CreateServiceRequest($input: FHIRServiceRequestInput!) {
  createFHIRServiceRequest(input: $input) {
    resource {
      ID
    }
  }
}
''';

Map<String, dynamic> addTestMutationVariables({
  required String testName,
  required String testCode,
  required String testStatus,
  required String recordingDoctor,
  required String patientReference,
  required String patientName,
  required String encounterReference,
  required String dateRecorded,
  required String diagnosisID,
  required String diagnosisName,
}) {
  final Map<String, dynamic> _variables = <String, dynamic>{
    'input': <String, dynamic>{
      'Status': testStatus,
      'Intent': 'plan',
      'Priority': 'routine',
      'Subject': <String, dynamic>{
        'Reference': patientReference,
        'Type': 'Patient',
        'Display': patientName,
      },
      'Encounter': <String, dynamic>{
        'Reference': encounterReference,
        'Type': 'Encounter',
        'Display': dateRecorded
      },
      'SupportingInfo': <dynamic>[
        <String, dynamic>{
          'ID': diagnosisID,
          'Reference': encounterReference,
          'Display': diagnosisName
        }
      ],
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
      ],
      'Requester': <String, dynamic>{'Display': recordingDoctor},
      'Code': <String, dynamic>{
        'Text': testName,
        'Coding': <dynamic>[
          <String, dynamic>{
            'System': 'OCL:/orgs/CIEL/sources/CIEL/',
            'Code': testCode,
            'Display': testName,
            'UserSelected': true
          }
        ]
      }
    }
  };

  return _variables;
}

const String addConditionMutation = r'''
mutation CreateFHIRCondition($input: FHIRConditionInput!) {
  createFHIRCondition(input: $input) {
    resource {
      ID
    }
  }
}
''';

Map<String, dynamic> addDiagnosisVariables({
  required String clinicalStatus,
  required String dateRecorded,
  required String selectedDiagnosis,
  required String diagnosisCode,
  required String recordingDoctor,
  String? doctorNotes,
  required String patientReference,
  required String encounterReference,
}) {
  final Map<String, dynamic> inputVariables = <String, dynamic>{};

  inputVariables['ClinicalStatus'] = <String, dynamic>{
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': 'http://terminology.hl7.org/CodeSystem/condition-clinical',
        'Code': clinicalStatus,
        'Display': clinicalStatus,
        'UserSelected': false
      }
    ],
    'Text': clinicalStatus
  };

  inputVariables['RecordedDate'] = dateRecorded;

  inputVariables['VerificationStatus'] = <String, dynamic>{
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': 'http://terminology.hl7.org/CodeSystem/condition-ver-status',
        'Code': 'confirmed',
        'Display': 'Confirmed',
        'UserSelected': false
      }
    ],
    'Text': 'Confirmed'
  };

  inputVariables['Category'] = <dynamic>[
    <String, dynamic>{
      'Coding': <dynamic>[
        <String, dynamic>{
          'System': 'http://terminology.hl7.org/CodeSystem/condition-category',
          'Code': 'encounter-diagnosis',
          'Display': 'encounter-diagnosis',
          'UserSelected': false
        }
      ],
      'Text': 'encounter-diagnosis'
    }
  ];

  inputVariables['Code'] = <String, dynamic>{
    'Coding': <dynamic>[
      <String, dynamic>{
        'System': 'OCL:/orgs/CIEL/sources/CIEL/',
        'Code': diagnosisCode,
        'Display': selectedDiagnosis,
        'UserSelected': true
      }
    ],
    'Text': selectedDiagnosis
  };

  inputVariables['Subject'] = <String, dynamic>{
    'Reference': patientReference,
    'Type': 'Patient',
    'Display': patientReference
  };

  inputVariables['Encounter'] = <String, dynamic>{
    'Reference': encounterReference,
    'Type': 'Encounter',
    'Display': 'Encounter'
  };

  inputVariables['Recorder'] = <String, dynamic>{'Display': recordingDoctor};
  inputVariables['Asserter'] = <String, dynamic>{'Display': recordingDoctor};
  inputVariables['Note'] = <dynamic>[
    <String, dynamic>{
      'AuthorString': recordingDoctor,
      'Text': doctorNotes ?? 'No notes provided'
    }
  ];

  return <String, dynamic>{'input': inputVariables};
}

Map<String, dynamic> addAllergyVariables(Map<String, dynamic> payload) {
  final AllergyIntolerance _allergyObject = AllergyIntolerance(
    type: AllergyIntoleranceTypeEnum.allergy,
    category: <AllergyIntoleranceCategoryEnum>[
      AllergyIntoleranceCategoryEnum.medication,
    ],
    criticality: AllergyIntoleranceCriticalityEnum.high,
    clinicalStatus: CodeableConcept(
      text: 'Active',
      coding: <Coding>[
        Coding(
          system:
              'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
          code: 'active',
          display: 'Active',
          userSelected: false,
        ),
      ],
    ),
    recordedDate: payload['dateRecorded']?.toString(),
    verificationStatus: CodeableConcept(
      coding: <Coding>[
        Coding(
          system:
              'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
          code: 'confirmed',
          display: 'confirmed',
          userSelected: false,
        ),
      ],
      text: payload['substanceConfirmationStatus']?.toString(),
    ),
    patient: Reference(
      display: payload['patientName']?.toString(),
      type: 'Patient',
      reference: payload['patientRef']?.toString(),
    ),
    encounter: Reference(
      reference: payload['encounterRef']?.toString(),
      display: 'Encounter',
      type: 'Encounter',
    ),
    recorder: Reference(display: payload['recordingDoctor']?.toString()),
    asserter: Reference(display: payload['recordingDoctor']?.toString()),
    note: <Annotation>[
      Annotation(
        authorString: payload['recordingDoctor']?.toString(),
        text: payload['description']?.toString(),
      ),
    ],
    reaction: <AllergyIntoleranceReaction>[
      AllergyIntoleranceReaction(
        description: payload['description']?.toString(),
        severity: AllergyIntoleranceReactionSeverityEnum.severe,
        substance: CodeableConcept(
          text: payload['substanceName']?.toString(),
          coding: <Coding>[
            Coding(
              system: 'OCL:/orgs/CIEL/sources/CIEL/',
              code: payload['substanceID']?.toString(),
              display: payload['substanceDisplayName']?.toString(),
              userSelected: true,
            ),
          ],
        ),
        manifestation: <CodeableConcept>[
          CodeableConcept(
            text: 'No manifestation provided',
            coding: <Coding>[
              Coding(
                system: 'OCL:/orgs/CIEL/sources/CIEL/',
                code: 'No manifestation provided',
                display: 'No manifestation provided',
                userSelected: true,
              ),
            ],
          ),
        ],
      ),
    ],
    code: CodeableConcept(
      text: payload['substanceName']?.toString(),
      coding: <Coding>[
        Coding(
          system: 'OCL:/orgs/CIEL/sources/CIEL/',
          code: payload['substanceID']?.toString(),
          display: payload['substanceName']?.toString(),
          userSelected: false,
        ),
      ],
    ),
  );

  final Map<String, dynamic> _input = _allergyObject.toJson();

  return <String, dynamic>{'input': _input};
}

Map<String, dynamic> addProblemsVariables({
  String? encounterReference,
  String? clinicalStatus,
  String? dateRecorded,
  String? selectedCondition,
  String? recordingDoctor,
  String? doctorNotes,
  String? patientName,
  String? patientReference,
  ConditionCategory? conditionCategory,
}) {
  final Condition _conditionObject = Condition(
    clinicalStatus: CodeableConcept(
      coding: <Coding>[
        Coding(
          system: 'http://terminology.hl7.org/CodeSystem/condition-clinical',
          code: clinicalStatus,
          display: clinicalStatus,
          userSelected: false,
        )
      ],
      text: clinicalStatus,
    ),
    recordedDate: dateRecorded,
    verificationStatus: CodeableConcept(
      coding: <Coding>[
        Coding(
          system: 'http://terminology.hl7.org/CodeSystem/condition-ver-status',
          code: 'confirmed',
          display: 'confirmed',
          userSelected: false,
        ),
      ],
      text: 'Confirmed',
    ),
    category: <CodeableConcept>[
      CodeableConcept(
        coding: <Coding>[
          Coding(
            system: 'http://terminology.hl7.org/CodeSystem/condition-category',
            code: conditionCategory!.name,
            display: conditionCategory.name,
            userSelected: false,
          ),
        ],
        text: conditionCategory.name,
      ),
    ],
    code: CodeableConcept(
      coding: <Coding>[
        Coding(
          system: 'OCL:/orgs/CIEL/sources/CIEL/',
          code: '154531',
          display: selectedCondition,
          userSelected: true,
        ),
      ],
      text: selectedCondition,
    ),
    subject: Reference(
      reference: patientReference,
      type: 'Patient',
      display: patientName,
    ),
    encounter: Reference(
      reference: encounterReference,
      type: 'Encounter',
      display: 'Encounter',
    ),
    recorder: Reference(display: recordingDoctor),
    asserter: Reference(display: recordingDoctor),
    note: <Annotation>[
      Annotation(
        authorString: recordingDoctor,
        text: doctorNotes ?? 'No notes provided',
      )
    ],
  );

  return <String, dynamic>{'input': _conditionObject.toJson()};
}

const String addMedicationMutation = r'''
mutation CreateMedicationRequest($input: FHIRMedicationRequestInput!) {
	createFHIRMedicationRequest(input: $input) {
		resource {
			ID
		 }
   }
}
''';

const String addAllergyMutation = r'''
mutation CreateAllergy($input: FHIRAllergyIntoleranceInput!) {
	createFHIRAllergyIntolerance(input:$input) {
    resource {
      ID
    }
  }
}
''';

const String endExamMutation = r'''
mutation EndExam($encounterID: String!) {
  endEncounter(encounterID: $encounterID)
}
 ''';

const String retireMedicationMutation = r'''
mutation DeleteFHIRMedicationRequest($id: ID!) {
  deleteFHIRMedicationRequest(id: $id)
}
 ''';

const String retireTestMutation = r'''
 mutation DeleteFHIRServiceRequest($id: ID!) {
  deleteFHIRServiceRequest(id: $id)
}
 ''';

const String createCompositionMutation = r'''
  mutation CreateComposition($input: FHIRCompositionInput!) {
  createFHIRComposition(input: $input) {
    resource {
      ID
    }
  }
}
''';

Map<String, dynamic> createCompositionVariables(Map<String, dynamic> payload,
    {bool isUpdatingFHIRComposition = false}) {
  final List<String> reviewOfSystemSectionItems = <String>[
    'respiratory',
    'peripheral',
    'gastrointestinal',
    'urinary',
    'neurologic',
    'hematologic',
    'cardiac',
    'heent',
    'heenttwo',
    'gi',
    'gu',
    'ms',
    'skin',
    'psychiatric',
    'description'
  ];

  final Composition _composition = Composition(
    id: isUpdatingFHIRComposition ? payload['id']?.toString() : null,
    status: CompositionStatusEnum.preliminary,
    type: CodeableConcept(
      text: 'Consult Note',
      coding: <Coding>[
        Coding(
          system: 'http://loinc.org',
          code: '11488-4',
          display: 'Consult Note',
          userSelected: false,
        ),
      ],
    ),
    category: <CodeableConcept>[
      CodeableConcept(
        text: 'Consult Note',
        coding: <Coding>[
          Coding(
            system: 'http://loinc.org',
            code: '11488-4',
            display: 'Consult Note',
            userSelected: false,
          ),
        ],
      )
    ],
    subject: Reference(
      reference: payload['patientRef']?.toString(),
      type: 'Patient',
      display: payload['patientName']?.toString(),
    ),
    encounter: Reference(
      reference: payload['encounterRef']?.toString(),
      type: 'Encounter',
      display: payload['encounterRef']?.toString(),
    ),
    date: payload['dateRecorded']?.toString(),
    author: <Reference>[
      Reference(display: payload['recordingDoctor']?.toString()),
    ],
    title: payload['compositionTitle']?.toString(),
    section: <Section>[
      if (payload['compositionTitle'] ==
          CompositionTypeTitle.patientHistory.name)
        Section(
          title: 'patientHistory',
          text: Narrative(
            status: NarrativeStatusEnum.generated,
            div: payload['patientHistory']?.toString(),
          ),
        ),
      if (payload['compositionTitle'] ==
          CompositionTypeTitle.generalExamination.name)
        Section(
          title: 'generalExam',
          text: Narrative(
            status: NarrativeStatusEnum.generated,
            div: payload['generalExam']?.toString(),
          ),
        ),
      if (payload['compositionTitle'] ==
          CompositionTypeTitle.reviewOfSystems.name)
        ...reviewOfSystemSectionItems
            .where((String title) => payload[title] != null)
            .map(
              (String e) => Section(
                title: e,
                text: Narrative(
                  status: NarrativeStatusEnum.generated,
                  div: payload[e]?.toString(),
                ),
              ),
            )
            .toList(),
    ],
  );

  return <String, dynamic>{'input': _composition.toJson()};
}

const String updateCompositionMutation = r'''
  mutation UpdateComposition($input: FHIRCompositionInput!) {
  updateFHIRComposition(input: $input) {
    resource {
      ID  
    }
  }
}
''';

const String startVisitMutation = r'''
  mutation StartOTPEpisode($input: OTPEpisodeCreationInput!) {
    startEpisodeByOTP(input: $input) {
      episodeOfCare {
        ID
        Status
        Period {
          Start
        }
        ManagingOrganization {
          Display
        }
        Patient {
          Identifier {
            Value
          }
          Display
        }
        Type {
          Text
        }
      }
    }
  }
''';

const String addNewNextOfKinMutation = r'''
mutation AddNextOfKin($input: SimpleNextOfKinInput! ) {
  addNextOfKin(input:$input){
    patientRecord{   
    ID
    }
  }
}
''';

const String addPatientNHIFMutation = r'''
mutation AddNHIF($input: SimpleNHIFInput) {
  addNHIF(input: $input) {
      patientRecord {
        ID
      }
  } 
}
''';

Map<String, dynamic> addPatientNHIFVariables(Map<String, dynamic> payload) {
  final Map<String, dynamic> inputVariables = <String, dynamic>{};
  inputVariables['patientID'] = payload['patientID'];
  inputVariables['membershipNumber'] = payload['membershipNumber'];
  return <String, dynamic>{'input': inputVariables};
}

const String registerPatientQuery = r'''
mutation SimplePatientRegistration($input: SimplePatientRegistrationInput!) {
    registerPatient(input: $input) {
      patientRecord {
        ID
        Name {
          Text
          Given
        }
        Telecom {
          Value
          System
        }
        Gender
        BirthDate
        Photo {
          Data
        }
      }
    }
}
''';

const String updateExtraInformationMutation = r'''
mutation updatePatientExtraInformation($input: PatientExtraInformationInput!){
  createUpdatePatientExtraInformation(input: $input)
}
''';

Map<String, dynamic> updateExtraInformationQueryVariables(
    Map<String, dynamic> payload) {
  final Map<String, dynamic> inputVariables = <String, dynamic>{};

  inputVariables['patientID'] = payload['id'];

  if (payload['maritalStatus'] != null) {
    inputVariables['maritalStatus'] = payload['maritalStatus'];
  }
  if (payload['emailOptIn'] != null && payload['email'] != null) {
    inputVariables['emails'] = <dynamic>[
      <String, dynamic>{
        'email': payload['email'],
        'communicationOptIn': payload['emailOptIn']
      }
    ];
  }

  return <String, dynamic>{'input': inputVariables};
}

const String updateProblemMutation = r'''
mutation UpdateFHIRCondition($input: FHIRConditionInput!) {
  updateFHIRCondition(input: $input) {
    resource {
      ID
    }
  }
}
''';

Map<String, dynamic> updateProblemMutationVariables(
    Condition payload, String reason) {
  final Condition payloadWithStatusUpdate = payload.copyWith.call(
    clinicalStatus: payload.clinicalStatus!.copyWith.call(
      coding: <Coding>[
        payload.clinicalStatus!.coding!.first!.copyWith.call(
          display: 'Resolved',
          code: 'resolved',
        )
      ],
      text: 'Resolved',
    ),
  );

  return <String, dynamic>{'input': payloadWithStatusUpdate.toJson()};
}

const String startEncounterMutation = r'''
mutation StartEncounter($episodeID: String!) {
  startEncounter(episodeID: $episodeID)  
}
''';

const String updateAllergyMutation = r'''
mutation UpdateAllergy($input: FHIRAllergyIntoleranceInput!) {
  updateFHIRAllergyIntolerance(input: $input) {
    resource {
      ID
    }
  }
}
''';

Map<String, dynamic> updateAllergyMutationVariables(
    AllergyIntolerance payload, String reason) {
  final AllergyIntolerance payloadWithStatusUpdate = payload.copyWith.call(
    clinicalStatus: payload.clinicalStatus!.copyWith.call(
      coding: <Coding>[
        payload.clinicalStatus!.coding!.first!.copyWith.call(
          display: 'Resolved',
          code: 'resolved',
          userSelected: true,
        )
      ],
      text: 'Resolved',
    ),
  );

  return <String, dynamic>{'input': payloadWithStatusUpdate.toJson()};
}

const String updateMedicationMutation = r'''
mutation UpdateMedicationRequest($input: FHIRMedicationRequestInput!) {
  updateFHIRMedicationRequest(input: $input) {
    resource {
      ID
    }
  }
}
''';

Map<String, dynamic> updateMedicationMutationVariables(
    Medication payload, String reason) {
  final Medication payloadWithStatusUpdate =
      payload.copyWith.call(status: payload.status);

  final Map<String, dynamic> inputVariables = payloadWithStatusUpdate.toJson();

  return <String, dynamic>{'input': inputVariables};
}

const String endVisitMutation = r'''
 mutation EndEpisode($episodeID: String!) {
    endEpisode(episodeID: $episodeID)
  }
 ''';

Map<String, dynamic> endVisitMutationVariables(String episodeID) {
  return <String, dynamic>{
    'episodeID': episodeID,
  };
}

const String postVisitSurveyMutation = r'''
mutation RecordPostVisitSurvey($input: PostVisitSurveyInput!) {
  recordPostVisitSurvey(input: $input)
}
 ''';

Map<String, dynamic> postVisitSurveyMutationVariables(
    int rating, String criticism, String suggestions) {
  return <String, dynamic>{
    'input': <String, dynamic>{
      'likelyToRecommend': rating,
      'criticism': criticism,
      'suggestions': suggestions
    }
  };
}

const String startBreakGlassVisitMutation = r'''
mutation StartBreakGlassEpisode($input: BreakGlassEpisodeCreationInput!) {
	startEpisodeByBreakGlass(input: $input) {
		episodeOfCare {
			ID
			Status
			Period {
				Start
			}
			ManagingOrganization {
				Display
			}
			Patient {
				Identifier {
					Value
				}
				Display
			}
			Type {
				Text
			}
		}
	}
}
 ''';

const String generateRetryOTPQuery = r'''
query GenerateRetryOTP($msisdn: String!, $step: Int!) {
  generateRetryOTP(msisdn: $msisdn, retryStep: $step)
}
''';
