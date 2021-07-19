import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/clinical_state_actions/add_episode_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/episode_of_care_status_enum.dart';
import 'package:test/test.dart';

void main() {
  group('add episode of care to state action', () {
    test('happy case', () async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      final StoreTester<AppState> storeTester = StoreTester<AppState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final EpisodeOfCare episodeOfCare = EpisodeOfCare(
        id: 'some_id',
        status: EpisodeOfCareStatusEnum.active,
      );
      storeTester.dispatch(AddEpisodeAction(episodeOfCare: episodeOfCare));

      final TestInfo<AppState> info = await storeTester.wait(AddEpisodeAction);
      expect(info.state.clinicalState?.currentEpisodeOfCare, episodeOfCare);
    });

    test('update to null', () async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      final StoreTester<AppState> storeTester = StoreTester<AppState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      storeTester.dispatch(AddEpisodeAction());

      final TestInfo<AppState> info = await storeTester.wait(AddEpisodeAction);
      expect(info.state.clinicalState?.currentEpisodeOfCare, null);
    });
  });
}
