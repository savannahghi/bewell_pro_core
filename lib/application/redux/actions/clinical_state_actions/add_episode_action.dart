import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';

/// Add the current episode of care to the core state
class AddEpisodeAction extends ReduxAction<CoreState> {
  final EpisodeOfCare? episodeOfCare;
  AddEpisodeAction({this.episodeOfCare});

  @override
  CoreState? reduce() {
    return state.copyWith(
        clinicalState: store.state.clinicalState?.copyWith
            .call(currentEpisodeOfCare: episodeOfCare));
  }
}
