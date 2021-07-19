import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/patient_examination.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/general_systems_exam_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/review_of_systems.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  testWidgets('patient examination renders correctly',
      (WidgetTester tester) async {
    startMockVisitAndExam();
    await buildTestWidget(
      tester: tester,
      widget: ListView(children: <Widget>[PatientExamination()]),
    );

    expect(find.byType(GeneralSystemsExamWidget), findsOneWidget);
    expect(find.byType(ReviewOfSystems), findsOneWidget);
  });
}
