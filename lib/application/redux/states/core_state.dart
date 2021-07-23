import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/connectivity_state.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_feed_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';

part 'core_state.freezed.dart';
part 'core_state.g.dart';

// CoreState assembles all features states into one that can the pushed during creation
// to create on global app store
@freezed
class CoreState with _$CoreState {
  factory CoreState({
    MiscState? miscState,
    UserFeedState? userFeedState,
    UserState? userState,
    ConnectivityState? connectivityState,
    ClinicalState? clinicalState,
    Navigation? navigationState,
    @JsonKey(ignore: true) Wait? wait,
  }) = _CoreState;

  factory CoreState.fromJson(Map<String, dynamic> json) =>
      _$CoreStateFromJson(json);

  factory CoreState.initial() => CoreState(
        miscState: MiscState.initial(),
        userFeedState: UserFeedState.initial(),
        userState: UserState.initial(),
        connectivityState: ConnectivityState.initial(),
        clinicalState: ClinicalState.initial(),
        navigationState: Navigation.initial(),
        wait: Wait(),
      );
}
