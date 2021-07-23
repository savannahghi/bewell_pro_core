import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_reaction.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_edge.dart';
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

class SecondaryBannerAllergies extends StatefulWidget {
  const SecondaryBannerAllergies();

  @override
  _SecondaryBannerAllergiesState createState() =>
      _SecondaryBannerAllergiesState();
}

class _SecondaryBannerAllergiesState extends State<SecondaryBannerAllergies> {
  final ScrollController _allergiesScrollController = ScrollController();
  late Stream<dynamic> _allergiesStream;
  late StreamController<dynamic> _allergiesStreamController;
  late StreamController<dynamic> _retireStreamController;

  @override
  void dispose() {
    _allergiesStreamController.close();
    _retireStreamController.close();
    _allergiesScrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _allergiesStreamController = StreamController<dynamic>.broadcast();
    _allergiesStream = _allergiesStreamController.stream;

    _retireStreamController = StreamController<dynamic>.broadcast();

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      await fetchAllergies(context);
      final StreamView<dynamic> refreshController = StreamView<dynamic>(
          SecondaryBannerChangeObject().allergiesListener.stream);
      refreshController.listen((dynamic value) async {
        if (value is bool && value == true) {
          await fetchAllergies(context);
        }
      });
    });
  }

  Future<void> fetchAllergies(BuildContext context) async {
    await BeWellSecondaryPatientBannerLogic.secondaryBannerCommonFetchFunction(
      streamController: _allergiesStreamController,
      queryString: findPatientExistingAllergiesQuery,
      context: context,
    );
  }

  Future<void> retirePatientAllergies({
    required BuildContext context,
    required String recordedAllergy,
    required String patientName,
    required AllergyIntolerance patientAllergyData,
  }) async {
    await createRetireModal(
      context: context,
      retireItemName: recordedAllergy,
      section: SectionType.allergy,
      patientName: patientName,
      onChangeReasonField: (String? value) {
        RetireReasonObject().reason.add(value);
      },
      onAllergiesRetireCallback: () async {
        Navigator.of(context, rootNavigator: true).pop();

        await genericFetchFunction(
          streamController: _retireStreamController,
          context: context,
          queryString: updateAllergyMutation,
          variables: updateAllergyMutationVariables(
              patientAllergyData, RetireReasonObject().reason.value!),
          logTitle: 'Retire patient exam allergy',
        );

        RetireReasonObject().reset();

        PrimaryBannerInfoObject().patientBannerChangeListener.add(true);
        SecondaryBannerChangeObject().allergiesListener.add(true);

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content:
                Text(UserFeedBackTexts.getSuccessfulRetireMessage('Allergy')),
            duration: const Duration(seconds: kShortSnackBarDuration),
          ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: StreamBuilder<dynamic>(
        stream: _allergiesStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['loading'] != null ||
                snapshot.data['loading'] == true) {
              return const SILPlatformLoader();
            }
          }
          final List<AllergyIntoleranceRelayEdge?>? allAllergies =
              SecondaryBannerInfoObject().allergiesList.value;

          if (allAllergies == null) {
            return const SecondaryBannerZeroState(currentTabName: allergies);
          }

          // Process the allergies and get only the ones that are currently active and not resolved
          final List<AllergyIntolerance> activeAllergies =
              BeWellSecondaryPatientBannerLogic.activeAllergy(allAllergies);

          // check if behavior object has data or if it is an empty list
          if (activeAllergies.isEmpty) {
            return const SecondaryBannerZeroState(currentTabName: allergies);
          }

          return Scrollbar(
            controller: _allergiesScrollController,
            isAlwaysShown: activeAllergies.length > 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ListView.builder(
                itemCount: activeAllergies.length,
                shrinkWrap: true,
                controller: _allergiesScrollController,
                itemBuilder: (BuildContext context, int index) {
                  final AllergyIntolerance _patientAllergyDetails =
                      activeAllergies[index];

                  final List<AllergyIntoleranceReaction?>? allergyReactions =
                      _patientAllergyDetails.reaction;

                  final String? recorder =
                      _patientAllergyDetails.recorder?.display;

                  final List<Widget> allergyWidgets = <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 250,
                          child: Wrap(
                            children: <Widget>[
                              Text(
                                toBeginningOfSentenceCase(allergyReactions
                                    ?.first?.substance?.text
                                    ?.toLowerCase())!,
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
                              recorder ?? '',
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
                                Text(_patientAllergyDetails.recordedDate ?? '')
                              ])
                            else
                              Text(_patientAllergyDetails.recordedDate ?? ''),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: isSmallScreen ? 5 : 0),
                      child: Row(
                        children: <Widget>[
                          Text(verificationStatusText,
                              style: Theme.of(context).textTheme.bodyText2),
                          verySmallHorizontalSizedBox,
                          Text(
                              _patientAllergyDetails.verificationStatus?.text ??
                                  '',
                              style: Theme.of(context).textTheme.button,
                              overflow: TextOverflow.ellipsis)
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: isSmallScreen ? double.infinity : 100,
                        child: SILSecondaryButton(
                          buttonKey: AppWidgetKeys.retireSecondaryAllergy,
                          borderColor: redAccent,
                          onPressed: () => retirePatientAllergies(
                            patientAllergyData: _patientAllergyDetails,
                            context: context,
                            recordedAllergy:
                                allergyReactions?.first?.substance?.text ?? '',
                            patientName:
                                _patientAllergyDetails.patient?.display ?? '',
                          ),
                          text: retireText,
                          textColor: redAccent,
                        ),
                      ),
                    ),
                  ];
                  return ListBody(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: grey.withOpacity(0.3)))),
                        child: Wrap(children: allergyWidgets),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
