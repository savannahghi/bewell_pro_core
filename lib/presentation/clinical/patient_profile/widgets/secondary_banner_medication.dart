import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_edge.dart';
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

class SecondaryBannerMedications extends StatefulWidget {
  const SecondaryBannerMedications();

  @override
  _SecondaryBannerMedicationsState createState() =>
      _SecondaryBannerMedicationsState();
}

class _SecondaryBannerMedicationsState
    extends State<SecondaryBannerMedications> {
  final ScrollController _medicationsScrollController = ScrollController();
  late Stream<dynamic> _medicationsStream;
  late StreamController<dynamic> _medicationsStreamController;
  late StreamController<dynamic> _retireStreamController;

  @override
  void dispose() {
    _medicationsStreamController.close();
    _retireStreamController.close();
    _medicationsScrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _medicationsStreamController = StreamController<dynamic>.broadcast();
    _medicationsStream = _medicationsStreamController.stream;

    _retireStreamController = StreamController<dynamic>.broadcast();

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      await fetchMedications(context);
      final StreamView<dynamic> refreshController = StreamView<dynamic>(
          SecondaryBannerChangeObject().medicationsListener.stream);
      refreshController.listen((dynamic value) async {
        if (value is bool && value == true) {
          await fetchMedications(context);
        }
      });
    });
  }

  Future<void> fetchMedications(BuildContext context) async {
    await BeWellSecondaryPatientBannerLogic.secondaryBannerCommonFetchFunction(
      streamController: _medicationsStreamController,
      queryString: findPatientExistingMedicationQuery,
      context: context,
    );
  }

  Future<void> retirePatientMedication(
      {required BuildContext context,
      required Medication medication,
      required String patientName,
      required String recordedMedication}) async {
    await createRetireModal(
        context: context,
        retireItemName: recordedMedication,
        section: SectionType.medication,
        patientName: patientName,
        onChangeReasonField: (dynamic value) {
          RetireReasonObject().reason.add(value.toString());
        },
        onMedicationRetireCallback: () async {
          Navigator.of(context, rootNavigator: true).pop();

          await genericFetchFunction(
            streamController: _retireStreamController,
            context: context,
            queryString: updateMedicationMutation,
            variables: updateMedicationMutationVariables(
                medication, RetireReasonObject().reason.value!),
            logTitle: 'Retire patient exam medication',
          );

          RetireReasonObject().reset();

          SecondaryBannerChangeObject().medicationsListener.add(true);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                UserFeedBackTexts.getSuccessfulRetireMessage(medicationTitle)),
            duration: const Duration(seconds: kShortSnackBarDuration),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: StreamBuilder<dynamic>(
        stream: _medicationsStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['loading'] != null ||
                snapshot.data['loading'] == true) {
              return const SILPlatformLoader();
            }
          }

          final List<MedicationEdgeRelay?>? allMedications =
              SecondaryBannerInfoObject().medicationsList.value;

          if (allMedications == null) {
            return const SecondaryBannerZeroState(currentTabName: medications);
          }

          // Process the medications and get only the ones that are currently active and not resolved
          final List<MedicationEdgeRelay?> activeMedications = allMedications
              .where((MedicationEdgeRelay? medication) =>
                  medication!.node!.status! == MedicationStatusEnum.active)
              .toList();

          // check if the behavior object has data
          if (activeMedications.isEmpty) {
            return const SecondaryBannerZeroState(currentTabName: medications);
          }

          return Scrollbar(
            controller: _medicationsScrollController,
            isAlwaysShown: activeMedications.length > 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ListView.builder(
                itemCount: activeMedications.length,
                shrinkWrap: true,
                controller: _medicationsScrollController,
                itemBuilder: (BuildContext context, int index) {
                  final Medication? patientDetail =
                      activeMedications[index]!.node;

                  final List<Widget> medicationWidgets = <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 250,
                          child: Wrap(
                            children: <Widget>[
                              Text(
                                toBeginningOfSentenceCase(patientDetail!
                                    .medicationCodeableConcept!.text
                                    .toString()
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
                              patientDetail.requester!.display!,
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
                                Text(patientDetail.authoredOn!,
                                    style: Theme.of(context).textTheme.button)
                              ])
                            else
                              Text(patientDetail.authoredOn!),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: isSmallScreen ? 5 : 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            priorityText,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          verySmallHorizontalSizedBox,
                          Text(
                              toBeginningOfSentenceCase(
                                  patientDetail.priority!.name)!,
                              style: Theme.of(context).textTheme.button,
                              overflow: TextOverflow.ellipsis)
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: isSmallScreen ? 5 : 0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(clinicalStatusText,
                                  style: Theme.of(context).textTheme.bodyText2),
                              verySmallHorizontalSizedBox,
                              Text(
                                toBeginningOfSentenceCase(
                                    patientDetail.status!.name)!,
                                style: Theme.of(context).textTheme.button,
                              )
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
                            buttonKey: AppWidgetKeys.retireSecondaryMedication,
                            borderColor: redAccent,
                            onPressed: () => retirePatientMedication(
                                context: context,
                                recordedMedication: patientDetail
                                    .medicationCodeableConcept!.text!,
                                medication: patientDetail,
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
                        child: Wrap(children: medicationWidgets)),
                  ]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
