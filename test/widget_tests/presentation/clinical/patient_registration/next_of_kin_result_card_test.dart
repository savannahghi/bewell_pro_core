// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/next_of_kin_result_card.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('NextOfKinResultCard', () {
    late Store<CoreState> store;

    setUp(() {
      final CoreState state = CoreState.initial();
      store = Store<CoreState>(initialState: state);
    });
    testWidgets('renders correctly on small devices',
        (WidgetTester tester) async {
      final PatientPayload patientPayload = PatientPayload.fromJson(
          registeredPatientData['registerPatient'] as Map<String, dynamic>);

      await buildTestWidget(
          store: store,
          tester: tester,
          widget: NextOfKinResultCard(patient: patientPayload.patientRecord!));

      expect(find.byType(NextOfKinResultCard), findsOneWidget);
      expect(
          find.byKey(
            AppWidgetKeys.smallScreenCard,
          ),
          findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      final String number =
          patientPayload.patientRecord!.telecom!.first!.value!;
      expect(find.text(number), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.addNextOfKinSmallDeviceKey), findsOneWidget);
      expect(find.text(addNextOfKin), findsOneWidget);
    });

    testWidgets('NextOfKinResultCard renders correctly on large devices',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final PatientPayload patientPayload = PatientPayload.fromJson(
          registeredPatientData['registerPatient'] as Map<String, dynamic>);

      await buildTestWidget(
          store: store,
          tester: tester,
          widget: NextOfKinResultCard(patient: patientPayload.patientRecord!));

      expect(find.byType(NextOfKinResultCard), findsOneWidget);
      expect(
          find.byKey(
            AppWidgetKeys.largeScreenCard,
          ),
          findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.text('Phone number:  '), findsOneWidget);
      final String number =
          patientPayload.patientRecord!.telecom!.first!.value!;
      expect(find.text(number), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.addNextOfKinLargeDeviceKey), findsOneWidget);
      expect(find.text(addNextOfKin), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
