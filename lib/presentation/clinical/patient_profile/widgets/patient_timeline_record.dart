import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_item.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition_item.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_item.dart';
import 'package:bewell_pro_core/domain/clinical/entities/observation_item.dart';
import 'package:bewell_pro_core/domain/clinical/entities/service_request_item.dart';

import 'package:intl/intl.dart';
import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/spaces.dart';

import 'package:shared_themes/text_themes.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/badge.dart';
import 'package:shared_ui_components/buttons.dart';

class PatientTimelineRecord extends StatefulWidget {
  const PatientTimelineRecord({required this.visit});
  final dynamic visit;

  @override
  _PatientTimelineRecordState createState() => _PatientTimelineRecordState();
}

class _PatientTimelineRecordState extends State<PatientTimelineRecord> {
  bool showAll = false;
  late bool collapse;

  @override
  void initState() {
    collapse = true;
    super.initState();
  }

  void toggleExpandRecord() {
    setState(() {
      collapse = !collapse;
    });
  }

  Widget _buildServiceRequestItem(dynamic item) {
    final ServiceRequestItem service = ServiceRequestItem(item: item);
    return service.display == null
        ? const SizedBox()
        : Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: grey.withOpacity(0.3)))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                size15VerticalSizedBox,
                Text(
                  toBeginningOfSentenceCase(service.request?.toLowerCase())!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                size15VerticalSizedBox,
                Wrap(
                  runSpacing: 10.0,
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                              text: service.display,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w400, color: grey))
                        ],
                      ),
                    ),
                    smallHorizontalSizedBox,
                    SILBadge(
                        text: toBeginningOfSentenceCase(
                            service.status!.toLowerCase())!)
                  ],
                ),
              ],
            ),
          );
  }

  Widget _buildAllergyItem(dynamic item) {
    final AllergyItem allergy = AllergyItem(item: item);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: grey.withOpacity(0.6)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          size15VerticalSizedBox,
          Text(
            toBeginningOfSentenceCase(allergy.substance.toLowerCase())!,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          size15VerticalSizedBox,
          Wrap(
            runSpacing: 10.0,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                        text: reactionText,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: allergy.reaction,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w400, color: grey))
                  ],
                ),
              ),
              smallHorizontalSizedBox,
              SILBadge(
                  text: toBeginningOfSentenceCase(
                      allergy.severity.toLowerCase())!)
            ],
          ),
          size15VerticalSizedBox,
          Text(
            allergy.note,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: grey),
          ),
        ],
      ),
    );
  }

  Widget _buildObservationItem(dynamic item) {
    final ObservationItem observationItem = ObservationItem(item: item);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: grey.withOpacity(0.6)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          size15VerticalSizedBox,
          Text(
            toBeginningOfSentenceCase(observationItem.observation)!,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(fontWeight: FontWeight.bold, height: 2),
          ),
          Wrap(
              key: AppWidgetKeys.timelineObservationItemsSizedBoxKey,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                          text: observationItem.value,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w400, color: grey)),
                      TextSpan(
                          text: observationItem.unit,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w400, color: grey))
                    ],
                  ),
                ),
              ]),
          size15VerticalSizedBox,
          RichText(
            text: TextSpan(
              children: <InlineSpan>[
                TextSpan(
                    text: recorded,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500)),
                TextSpan(
                    text: observationItem.date.split('T')[0],
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w400, color: grey))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationItem(dynamic item) {
    final MedicationItem medicationItem =
        MedicationItem(item: item as Map<String, dynamic>);
    return medicationItem.medication == null
        ? const SizedBox()
        : Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: grey.withOpacity(0.2)))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                size15VerticalSizedBox,
                Text(
                  toBeginningOfSentenceCase(
                      medicationItem.medication!.toLowerCase())!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                size15VerticalSizedBox,
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                              text: orderedOn,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: medicationItem.orderDate,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w400, color: grey))
                        ],
                      ),
                    ),
                    smallHorizontalSizedBox,
                    SILBadge(
                        text: toBeginningOfSentenceCase(
                            medicationItem.medicationStatus!.toLowerCase())!)
                  ],
                ),
                if (medicationItem.dosageInstruction != null) ...<Widget>[
                  size15VerticalSizedBox,
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                            text: dosageInstruction,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Theme.of(context).primaryColorDark)),
                        TextSpan(
                            text: medicationItem.dosageInstruction,
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  )
                ],
              ],
            ),
          );
  }

  Widget _buildConditionItem(dynamic item) {
    final ConditionItem conditionItem =
        ConditionItem(item: item as Map<String, dynamic>);

    return conditionItem.condition == null
        ? const SizedBox()
        : Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: grey.withOpacity(0.2)))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                size15VerticalSizedBox,
                Text(
                  toBeginningOfSentenceCase(conditionItem.condition)!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                size15VerticalSizedBox,
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                              text: recordDate,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: conditionItem.date,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w400, color: grey))
                        ],
                      ),
                    ),
                    smallHorizontalSizedBox,
                    if (conditionItem.status != null)
                      SILBadge(text: conditionItem.status!)
                  ],
                ),
                if (conditionItem.note != null &&
                    conditionItem.note!.isNotEmpty) ...<Widget>[
                  size15VerticalSizedBox,
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                            text: toBeginningOfSentenceCase(
                                '${conditionItem.doctor}\'s note:  '),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColorDark)),
                        TextSpan(
                            text: conditionItem.note,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w400, color: grey))
                      ],
                    ),
                  ),
                ]
              ],
            ),
          );
  }

  Widget _buildIcon(dynamic iconName) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        border: Border.all(
          color: sILButtonColor,
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/$iconName.png',
          height: 30,
          width: 30,
          color: sILButtonColor,
        ),
      ),
    );
  }

  Widget _buildResourceTree(List<dynamic> items, String text,
      Widget Function(dynamic) builder, bool showAll, dynamic iconName) {
    const Color color = healthcloudAccentColor;
    const int count = 1;
    final int length = items.length;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (!SILResponsiveWidget.isSmallScreen(context)) ...<Widget>[
          Column(
            children: <Widget>[
              veryLargeVerticalSizedBox,
              _buildIcon(iconName),
            ],
          ),
          largeHorizontalSizedBox,
        ],
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                toBeginningOfSentenceCase(text.toLowerCase())!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.bold, color: color),
              ),
              for (dynamic item
                  in items.take(showAll ? length : count)) ...<Widget>[
                smallVerticalSizedBox,
                builder(item),
              ]
            ],
          ),
        )
      ],
    );
  }

  Widget _getResource(List<dynamic> resourceItems,
      VisitSummaryType visitSummaryType, bool showAll) {
    switch (visitSummaryType) {
      case VisitSummaryType.service:
        return _buildResourceTree(resourceItems, 'SERVICE REQUESTS',
            _buildServiceRequestItem, showAll, 'bloodoxygen');

      case VisitSummaryType.medication:
        return _buildResourceTree(resourceItems, 'MEDICATION',
            _buildMedicationItem, showAll, 'medicine');

      case VisitSummaryType.condition:
        return _buildResourceTree(
            resourceItems, 'CONDITIONS', _buildConditionItem, showAll, 'heart');

      case VisitSummaryType.allergy:
        return _buildResourceTree(resourceItems, 'ALLERGY INTOLERANCE',
            _buildAllergyItem, showAll, 'vaccine');

      default:
        return _buildResourceTree(resourceItems, 'OBSERVATIONS',
            _buildObservationItem, showAll, 'pulseicon');
    }
  }

  Widget _buildResource(List<dynamic> resourceItems, VisitSummaryType type) {
    if (resourceItems.isNotEmpty) {
      if (collapse) return const SizedBox();
      return Container(
        key: AppWidgetKeys.patientTimelineRecordKey,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: healthcloudAccentColor))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getResource(resourceItems, type, showAll),
            size15VerticalSizedBox,
            if (showAll == false) ...<Widget>[
              SizedBox(
                width: 150,
                height: 40,
                child: SILSecondaryButton(
                  onPressed: () => setState(() {
                    showAll = !showAll;
                  }),
                  buttonColor: healthcloudPrimaryColor.withOpacity(0.05),
                  text: viewAllText,
                  customChild: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          viewAllText,
                          style: TextThemes.normalSize14Text(
                              healthcloudAccentColor),
                        ),
                        verySmallHorizontalSizedBox,
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: healthcloudAccentColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              size15VerticalSizedBox,
            ]
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final String startDate = widget.visit['Encounter'][0]['period']['start']
        .split('T')[0]
        .toString();
    final String formattedDate =
        'Started on ${DateFormat('EEE, d MMMM, yyyy').format(
      DateTime.parse(startDate),
    )}';
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(5, 3),
            color: black.withOpacity(0.08),
            blurRadius: 10,
          )
        ],
        color: white,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: healthcloudAccentColor.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      formattedDate,
                      style: isSmallScreen
                          ? textTheme.bodyText2!.copyWith(color: white)
                          : textTheme.bodyText1!.copyWith(color: white),
                    ),
                    SizedBox(
                      height: 40.0,
                      width: 40.0,
                      child: FittedBox(
                        child: FloatingActionButton(
                          key: AppWidgetKeys.toggleExpandRecordKey,
                          onPressed: () => toggleExpandRecord(),
                          backgroundColor: sILButtonColor,
                          elevation: 0,
                          child: Icon(
                              collapse == false
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              color: white,
                              size: 50),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildResource(
                      widget.visit['AllergyIntolerance'] as List<dynamic>,
                      VisitSummaryType.allergy),
                  _buildResource(
                      widget.visit['MedicationRequest'] as List<dynamic>,
                      VisitSummaryType.medication),
                  _buildResource(widget.visit['Condition'] as List<dynamic>,
                      VisitSummaryType.condition),
                  _buildResource(
                      widget.visit['ServiceRequest'] as List<dynamic>,
                      VisitSummaryType.service),
                  _buildResource(widget.visit['Observation'] as List<dynamic>,
                      VisitSummaryType.observation),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
