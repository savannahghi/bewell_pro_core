// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:rxdart/subjects.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/complete_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_tiles.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_primary_patient_banner.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

/// [common] and [shared]

class PatientExam extends StatelessWidget {
  final Widget? testChild;

  PatientExam({this.testChild});

  /// We use this key to open the end drawer
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// Stores the value of the currently selected drawer
  final BehaviorSubject<DrawerType> selectedDrawer =
      BehaviorSubject<DrawerType>();

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreenDevice = ResponsiveWidget.isLargeScreen(context);
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    final double screenWidth = MediaQuery.of(context).size.width;

    return AppScaffold(
        scaffoldKey: scaffoldKey,
        currentBottomNavIndex: BottomNavIndex.patients.index,
        endDrawer: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: isSmallScreen ? screenWidth : screenWidth * 0.5,
              height: MediaQuery.of(context).size.height,
              child: Drawer(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    activeDrawer(drawer: selectedDrawer.value.name),
                  ],
                ),
              ),
            );
          },
        ),
        body: testChild == null
            ? ListView(
                shrinkWrap: true,
                children: <Widget>[
                  /// Patient Banner
                  BeWellPrimaryPatientBanner(),

                  /// Patient Exam Body Starts Here
                  Container(
                    padding: EdgeInsets.all(isLargeScreenDevice ? 20 : 10),
                    child: Column(
                      children: <Widget>[
                        PatientExamTiles(),

                        /// View Summary Button
                        smallVerticalSizedBox,

                        Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SILSecondaryButton(
                                  buttonKey:
                                      AppWidgetKeys.patientExamBackButton,
                                  customPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  onPressed: () async => triggerNavigationEvent(
                                      context: context,
                                      route: patientProfilePageRoute),
                                  text: backText,
                                  buttonColor: Colors.transparent,
                                  textColor: Theme.of(context).primaryColor,
                                  addBorder: true,
                                  borderColor: Theme.of(context).primaryColor),

                              /// Button for:
                              /// View Summary
                              /// View Summary and complete
                              CompleteButton(
                                  buttonText: isSmallScreen
                                      ? completeBtnTextSmallScreen
                                      : completeBtnTextLargeScreen),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : SizedBox(child: testChild));
  }
}
