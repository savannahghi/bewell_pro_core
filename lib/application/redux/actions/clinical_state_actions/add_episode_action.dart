import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';

/// Add the current episode of care to the app state
class AddEpisodeAction extends ReduxAction<AppState> {
  final EpisodeOfCare? episodeOfCare;
  AddEpisodeAction({this.episodeOfCare});

  @override
  AppState? reduce() {
    return state.copyWith.clinicalState
        ?.call(currentEpisodeOfCare: episodeOfCare);
  }
}
