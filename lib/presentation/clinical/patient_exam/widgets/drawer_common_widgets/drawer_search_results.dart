// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';
import 'package:sghi_core/ui_components/src/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/concepts.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_help_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/result_not_found.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_timeline_divider_widget.dart';

class DrawerSearchResults extends StatelessWidget {
  const DrawerSearchResults({
    required this.resultsStream,
    required this.onSelectCallback,
    required this.storeItemID,
    required this.storeItemName,
    required this.storeItemDisplay,
    required this.helpWidgetItemName,
    this.scrollController,
  });

  final String helpWidgetItemName;
  final Function onSelectCallback;
  final Stream<dynamic> resultsStream;
  final ScrollController? scrollController;
  final BehaviorSubject<String?>? storeItemDisplay;
  final BehaviorSubject<String?> storeItemID;
  final BehaviorSubject<String?> storeItemName;

  void showSearchResults({
    required String itemName,
    required String itemId,
    required String itemDisplayName,
  }) {
    storeItemName.add(itemName);
    storeItemID.add(itemId);
    if (storeItemDisplay != null) {
      storeItemDisplay!.add(itemDisplayName);
    }
    onSelectCallback();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: false,
      controller: scrollController,
      child: StreamBuilder<dynamic>(
        stream: resultsStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) return ResultsNotFound();

          if (snapshot.hasData) {
            //show the loader before data is displayed
            if (snapshot.data is Map<String, dynamic> &&
                snapshot.data['loading'] != null &&
                snapshot.data['loading'] == true) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const SILPlatformLoader(),
              );
            }

            final List<Concept?>? itemsList =
                ConceptList.fromJson(snapshot.data as Map<String, dynamic>)
                    .listConcepts;

            // check if the Stream<dynamic> has error in data
            if (itemsList!.isEmpty) return ResultsNotFound();

            return Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  border: Border.all(color: grey.withOpacity(0.3))),
              child: ListView.builder(
                itemCount: itemsList.length,
                itemBuilder: (BuildContext context, int index) {
                  final Concept itemRecord = itemsList[index]!;
                  final String itemDisplayName = itemRecord.displayName!;
                  final String itemId = itemRecord.id ?? '';

                  return ListBody(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                                toBeginningOfSentenceCase(
                                    itemDisplayName.toString().toLowerCase())!,
                                overflow: TextOverflow.clip,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.w700)),
                          ),
                          Flexible(
                            child: SILPrimaryButton(
                              buttonKey: Key(itemId),
                              onPressed: () => showSearchResults(
                                  itemDisplayName: itemDisplayName,
                                  itemName: itemDisplayName,
                                  itemId: itemId),
                              buttonColor:
                                  healthcloudAccentColor.withOpacity(0.3),
                              text: selectBtnText,
                              textColor: healthcloudAccentColor,
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
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: DrawerHelpWidget(helpString: helpWidgetItemName),
            );
          }
        },
      ),
    );
  }
}
