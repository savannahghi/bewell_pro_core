import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

class CoreStateViewModel extends Vm {
  final CoreState state;

  CoreStateViewModel({required this.state}) : super(equals: <Object?>[state]);

  static CoreStateViewModel fromStore(Store<CoreState> store) {
    return CoreStateViewModel(state: store.state);
  }
}
