import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_registration_state.dart';

class UserRegistrationAction extends ReduxAction<CoreState> {
  final String? userType;
  final String? userRegistrationMutation;

  UserRegistrationAction({
    this.userType,
    this.userRegistrationMutation,
  });

  @override
  CoreState reduce() {
    final UserRegistrationState? newState =
        state.userRegistrationState?.copyWith.call(
      userType: userType ?? state.userRegistrationState!.userType,
      userRegistrationMutation: userRegistrationMutation ??
          state.userRegistrationState!.userRegistrationMutation,
    );

    return state.copyWith(userRegistrationState: newState);
  }
}
