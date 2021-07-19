import 'package:async_redux/async_redux.dart';

import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

class LogoutAction extends ReduxAction<AppState> {
  @override
  void after() {
    dispatch(NavigateAction<AppState>.pushReplacementNamed(phoneLoginRoute));
    super.after();
  }

  @override
  AppState reduce() {
    final AppState newState = AppState.initial().copyWith.call();
    return newState;
  }
}
