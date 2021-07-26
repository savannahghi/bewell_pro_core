import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:domain_objects/entities.dart';

class NavigationAction extends ReduxAction<CoreState> {
  final int? drawerSelectedIndex;
  final int? bottomBarSelectedIndex;
  final List<NavigationItem>? primaryActions;
  final List<NavigationItem>? secondaryActions;

  NavigationAction({
    this.drawerSelectedIndex,
    this.bottomBarSelectedIndex,
    this.primaryActions,
    this.secondaryActions,
  });

  @override
  CoreState reduce() {
    final Navigation? newState = state.navigationState?.copyWith.call(
      drawerSelectedIndex:
          drawerSelectedIndex ?? state.navigationState!.drawerSelectedIndex,
      bottomBarSelectedIndex: bottomBarSelectedIndex ??
          state.navigationState!.bottomBarSelectedIndex,
      primaryActions: primaryActions ?? state.navigationState!.primaryActions,
      secondaryActions:
          secondaryActions ?? state.navigationState!.secondaryActions,
    );

    return state.copyWith(navigationState: newState);
  }
}
