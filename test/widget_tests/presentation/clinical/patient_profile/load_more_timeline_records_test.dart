// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/shared_themes/constants.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/load_more_timeline_records.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  late Store<CoreState> store;

  setUp(() {
    store = Store<CoreState>(initialState: CoreState.initial());
  });

  testWidgets('LoadMoreTimelineRecords renders correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
        tester: tester,
        store: store,
        widget: LoadMoreTimelineRecords(callback: () => false, count: 1));

    expect(
        find.byKey(AppWidgetKeys.timelineNavigatorButtonKey), findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.timelineNavigatorButtonKey));
    await tester.pumpAndSettle();

    expect(find.text(UserFeedBackTexts.getErrorMessage()), findsOneWidget);
  });
}
