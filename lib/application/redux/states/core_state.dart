// // CoreState assembles all features states into one that can the pushed during creation
// // to create a global app store
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/connectivity_state.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_feed_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:domain_objects/entities.dart';
import 'package:equatable/equatable.dart';

class CoreState extends Equatable {
  const CoreState({
    this.miscState,
    this.userFeedState,
    this.userState,
    this.connectivityState,
    this.clinicalState,
    this.navigationState,
    this.wait,
  });

  final MiscState? miscState;
  final UserFeedState? userFeedState;
  final UserState? userState;
  final ConnectivityState? connectivityState;
  final ClinicalState? clinicalState;
  final Navigation? navigationState;
  final Wait? wait;

  factory CoreState.initial() => CoreState(
        miscState: MiscState.initial(),
        userFeedState: UserFeedState.initial(),
        userState: UserState.initial(),
        connectivityState: ConnectivityState.initial(),
        clinicalState: ClinicalState.initial(),
        navigationState: Navigation.initial(),
        wait: Wait(),
      );

  CoreState copyWith({
    MiscState? miscState,
    UserFeedState? userFeedState,
    UserState? userState,
    ConnectivityState? connectivityState,
    ClinicalState? clinicalState,
    Navigation? navigationState,
    Wait? wait,
  }) {
    return CoreState(
      miscState: miscState ?? this.miscState,
      userFeedState: userFeedState ?? this.userFeedState,
      userState: userState ?? this.userState,
      connectivityState: connectivityState ?? this.connectivityState,
      clinicalState: clinicalState ?? this.clinicalState,
      navigationState: navigationState ?? this.navigationState,
      wait: wait ?? this.wait,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        miscState,
        userFeedState,
        userState,
        connectivityState,
        clinicalState,
        navigationState,
        wait,
      ];
}
