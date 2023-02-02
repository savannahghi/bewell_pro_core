// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/ui_components/src/inputs.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/patient_history_form.dart';

class HistoryFormInput extends StatefulWidget {
  // the title of the input
  final String title;

  // a [HistoryPayloadType] representing which of the [HistoryPayloadType] inputs
  // the user is editing
  final HistoryPayloadType type;

  // the initial input data
  final String? initialInputData;

  // a function to update the data after modification
  final UpdatePatientHistoryPayload? updateInputDataFunction;

  // stores a list of functions to be performed based on the type
  final List<dynamic> callbackRegister;

  // if the input is required
  final bool isRequired;

  final Key inputKey;

  const HistoryFormInput({
    Key? key,
    required this.title,
    required this.type,
    required this.callbackRegister,
    required this.initialInputData,
    this.updateInputDataFunction,
    required this.isRequired,
    required this.inputKey,
  }) : super(key: key);

  @override
  _HistoryFormInputState createState() => _HistoryFormInputState();
}

class _HistoryFormInputState extends State<HistoryFormInput> {
  // whether the input is editable
  late bool isEditable;
  late String? payload;

  @override
  void initState() {
    super.initState();
    widget.callbackRegister.add(_updateAndCloseInput);

    setState(() {
      if (widget.initialInputData == null) {
        isEditable = true;
      } else {
        isEditable = false;
      }
      payload = widget.initialInputData;
    });
  }

  /// saves the current text in the input and closes the form
  ///
  /// Closing the input in this case means toggling [isEditable] to false
  void _updateAndCloseInput() {
    widget.updateInputDataFunction!(widget.type, payload)();
    setState(() {
      isEditable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: grey.withOpacity(0.2)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // the title
              Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),

              // the edit icon button
              if (payload != null)
                TextButton(
                  key: widget.inputKey,
                  onPressed: () {
                    setState(() {
                      isEditable = !isEditable;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        editText,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: healthcloudPrimaryColor),
                      ),
                      verySmallHorizontalSizedBox,
                      const Icon(UniconsLine.edit_alt,
                          size: 14, color: healthcloudPrimaryColor),
                    ],
                  ),
                )
            ],
          ),

          /// show a [SILFormTextField] to collect input if [isEditable] is true
          if (isEditable) ...<Widget>[
            size15VerticalSizedBox,
            SILFormTextField(
              key: widget.inputKey,
              labelText: descriptionText,
              maxLines: 4,
              validator: widget.isRequired
                  ? (String? val) {
                      if (val!.isEmpty) {
                        return enterText;
                      }
                      payload = val;
                      return null;
                    }
                  : (String? v) {
                      return null;
                    },
              initialValue: payload,
              onChanged: (String v) {
                widget.callbackRegister
                    .add(widget.updateInputDataFunction!(widget.type, v));
              },
            ),
          ],
          if (!isEditable)
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 15),
              child: Text(
                payload ?? '',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
