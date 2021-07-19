import 'package:flutter/material.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/clinical_exam_forms/save_review_of_systems_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_header.dart';

class ReviewOfSystemsFormBuilder extends StatefulWidget {
  const ReviewOfSystemsFormBuilder({required this.system});

  final ReviewSystems system;

  @override
  _ReviewOfSystemsFormBuilderState createState() =>
      _ReviewOfSystemsFormBuilderState();
}

class _ReviewOfSystemsFormBuilderState
    extends State<ReviewOfSystemsFormBuilder> {
  late List<String> symptoms;

  @override
  void initState() {
    super.initState();
    symptoms = widget.system.drawerData!.symptoms;
    symptoms.map((String element) {
      widget.system.drawerData!.symptomsMap[element] = false;
    }).toList();
    widget.system.drawerData!.description.add(null);
  }

  @override
  Widget build(BuildContext context) {
    const String none = 'none';
    SILCheckbox buildHcCheckbox(BuildContext context, String text) {
      return SILCheckbox(
        text: text,
        value: widget.system.drawerData!.symptomsMap[text],
        onChanged: (bool? val) {
          setState(() {
            widget.system.drawerData!.symptomsMap[text] = val!;
          });
        },
      );
    }

    return Column(
      children: <Widget>[
        SILDrawerHeader(title: widget.system.systemDataName),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  smallVerticalSizedBox,
                  ExpansionTile(
                    initiallyExpanded: true,
                    onExpansionChanged: (bool val) {
                      setState(() {
                        widget.system.drawerData!.symptomsMap[none] = !val;
                      });

                      symptoms.remove(none);
                      symptoms.map((String element) {
                        widget.system.drawerData!.symptomsMap[element] = false;
                      }).toList();
                    },
                    title: SILCheckbox(
                      value: widget.system.drawerData!.symptomsMap[none],
                      text: noAbnormalitiesCheckbox,
                      onChanged: null,
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: symptoms
                              .skip(1)
                              .map((String symptom) =>
                                  buildHcCheckbox(context, symptom))
                              .toList(),
                        ),
                      ),
                      largeVerticalSizedBox,
                    ],
                  ),
                ],
              ),
              largeVerticalSizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      notesTitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    smallVerticalSizedBox,
                    SILFormTextField(
                      labelText: notesTitle,
                      maxLines: 4,
                      onChanged: (String v) {
                        setState(() {
                          widget.system.drawerData!.description.add(v);
                        });
                      },
                    ),
                    largeVerticalSizedBox,
                  ],
                ),
              ),
            ],
          ),
        ),

        // the save button
        SaveReviewOfSystemsButton(
          examCompositionObject:
              widget.system.drawerData!.compositionDataObject,
          compositionData:
              widget.system.drawerData!.dataObject.data as Map<String, dynamic>,
        )
      ],
    );
  }
}
