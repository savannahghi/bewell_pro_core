import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_edge.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_secondary_patient_banner_logic.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_allergies.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_conditions.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_medication.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

/// patient examination and medication service
class BeWellSecondaryPatientBanner extends StatefulWidget {
  @override
  BeWellSecondaryPatientBannerState createState() =>
      BeWellSecondaryPatientBannerState();
}

class BeWellSecondaryPatientBannerState
    extends State<BeWellSecondaryPatientBanner> with TickerProviderStateMixin {
  late double height;

  late TabController _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _handleTabSelection();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      height = getHeightAndFilterData(_tabController.index);
    });
  }

  /// calculates the height of the container based on the number of items
  ///
  /// Additional: Filters all relevant and active problems, allergies and
  /// medications for this patient based on their clinical status
  static double getHeightAndFilterData(int index) {
    final SecondaryBannerInfoObject secondaryBannerInfoObject =
        SecondaryBannerInfoObject();

    final List<AllergyIntoleranceRelayEdge?>? allergies =
        secondaryBannerInfoObject.allergiesList.valueOrNull;

    final List<ConditionEdgeRelay?>? conditions =
        secondaryBannerInfoObject.problemsList.valueOrNull;

    final List<MedicationEdgeRelay?>? medications =
        secondaryBannerInfoObject.medicationsList.valueOrNull;

    const double defaultHeight = 230.0;

    switch (index) {
      case 0:
        if (conditions == null) {
          return defaultHeight;
        }
        final List<ConditionEdgeRelay?> all = conditions
            .where((ConditionEdgeRelay? e) =>
                (e!.node!.clinicalStatus!.text == 'Active') &&
                (e.node!.category![0]!.text ==
                    ConditionCategory.problemListItem.name))
            .toList();
        return all.isEmpty ? defaultHeight : kProblemItemHeight * all.length;

      case 1:
        final List<dynamic> all =
            BeWellSecondaryPatientBannerLogic.activeAllergy(allergies);
        return all.isEmpty ? defaultHeight : kProblemItemHeight * all.length;

      default:
        if (medications == null) {
          return defaultHeight;
        }
        final List<MedicationEdgeRelay?> all = medications
            .where(
                (MedicationEdgeRelay? e) => e!.node!.status!.name == 'Active')
            .toList();

        return all.isEmpty ? defaultHeight : kProblemItemHeight * all.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);
    final double width = MediaQuery.of(context).size.width;
    final TextStyle tabStyle = Theme.of(context)
        .textTheme
        .subtitle2!
        .copyWith(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: grey.withOpacity(0.4))),
      child: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // secondary banner tabs
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: grey.withOpacity(0.4))),
                  child: TabBar(
                    indicatorColor: healthcloudAccentColor,
                    labelStyle: tabStyle,
                    labelColor: healthcloudAccentColor,
                    unselectedLabelColor: grey,
                    controller: _tabController,
                    isScrollable: isSmallScreen,
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          conditionsString,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      Tab(
                        child: Text(
                          allergiesString,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      Tab(
                        child: Text(
                          medicationsString,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ],
                  ),
                ),

                // secondary banner content
                Container(
                  height: height,
                  constraints: const BoxConstraints(maxHeight: 400),
                  child: TabBarView(
                    controller: _tabController,
                    children: const <Widget>[
                      SecondaryBannerConditions(),
                      SecondaryBannerAllergies(),
                      SecondaryBannerMedications(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
