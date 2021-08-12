import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/session_timeout.dart';
import 'package:quiver/async.dart';
import 'package:quiver/testing/time.dart';
import 'package:http/http.dart' as http;

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  late int now;

  setUp(() {
    now = DateTime.now().microsecondsSinceEpoch;
  });

  group('SessionTimeoutAlert', () {
    testWidgets('logout button works', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: Center(
              child: ElevatedButton(
                onPressed: null,
                child: Text('Go'),
              ),
            ),
          ),
        ),
      );

      final BuildContext context = tester.element(find.text('Go'));

      final Future<String?> result = showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return const SessionTimeoutAlert(
            modalCountdown: 10,
            recordingDoctorSurName: 'Doe',
          );
        },
      );
      await tester.pumpAndSettle();

      expect(find.text('Attention Doe'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.logoutBtnKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.logoutBtnKey));

      expect(await result, 'logout');
    });

    testWidgets('stay button works', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'deleteFavoriteNavAction': true,
              'fetchUserNavigationActions': <String, dynamic>{
                'primary': primaryActionsMockedData,
                'secondary': secondaryActionsMockedData
              }
            },
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortSILGraphQlClient,
        widget: const MaterialApp(
          home: Material(
            child: Center(
              child: ElevatedButton(
                onPressed: null,
                child: Text('Go'),
              ),
            ),
          ),
        ),
      );

      final BuildContext context = tester.element(find.text('Go'));

      final Future<String?> result = showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return const SessionTimeoutAlert(
            modalCountdown: 10,
            recordingDoctorSurName: '',
          );
        },
      );
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.stayBtnKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.stayBtnKey));

      expect(await result, 'stay');
    });

    testWidgets('countdown works', (WidgetTester tester) async {
      const int countdown = 10;

      final FakeStopwatch fakeStopwatch = FakeStopwatch(
        () => now,
        const Duration(seconds: 1).inMicroseconds,
      );

      final CountdownTimer timer = CountdownTimer(
        const Duration(seconds: countdown),
        const Duration(seconds: 1),
        stopwatch: fakeStopwatch,
      );

      final Widget widget = SessionTimeoutAlert(
        modalCountdown: countdown,
        recordingDoctorSurName: '',
        countdownTimer: timer,
      );

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
      );

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        duration: const Duration(seconds: 5),
      );
      expect(find.text(logoutTimerText(5)), findsOneWidget);

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        duration: const Duration(seconds: 2),
      );
      expect(find.text(logoutTimerText(3)), findsOneWidget);
    });

    testWidgets('should logout when timer runs out',
        (WidgetTester tester) async {
      final FakeStopwatch fakeStopwatch = FakeStopwatch(
        () => now,
        const Duration(seconds: 1).inMicroseconds,
      );

      final CountdownTimer timer = CountdownTimer(
        const Duration(seconds: 10),
        const Duration(seconds: 1),
        stopwatch: fakeStopwatch,
      );

      const Widget widget = MaterialApp(
        home: Material(
          child: Center(
            child: ElevatedButton(
              onPressed: null,
              child: Text('Go'),
            ),
          ),
        ),
      );

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
      );

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        duration: const Duration(seconds: 9),
      );

      final BuildContext context = tester.element(find.text('Go'));

      showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SessionTimeoutAlert(
            modalCountdown: 10,
            recordingDoctorSurName: 'Doe',
            countdownTimer: timer,
          );
        },
      );
      await tester.pumpAndSettle();

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        duration: const Duration(seconds: 9),
      );

      final Future<String?> result = showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SessionTimeoutAlert(
            modalCountdown: 10,
            recordingDoctorSurName: 'Doe',
            countdownTimer: timer,
          );
        },
      );
      await tester.pumpAndSettle();

      expect(await result, 'logout');
    });
  });
}
