// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/misc_state_view_model.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/onboarding/signup/phone_signup.dart';
import 'package:sghi_core/domain_objects/value_objects/unknown.dart';

/// Phone Signup page. Prompts user to signup/register when they don't have an account
class PhoneSignUpPage extends StatefulWidget {
  @override
  _PhoneSignUpPageState createState() => _PhoneSignUpPageState();
}

class _PhoneSignUpPageState extends State<PhoneSignUpPage> {
  @override
  void didChangeDependencies() {
    StoreProvider.dispatch<CoreState>(
      context,
      BatchUpdateMiscStateAction(
        phoneNumber: UNKNOWN,
        otpCode: UNKNOWN,
        acceptedTerms: false,
        accountExists: false,
        title: createAcc,
        message: createAccDesc,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    const double dimension = 0;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: StoreConnector<CoreState, MiscStateViewModel>(
        converter: (Store<CoreState> store) =>
            MiscStateViewModel.fromStore(store),
        builder: (BuildContext context, MiscStateViewModel vm) {
          return OnboardingScaffold(
            dimension: dimension,
            title: vm.state!.title!,
            msg: vm.state!.message,
            icon: MdiIcons.accountEdit,
            child: const PhoneSignUp(),
          );
        },
      ),
    );
  }
}
