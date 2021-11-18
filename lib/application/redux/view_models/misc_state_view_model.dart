// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';

class MiscStateViewModel extends Vm {
  final MiscState? state;

  MiscStateViewModel({required this.state}) : super(equals: <Object?>[state]);

  static MiscStateViewModel fromStore(Store<CoreState> store) {
    return MiscStateViewModel(state: store.state.miscState);
  }
}
