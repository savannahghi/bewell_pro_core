import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';

class AppStateViewModel extends Vm {
  final AppState state;

  AppStateViewModel({required this.state});

  static AppStateViewModel fromStore(Store<AppState> store) {
    return AppStateViewModel(state: store.state);
  }
}
