// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/concepts.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_help_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/result_not_found.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_timeline_divider_widget.dart';

class MedicationSearchResults extends StatelessWidget {
  const MedicationSearchResults(
      {required this.updateMedicationSelectionStatus,
      required this.medicationStream});

  /// The stream that will be used to display the search results
  final Stream<dynamic> medicationStream;

  /// Updates the medication selection status
  final Function updateMedicationSelectionStatus;

  @override
  Widget build(BuildContext context) {
    final AddMedicationObject addMedicationObject = AddMedicationObject();

    Future<void> _selectMedication(String medicationName,
        String medicationDisplayName, String medicationID) async {
      addMedicationObject
        ..medicationName.add(medicationName)
        ..medicationDisplayName.add(medicationDisplayName)
        ..medicationID.add(medicationID);

      updateMedicationSelectionStatus();
    }

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scrollbar(
      child: StreamBuilder<dynamic>(
        stream: medicationStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                child: const Center(child: Text(errorOccurred)));
          }

          if (snapshot.hasData) {
            //show the loader before data is displayed
            if (snapshot.data is Map<String, dynamic> &&
                snapshot.data['loading'] != null &&
                snapshot.data['loading'] == true) {
              return Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const SILPlatformLoader());
            }

            final List<Concept?> medicationList =
                ConceptList.fromJson(snapshot.data as Map<String, dynamic>)
                    .listConcepts!
                    .toList();

            // check if the Stream<dynamic> has error in data
            if (medicationList.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ResultsNotFound(),
              );
            }

            return Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(color: grey.withOpacity(0.3))),
              height: 220,
              child: ListView.builder(
                itemCount: medicationList.length,
                itemBuilder: (BuildContext context, int index) {
                  final Concept medicationRecord = medicationList[index]!;

                  final String? medicationName = medicationRecord.displayName;

                  final String medicationDisplayName =
                      medicationRecord.displayName!;

                  final String medicationID = medicationRecord.id!;

                  final String conceptClass = medicationRecord.conceptClass!;

                  return ListBody(
                    children: <Widget>[
                      if (conceptClass == ConceptClass.drug.name)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                  toBeginningOfSentenceCase(
                                      medicationDisplayName.toLowerCase())!,
                                  overflow: TextOverflow.clip,
                                  style: textTheme.bodyText1!
                                      .copyWith(fontWeight: FontWeight.w700)),
                            ),
                            Flexible(
                              child: SILPrimaryButton(
                                buttonKey: Key(medicationID),
                                onPressed: () => _selectMedication(
                                  medicationName ?? 'No name',
                                  medicationDisplayName,
                                  medicationID,
                                ),
                                buttonColor:
                                    healthcloudAccentColor.withOpacity(0.3),
                                textColor: healthcloudAccentColor,
                                text: 'Select',
                              ),
                            ),
                          ],
                        ),
                      verySmallVerticalSizedBox,
                      PatientTimelineDividerWidget(),
                      verySmallVerticalSizedBox,
                    ],
                  );
                },
              ),
            );
          }

          /// show search instructions if all other conditions fail
          return const Padding(
            padding: EdgeInsets.only(top: 15),
            child: DrawerHelpWidget(helpString: medicationTitle),
          );
        },
      ),
    );
  }
}
