import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/quick_access_item_modal.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/quick_access_item.dart';
import 'package:http/http.dart' as http;
import 'package:shared_themes/constants.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('QuickAccessItem', () {
    late Store<AppState> store;

    setUp(() {
      startMockVisitAndExam();
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
        'renders & works correctly in smallScreen and show test added message',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'createFHIRCondition': <String, dynamic>{
                  'resource': <String, dynamic>{'ID': 'some id'}
                },
              }
            }),
            201),
      );

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: QuickAccessItemModal(
            diagnosisID: 'null',
            diagnosisName: 'Malaria',
            test: QuickAccessItem('alias', 'name', 'code'),
            type: QuickAccessType.test,
          ),
          graphQlClient: mockShortGraphQlClient);

      // verify renders correctly
      expect(find.byKey(AppWidgetKeys.aliasKey), findsOneWidget);

      // tap alias btn
      await tester.tap(find.byKey(AppWidgetKeys.aliasKey));
      await tester.pumpAndSettle();

      // // verify dialog exists
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);

      // // tap confirm btn
      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.text(addTestsSuccessMsg), findsOneWidget);
    });

    testWidgets('should navigate and show diagnosis added message',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
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
                  200));

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: QuickAccessItemModal(
            diagnosisID: 'null',
            diagnosisName: 'Malaria',
            test: QuickAccessItem('alias', 'name', 'code'),
            type: QuickAccessType.diagnosis,
          ),
          graphQlClient: graphQlClient);

      // verify renders correctly
      expect(find.byKey(AppWidgetKeys.aliasKey), findsOneWidget);

      // tap alias btn
      await tester.tap(find.byKey(AppWidgetKeys.aliasKey));
      await tester.pumpAndSettle();

      // // verify dialog exists
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);

      // // tap confirm btn
      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.text(diagnosisAddedSuccessMsg), findsOneWidget);
    });

    testWidgets('should show error message', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              http.Response(
                  json.encode(<String, dynamic>{'error': 'error'}), 408));

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: QuickAccessItemModal(
            diagnosisID: 'null',
            diagnosisName: 'Malaria',
            test: QuickAccessItem('alias', 'name', 'code'),
            type: QuickAccessType.diagnosis,
          ),
          graphQlClient: graphQlClient);

      // verify renders correctly
      expect(find.byKey(AppWidgetKeys.aliasKey), findsOneWidget);

      // tap alias btn
      await tester.tap(find.byKey(AppWidgetKeys.aliasKey));
      await tester.pumpAndSettle();

      // // verify dialog exists
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);

      // // tap confirm btn
      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));
      await tester.pumpAndSettle();

      expect(find.text(UserFeedBackTexts.getErrorMessage()), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('renders & works correctly in largeScreen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: QuickAccessItemModal(
          diagnosisID: 'null',
          diagnosisName: 'Malaria',
          test: QuickAccessItem('alias', 'name', 'code'),
          type: QuickAccessType.test,
        ),
      );

      // verify renders correctly
      expect(find.byKey(AppWidgetKeys.aliasKey), findsOneWidget);

      // tap alias btn
      await tester.tap(find.byKey(AppWidgetKeys.aliasKey));
      await tester.pump();

      // verify dialog exists
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);

      // tap cancel btn
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pump();

      // verify dialog closed
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsNothing);
      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsNothing);

      // tap alias btn again & verify dialog shows
      await tester.tap(find.byKey(AppWidgetKeys.aliasKey));
      await tester.pump();

      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);

      // tap confirm btn
      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));
      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('should work correctly when type is diagnosis',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: QuickAccessItemModal(
          diagnosisID: 'null',
          diagnosisName: 'Malaria',
          test: QuickAccessItem('alias', 'name', 'code'),
          type: QuickAccessType.diagnosis,
        ),
      );

      // verify renders correctly
      expect(find.byKey(AppWidgetKeys.aliasKey), findsOneWidget);

      // tap alias btn
      await tester.tap(find.byKey(AppWidgetKeys.aliasKey));
      await tester.pump();

      // verify dialog exists
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);

      // tap cancel btn
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pump();

      // verify dialog closed
      // verify(mockObserver.didPop(any, any));
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsNothing);
      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsNothing);

      // tap alias btn again & verify dialog shows
      await tester.tap(find.byKey(AppWidgetKeys.aliasKey));
      await tester.pump();

      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);

      // tap confirm btn
      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));
      await tester.pump();

      expect(find.byType(BewellSubmitDialog), findsOneWidget);
      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
