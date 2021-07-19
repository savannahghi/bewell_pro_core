//Patient Conditions
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition_edge.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';

import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_secondary_patient_banner_logic.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_zero_experience.dart';

import 'package:intl/intl.dart';
import 'package:misc_utilities/misc.dart';

import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/retire_helper.dart';
import 'package:shared_themes/colors.dart';

import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';

class SecondaryBannerConditions extends StatefulWidget {
  const SecondaryBannerConditions();

  @override
  _SecondaryBannerConditionsState createState() =>
      _SecondaryBannerConditionsState();
}

class _SecondaryBannerConditionsState extends State<SecondaryBannerConditions> {
  final ScrollController _conditionsScrollController = ScrollController();
  late Stream<dynamic> _conditionsStream;
  late StreamController<dynamic> _conditionsStreamController;
  late StreamController<dynamic> _retireStreamController;

  @override
  void dispose() {
    _conditionsStreamController.close();
    _retireStreamController.close();
    _conditionsScrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _conditionsStreamController = StreamController<dynamic>.broadcast();
    _conditionsStream = _conditionsStreamController.stream;

    _retireStreamController = StreamController<dynamic>.broadcast();

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      await fetchConditions(context);
      final StreamView<dynamic> refreshController = StreamView<dynamic>(
          SecondaryBannerChangeObject().conditionsListener.stream);
      refreshController.listen((dynamic value) async {
        if (value is bool && value == true) {
          await fetchConditions(context);
        }
      });
    });
  }

  Future<void> retirePatientCondition({
    required BuildContext context,
    required String recordedProblem,
    required String patientName,
    required Condition? patientDetail,
  }) async {
    await createRetireModal(
      context: context,
      retireItemName: recordedProblem,
      section: SectionType.condition,
      patientName: patientName,
      onChangeReasonField: (String? value) {
        RetireReasonObject().reason.add(value);
      },
      onProblemRetireCallback: () async {
        Navigator.of(context, rootNavigator: true).pop();

        await genericFetchFunction(
          streamController: _retireStreamController,
          context: context,
          queryString: updateProblemMutation,
          variables: updateProblemMutationVariables(
              patientDetail!, RetireReasonObject().reason.value!),
          logTitle: 'Retire patient exam condition',
        );

        RetireReasonObject().reset();

        // Update listeners
        PrimaryBannerInfoObject().patientBannerChangeListener.add(true);
        SecondaryBannerChangeObject().conditionsListener.add(true);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(UserFeedBackTexts.getSuccessfulRetireMessage(problem)),
          duration: const Duration(seconds: kShortSnackBarDuration),
        ));
      },
    );
  }

  Future<void> fetchConditions(BuildContext context) async {
    await BeWellSecondaryPatientBannerLogic.secondaryBannerCommonFetchFunction(
      streamController: _conditionsStreamController,
      queryString: findPatientsExistingConditionsQuery,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: StreamBuilder<dynamic>(
        stream: _conditionsStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['loading'] != null ||
                snapshot.data['loading'] == true) {
              return const SILPlatformLoader();
            }

            final List<ConditionEdgeRelay?>? allConditions =
                SecondaryBannerInfoObject().problemsList.value;

            if (allConditions == null) {
              return const SecondaryBannerZeroState(
                  currentTabName: problemsText);
            }

            //Active Conditions
            final List<ConditionEdgeRelay?> activeConditions = allConditions
                .where((ConditionEdgeRelay? condition) =>
                    (condition!.node!.clinicalStatus!.text == 'Active') &&
                    (condition.node!.category![0]!.text ==
                        ConditionCategory.problemListItem.name))
                .toList();

            // check if the behavior object has data
            if (activeConditions.isEmpty) {
              return const SecondaryBannerZeroState(
                  currentTabName: problemsText);
            }

            //Conditions list builder
            return Scrollbar(
              controller: _conditionsScrollController,
              isAlwaysShown: true,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ListView.builder(
                  itemCount: activeConditions.length,
                  shrinkWrap: true,
                  controller: _conditionsScrollController,
                  itemBuilder: (BuildContext context, int index) {
                    final Condition? patientDetail =
                        activeConditions[index]!.node;

                    final List<Widget> conditionWidgets = <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 250,
                            child: Wrap(
                              children: <Widget>[
                                Text(
                                  toBeginningOfSentenceCase(patientDetail!
                                      .code!.text!
                                      .toLowerCase())!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          if (isSmallScreen)
                            verySmallVerticalSizedBox
                          else
                            smallVerticalSizedBox,
                          Row(
                            children: <Widget>[
                              Text(
                                patientDetail.recorder!.display!,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              if (isSmallScreen)
                                mediumHorizontalSizedBox
                              else
                                verySmallHorizontalSizedBox,
                              if (isSmallScreen)
                                Row(children: <Widget>[
                                  Text(date,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith()),
                                  Text(patientDetail.recordedDate!,
                                      style: Theme.of(context).textTheme.button)
                                ])
                              else
                                Text(patientDetail.recordedDate!),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: isSmallScreen ? 5 : 0),
                        child: Row(
                          children: <Widget>[
                            Text(verificationStatusText,
                                style: Theme.of(context).textTheme.bodyText2),
                            verySmallHorizontalSizedBox,
                            Text(
                                patientDetail.verificationStatus!.coding!.first!
                                    .display!,
                                style: Theme.of(context).textTheme.button,
                                overflow: TextOverflow.ellipsis)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: isSmallScreen ? 5 : 0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(clinicalStatusText,
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                smallHorizontalSizedBox,
                                Text(patientDetail.clinicalStatus!.text!,
                                    style: Theme.of(context).textTheme.button)
                              ],
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: isSmallScreen ? double.infinity : 100,
                          child: SILSecondaryButton(
                              buttonKey: AppWidgetKeys.retireSecondaryCondition,
                              borderColor: redAccent,
                              onPressed: () => retirePatientCondition(
                                  recordedProblem: patientDetail.code!.text!,
                                  context: context,
                                  patientDetail: patientDetail,
                                  patientName: patientDetail.subject!.display!),
                              text: retireText,
                              textColor: redAccent),
                        ),
                      ),
                    ];
                    return ListBody(children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: grey.withOpacity(0.3)))),
                        child: Wrap(children: conditionWidgets),
                      ),
                    ]);
                  },
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
