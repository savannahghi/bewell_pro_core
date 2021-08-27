import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/summary_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/widgets/otp_box.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/widgets/summary_exam_button.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('SaveExamSummaryButton', () {
    late Store<CoreState> store;

    setUp(() {
      final UserState userState = UserState.initial().copyWith(
        userProfile: UserProfile.initial().copyWith(
          primaryEmailAddress: testEmailAddress,
          primaryPhoneNumber: testPhoneNumber,
        ),
      );

      final ClinicalState clinicalState = ClinicalState(
        patientPayload: PatientPayload(
          patientRecord: Patient(
            id: 'test-id',
            name: <HumanName>[HumanName(text: 'Doe John')],
            telecom: <ContactPoint>[ContactPoint(value: '+254798000000')],
            gender: PatientGenderEnum.male,
          ),
        ),
      );

      store = Store<CoreState>(
        initialState: CoreState.initial().copyWith(
          userState: userState,
          clinicalState: clinicalState,
        ),
      );

      startMockVisitAndExam();
    });

    testWidgets('renders correctly and works', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const SaveExamSummaryButton(),
      );

      expect(find.text(signOffButtonText), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.signOffExamSaveButton), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.signOffExamSaveButton));
      await tester.pumpAndSettle();

      expect(find.byType(SimpleDialog), findsOneWidget);
      expect(find.byType(OtpBox), findsOneWidget);
      expect(find.byType(SILPinCodeTextField), findsOneWidget);
      expect(find.text(signOffText), findsOneWidget);
      expect(find.text(signOffVerificationText), findsOneWidget);
    });

    testWidgets('displays a snackbar when cancelled',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const SaveExamSummaryButton(),
      );

      // verify UI renders correctly
      expect(find.text(signOffButtonText), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.signOffExamSaveButton), findsOneWidget);

      //tap button
      await tester.tap(find.byKey(AppWidgetKeys.signOffExamSaveButton));
      await tester.pumpAndSettle();

      // verify dialog renders
      expect(find.byType(SimpleDialog), findsOneWidget);
      expect(find.byType(OtpBox), findsOneWidget);
      expect(find.byType(SILPinCodeTextField), findsOneWidget);
      expect(find.text(signOffText), findsOneWidget);
      expect(find.text(signOffVerificationText), findsOneWidget);

      // tap outside the modal to dismiss it
      await tester.tapAt(const Offset(20.0, 20.0));
      await tester.pump();

      // verify sign off was cancelled
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets(
        'renders correctly and works correctly when pressed and otp is wrong',
        (WidgetTester tester) async {
      int sendOtpCalls = 0;

      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: SaveExamSummaryButton(
              sendOtpCallBack: (String? doctorsEmail, String? phoneNumber) {
                sendOtpCalls++;
              },
            ));

        expect(find.text(signOffButtonText), findsOneWidget);
        expect(find.byKey(AppWidgetKeys.signOffExamSaveButton), findsOneWidget);

        await tester.tap(find.byKey(AppWidgetKeys.signOffExamSaveButton));
        await tester.pumpAndSettle();

        expect(find.byType(SimpleDialog), findsOneWidget);
        expect(find.byType(OtpBox), findsOneWidget);
        expect(find.byType(SILPinCodeTextField), findsOneWidget);
        expect(find.text(signOffText), findsOneWidget);
        expect(find.text(signOffVerificationText), findsOneWidget);

        await tester.tap(find.byType(SILPinCodeTextField));
        await tester.enterText(find.byType(SILPinCodeTextField), '1237806');
        await tester.pumpAndSettle();

        expect(sendOtpCalls, 1);
      });
    });

    testWidgets('renders SILPlatformLoader', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(builder: (BuildContext context) {
          store.dispatch(
            SummaryAction(
                context: context,
                doctorsEmail: testEmailAddress.toString(),
                phoneNumber: testPhoneNumber.toString()),
          );
          return const SaveExamSummaryButton();
        }),
      );

      expect(find.text(signOffButtonText), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.signOffExamSaveButton), findsOneWidget);

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
