import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/user_registration_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_registration_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/patient_registration_steps.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';

class PatientRegistration extends StatefulWidget {
  final UserRegistrationState userRegistrationState;

  const PatientRegistration({
    required this.userRegistrationState,
  });

  @override
  _PatientRegistrationState createState() => _PatientRegistrationState();
}

class _PatientRegistrationState extends State<PatientRegistration>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late Widget _container;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);

    /// initialize PatientRegistrationContainer to make it immune to
    /// app lifecycle state changes
    _container = _initializeContainer();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StoreProvider.dispatch<CoreState>(
      context,
      UserRegistrationAction(
        userType: widget.userRegistrationState.userType,
        userRegistrationMutation:
            widget.userRegistrationState.userRegistrationMutation,
        primaryRouteName: widget.userRegistrationState.primaryRouteName,
      ),
    );
    return AppScaffold(
      currentBottomNavIndex: BottomNavIndex.patient_reg.index,
      body: _container,
    );
  }

  Widget _initializeContainer() {
    return PatientRegistrationContainer(
      tabController: _tabController,
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) => Row(
          children: <Widget>[
            if (ResponsiveWidget.isLargeScreen(context))
              Expanded(
                flex: 2,
                child: Container(
                  color: white,
                  child: const PatientRegistrationSteps(),
                ),
              ),
            Expanded(
              flex: 4,
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: PatientRegistrationContainer.of(context)!.tabs,
              ),
            )
          ],
        ),
      ),
    );
  }
}
