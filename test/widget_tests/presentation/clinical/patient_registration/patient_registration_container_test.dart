import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';

void main() {
  late TabController tabController;

  setUp(() {
    tabController = TabController(length: 4, vsync: const TestVSync());
  });

  group('PatientRegistrationContainer', () {
    testWidgets('by default should not notify descendants of changes',
        (WidgetTester tester) async {
      final List<PatientRegistrationContainer> log =
          <PatientRegistrationContainer>[];

      final Builder builder = Builder(
        builder: (BuildContext context) {
          log.add(context.dependOnInheritedWidgetOfExactType<
              PatientRegistrationContainer>()!);
          return Container();
        },
      );

      final PatientRegistrationContainer first = PatientRegistrationContainer(
        tabController: tabController,
        shouldNotify: true,
        child: builder,
      );
      await tester.pumpWidget(first);

      expect(log, equals(<PatientRegistrationContainer>[first]));

      final PatientRegistrationContainer second = PatientRegistrationContainer(
        tabController: tabController,
        child: builder,
      );
      await tester.pumpWidget(second);

      expect(log, equals(<PatientRegistrationContainer>[first]));

      final PatientRegistrationContainer third = PatientRegistrationContainer(
        tabController: tabController,
        shouldNotify: true,
        child: builder,
      );
      await tester.pumpWidget(third);

      expect(log, equals(<PatientRegistrationContainer>[first, third]));
    });
  });
}
