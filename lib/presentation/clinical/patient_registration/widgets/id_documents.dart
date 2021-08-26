import 'package:file/file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/basic_details_form_manager.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_registration_image_data.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/identification_details.dart';
import 'package:bewell_pro_core/domain/core/failures/generic_exception.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/document_camera_selector.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

class IDDocumentsWidget extends StatefulWidget {
  final TakePhotoCallback takePhotoCallback;
  final BasicDetailsFormManager formManager;
  final FileSystem fileSystem;
  final String? userType;

  const IDDocumentsWidget({
    Key? key,
    required this.takePhotoCallback,
    this.userType,
    required this.formManager,
    required this.fileSystem,
  }) : super(key: key);

  @override
  _IDDocumentsWidgetState createState() => _IDDocumentsWidgetState();
}

class _IDDocumentsWidgetState extends State<IDDocumentsWidget> {
  String _selectedDocument = DocumentType.National_ID.name;

  @override
  Widget build(BuildContext context) {
    final String _userType = widget.userType!;
    final String idDocumentHint =
        'Enter the ${_userType.toLowerCase()}\'s $_selectedDocument number';

    final String takePhotoString =
        'Take photos of $_selectedDocument (optional)';

    _selectIdentificationDoc(_selectedDocument);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: grey.withOpacity(0.4)),
        color: white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            smallVerticalSizedBox,
            const Align(
              alignment: Alignment.topLeft,
              child: RequiredTextFormHintText(
                hintText: hintIdentification,
              ),
            ),
            smallVerticalSizedBox,
            // Document type
            SILSelectOptionField(
              dropDownInputKey: AppWidgetKeys.basicDetailsIdentificationKey,
              color: grey,
              hintText: hintSelectIdentification,
              options: _getDocumentValues(),
              value: _selectedDocument,
              onChanged: (String? value) {
                if (value != null) {
                  _selectIdentificationDoc(value);
                  setState(() {
                    _selectedDocument = value;
                  });
                }
              },
            ),
            smallVerticalSizedBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                smallVerticalSizedBox,
                smallVerticalSizedBox,
                Align(
                  alignment: Alignment.topLeft,
                  child: RequiredTextFormHintText(
                    hintText: '$_selectedDocument number',
                  ),
                ),
                smallVerticalSizedBox,
                StreamBuilder<IdentificationDetails>(
                  stream: widget.formManager.id,
                  builder: (BuildContext context,
                      AsyncSnapshot<IdentificationDetails> snapshot) {
                    return TextField(
                      key: AppWidgetKeys.basicDetailsIdentificationTextField,
                      inputFormatters: _getInputFormatters(_selectedDocument),
                      keyboardType: TextInputType.text,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black, fontSize: 16),
                      onChanged: (String value) {
                        widget.formManager.inId.add(IdentificationDetails(
                          documentNumber: value,
                          documentType:
                              _documentTypeFromString(_selectedDocument),
                        ));
                      },
                      decoration: InputDecoration(
                        hintText: idDocumentHint,
                        errorText: snapshot.hasError
                            ? (snapshot.error as GenericException?)?.message
                            : null,
                        filled: true,
                        fillColor: white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: grey, fontSize: 16),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white24),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: grey),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: healthcloudAccentColor),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: red),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: red),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        focusColor: healthcloudAccentColor,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.grey, fontSize: 16),
                      ),
                    );
                  },
                ),
                smallVerticalSizedBox,
                smallVerticalSizedBox,
                Text(
                  takePhotoString,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                smallVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        // ID Document front
                        StreamBuilder<PatientRegistrationImageData>(
                          stream: widget.formManager.idDocumentFront,
                          builder: (BuildContext context,
                              AsyncSnapshot<PatientRegistrationImageData>
                                  snapshot) {
                            if (snapshot.hasData) {
                              final File documentFront = widget.fileSystem
                                  .file(snapshot.data!.filePath);
                              return Card(
                                child: GestureDetector(
                                  key: AppWidgetKeys.idDocumentFrontKey,
                                  onTap: () {
                                    widget.takePhotoCallback(
                                      documentType:
                                          ImageDocumentType.IDDocumentFront,
                                    );
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: 320,
                                          height: 180,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(
                                                documentFront,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              retakeIdentification,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                            Text(
                                              retakeIdentificationFront,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return DocumentCameraSelector(
                                key: AppWidgetKeys.idDocumentFrontKey,
                                onTap: () {
                                  widget.takePhotoCallback(
                                      documentType:
                                          ImageDocumentType.IDDocumentFront);
                                },
                                description: captureIdentificationFront,
                                documentType: _selectedDocument,
                              );
                            }
                          },
                        ),

                        mediumHorizontalSizedBox,

                        // ID Document back
                        StreamBuilder<PatientRegistrationImageData>(
                          stream: widget.formManager.idDocumentBack,
                          builder: (BuildContext context,
                              AsyncSnapshot<PatientRegistrationImageData>
                                  snapshot) {
                            if (snapshot.hasData) {
                              final File documentBack = widget.fileSystem
                                  .file(snapshot.data!.filePath);
                              return GestureDetector(
                                onTap: () {
                                  widget.takePhotoCallback(
                                      documentType:
                                          ImageDocumentType.IDDocumentBack);
                                },
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: 320,
                                          height: 180,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(
                                                documentBack,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              retakeIdentification,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                            Text(
                                              retakeIdentificationBack,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return DocumentCameraSelector(
                                key: AppWidgetKeys.idDocumentBackKey,
                                onTap: () {
                                  widget.takePhotoCallback(
                                      documentType:
                                          ImageDocumentType.IDDocumentBack);
                                },
                                description: captureIdentificationBack,
                                documentType: _selectedDocument,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                mediumVerticalSizedBox,
              ],
            ),
            veryLargeVerticalSizedBox,
          ],
        ),
      ),
    );
  }

  List<TextInputFormatter> _getInputFormatters(String selectedDocument) {
    if (selectedDocument == DocumentType.National_ID.name ||
        selectedDocument == DocumentType.Alien_ID.name) {
      return <TextInputFormatter>[
        FilteringTextInputFormatter(idRegex, allow: true)
      ];
    } else {
      return <TextInputFormatter>[
        FilteringTextInputFormatter(passportRegex, allow: true)
      ];
    }
  }

  void _selectIdentificationDoc(String? value) {
    if (value != null) {
      widget.formManager.inDocumentType.add(value);
    }
  }
}

List<String> _getDocumentValues() {
  return DocumentType.values
      .map<String>((DocumentType documentType) => documentType.name)
      .toList();
}

DocumentType _documentTypeFromString(String value) {
  return DocumentType.values.firstWhere(
    (DocumentType element) =>
        element.name == value || element.name.toLowerCase() == value,
  );
}
