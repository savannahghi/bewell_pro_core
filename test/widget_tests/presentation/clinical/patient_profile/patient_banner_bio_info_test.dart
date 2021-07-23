import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_banner_bio_info.dart';

import 'package:shared_ui_components/buttons.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  const Widget patientBannerBioInfoWidget = PatientBannerBioInfo(
    patientAge: '20',
    patientDOB: '27 Jan 1996',
    patientGender: 'male',
    patientName: 'Be.Well',
    patientPhoneNumber: '0712345678',
  );

  testWidgets('PatientBannerBioInfo renders correctly  on small screen',
      (WidgetTester tester) async {
    await buildTestWidget(tester: tester, widget: patientBannerBioInfoWidget);

    expect(find.byType(SILPrimaryButton), findsOneWidget);
    expect(find.text('Age: 20 yrs'), findsOneWidget);
    expect(find.text('Be.Well'), findsOneWidget);
  });

  testWidgets('PatientBannerBioInfo renders correctly  on small screen',
      (WidgetTester tester) async {
    final Store<CoreState> store = Store<CoreState>(
        initialState: CoreState(miscState: MiscState(visitCount: '10')));

    await buildTestWidget(
        tester: tester, store: store, widget: patientBannerBioInfoWidget);

    expect(find.byType(SILPrimaryButton), findsOneWidget);
    expect(find.text('Age: 20 yrs'), findsOneWidget);
    expect(find.text('Be.Well'), findsOneWidget);
  });

  testWidgets('PatientBannerBioInfo renders correctly  on large screen',
      (WidgetTester tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    tester.binding.window.physicalSizeTestValue = tabletLandscape;
    await buildTestWidget(tester: tester, widget: patientBannerBioInfoWidget);

    expect(find.byType(SILPrimaryButton), findsOneWidget);
    expect(find.text('Male'), findsOneWidget);
    expect(find.text('Be.Well'), findsOneWidget);
    expect(find.text('0712345678'), findsOneWidget);

    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
