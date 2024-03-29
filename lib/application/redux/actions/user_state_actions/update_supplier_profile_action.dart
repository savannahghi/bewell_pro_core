// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/domain_objects/entities/supplier_profile.dart';
import 'package:sghi_core/domain_objects/value_objects/enums.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

class UpdateSupplierProfileAction extends ReduxAction<CoreState> {
  UpdateSupplierProfileAction({
    this.partnerType,
    this.partnerSetupComplete,
  });

  final SupplierPartnerType? partnerType;
  final bool? partnerSetupComplete;

  @override
  CoreState reduce() {
    final CoreState appState = state;

    final SupplierProfile newSupplierProfile =
        appState.supplierProfileState!.copyWith.call(
      partnerType: partnerType ?? appState.supplierProfileState!.partnerType,
      partnerSetupComplete: partnerSetupComplete ??
          appState.supplierProfileState!.partnerSetupComplete,
    );

    final CoreState newState =
        appState.copyWith(supplierProfileState: newSupplierProfile);

    return newState;
  }
}
