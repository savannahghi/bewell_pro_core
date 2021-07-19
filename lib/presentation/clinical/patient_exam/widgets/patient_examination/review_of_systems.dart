import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/decoded_system.dart';
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/review_of_systems_item_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/widgets/quick_access_item_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/utils/patient_exam_utils.dart';

import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';

import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:shared_ui_components/platform_loader.dart';

class ReviewOfSystems extends StatefulWidget {
  const ReviewOfSystems();

  @override
  _ReviewOfSystemsState createState() => _ReviewOfSystemsState();
}

class _ReviewOfSystemsState extends State<ReviewOfSystems> {
  late StreamController<dynamic> _reviewOfSystemStreamController;
  late Stream<dynamic> _reviewSystemsStream;

  @override
  void initState() {
    super.initState();

    this._reviewOfSystemStreamController =
        StreamController<dynamic>.broadcast();
    this._reviewSystemsStream = this._reviewOfSystemStreamController.stream;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await fetchCompositionData(
        streamController: this._reviewOfSystemStreamController,
        context: context,
        compositionTitle: CompositionTypeTitle.reviewOfSystems,
      );
    });

    final StreamView<dynamic> refreshController = StreamView<dynamic>(
        ExamChangeObject().reviewOfSystemsChangeListener.stream);
    refreshController.listen((dynamic value) async {
      if (value is bool && value == true) {
        await fetchCompositionData(
          streamController: this._reviewOfSystemStreamController,
          context: context,
          compositionTitle: CompositionTypeTitle.reviewOfSystems,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = SILResponsiveWidget.isLargeScreen(context);

    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(
          horizontal: isLargeScreen ? 30 : 10, vertical: 10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            child: Column(
              children: <Widget>[
                /// Review of Systems
                mediumVerticalSizedBox,
                const Align(
                    alignment: Alignment.centerLeft,
                    child: PatientExamCardTitle(title: reviewOfSystemsCard)),
                smallVerticalSizedBox,

                /// Review of Systems Quick Access
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(quickAccessTitle,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                Wrap(children: <Widget>[
                  ...ReviewSystems.values.map(
                    (ReviewSystems system) => QuickAccessItemWidget(
                      openPatientExamDrawer: () => openPatientExamDrawer(
                          context: context, system: system),
                      reviewName: system.reviewDefinition.reviewName,
                      drawerType: system.reviewDefinition.drawerType,
                    ),
                  )
                ]),
              ],
            ),
          ),
          StreamBuilder<dynamic>(
            stream: _reviewSystemsStream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.data == null) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: GenericZeroStateWidget(
                      title: addReviewOfSystemsTitle,
                      subtitle: addReviewOfSystemsSubtitle),
                );
              }

              if (snapshot.hasData) {
                if (snapshot.data is Map) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: SILPlatformLoader(),
                  );
                }

                final Composition? composition = snapshot.data as Composition?;

                if (composition != null) {
                  // set the composition ID so the composition can be updated instead of
                  // being created again. This is also used when retiring the systems
                  ExamCompositionObject()
                      .reviewCompositionID
                      .add(composition.id);

                  // enable view summary button
                  ViewSummaryStore().viewSummaryButton.add(true);

                  /// decoded systems data from the [Div] property for each of the systems
                  final List<DecodedSystem> systems = ReviewSystems.values
                      .map((ReviewSystems system) =>
                          DecodedSystem.deconstructReviewOfSystem(
                            title: system.systemDataName,
                            compositionPayload: composition,
                          ))
                      .toList();

                  return Column(
                    children: <Widget>[
                      ...systems.map((DecodedSystem system) {
                        // check if it is the default one
                        if (system.decodedJson.isNotEmpty == true &&
                            system.decodedJson !=
                                DecodedSystem.initial().decodedJson) {
                          return ReviewOfSystemsItemWidget(
                            decodedSystem: system,
                            streamController: _reviewOfSystemStreamController,
                          );
                        }
                        return const SizedBox();
                      }),
                    ],
                  );
                }
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
