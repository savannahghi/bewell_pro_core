// // CoreState assembles all features states into one that can the pushed during creation
// // to create a global app store

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/connectivity_state.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_feed_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_registration_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:sghi_core/domain_objects/entities/navigation.dart';
import 'package:sghi_core/domain_objects/entities/supplier_profile.dart';

class CoreState extends Equatable {
  const CoreState({
    this.miscState,
    this.userFeedState,
    this.userState,
    this.connectivityState,
    this.clinicalState,
    this.navigationState,
    this.userRegistrationState,
    this.supplierProfileState,
    this.wait,
  });

  final MiscState? miscState;
  final UserFeedState? userFeedState;
  final UserState? userState;
  final ConnectivityState? connectivityState;
  final ClinicalState? clinicalState;
  final Navigation? navigationState;
  final UserRegistrationState? userRegistrationState;
  final SupplierProfile? supplierProfileState;
  final Wait? wait;

  factory CoreState.initial() => CoreState(
        miscState: MiscState.initial(),
        userFeedState: UserFeedState.initial(),
        userState: UserState.initial(),
        connectivityState: ConnectivityState.initial(),
        clinicalState: ClinicalState.initial(),
        navigationState: Navigation.initial(),
        userRegistrationState: UserRegistrationState.initial(),
        supplierProfileState: SupplierProfile.initial(),
        wait: Wait(),
      );

  CoreState copyWith({
    MiscState? miscState,
    UserFeedState? userFeedState,
    UserState? userState,
    ConnectivityState? connectivityState,
    ClinicalState? clinicalState,
    Navigation? navigationState,
    UserRegistrationState? userRegistrationState,
    SupplierProfile? supplierProfileState,
    Wait? wait,
  }) {
    return CoreState(
      miscState: miscState ?? this.miscState,
      userFeedState: userFeedState ?? this.userFeedState,
      userState: userState ?? this.userState,
      connectivityState: connectivityState ?? this.connectivityState,
      clinicalState: clinicalState ?? this.clinicalState,
      navigationState: navigationState ?? this.navigationState,
      userRegistrationState:
          userRegistrationState ?? this.userRegistrationState,
      supplierProfileState: supplierProfileState ?? this.supplierProfileState,
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
        userRegistrationState,
        supplierProfileState,
        wait,
      ];
}
