import 'dart:async';
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/basic_details_form_manager.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_registration_image_data.dart';
import 'package:bewell_pro_core/domain/clinical/entities/simple_patient_registration_input.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/save_patient_record_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/camera_selection_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/gender_picker.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/id_documents.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/name_field.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/patient_photo.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/permissions_banner.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/phone_number_field.dart';
import 'package:intl/intl.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

import 'package:shared_themes/spaces.dart';

import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';

import 'package:shared_ui_components/inputs.dart';

class BasicDetailsWidget extends StatefulWidget {
  final FileSystem fileSystem;

  const BasicDetailsWidget({
    FileSystem? fileSystem,
  }) : fileSystem = fileSystem ?? const LocalFileSystem();

  @override
  _BasicDetailsWidgetState createState() => _BasicDetailsWidgetState();
}

class _BasicDetailsWidgetState extends State<BasicDetailsWidget>
    with WidgetsBindingObserver {
  final GlobalKey<FormState> _basicDetailsFormKey = GlobalKey<FormState>();

  final TextEditingController datePickerController = TextEditingController();
  final BasicDetailsFormManager _formManager = BasicDetailsFormManager();

  final bool? phoneNotFound = PatientSearchStore().isNotFound.valueOrNull;
  final String? phoneValue = PatientSearchStore().phoneNumber.valueOrNull;
  final ImagePicker imagePicker = ImagePicker();

  /// focus nodes are used to enable seamless data input by automatically focusing
  /// on the next input once the user is done with the current step
  late FocusNode _firstNameFocusNode;
  late FocusNode _lastNameFocusNode;

  // [bool] variables related to camera
  bool isCameraRestricted = true;
  bool isCameraDenied = true;
  bool isCameraPermanentlyDenied = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addObserver(this);

    requestCameraPermissions()
        .then((permission_handler.PermissionStatus? value) {
      if (value != null) _updateCameraPermissionsState(value);
    });

    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
  }

  /// Checks permissions when the app is resumed
  /// a use case for this is:
  ///
  /// - when the app's permissions are changed outside the app
  /// for example in the system settings
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      requestCameraPermissions()
          .then((permission_handler.PermissionStatus? value) {
        if (value != null) _updateCameraPermissionsState(value);
      });
    }
  }

  @override
  void dispose() {
    /// cleanup the controllers and focus node once this widget is removed from the widget tree
    datePickerController.dispose();
    this._firstNameFocusNode.dispose();
    this._lastNameFocusNode.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);

    return Scaffold(
      floatingActionButton: Padding(
        padding: isSmallScreen
            ? const EdgeInsets.fromLTRB(40, 20, 10, 10)
            : const EdgeInsets.only(left: 20.0, right: 60),
        child: StreamBuilder<bool>(
          stream: _formManager.isFormValid,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            final bool hasData = snapshot.hasData;
            final bool? isValid = snapshot.data;

            return FloatingActionButton.extended(
              key: AppWidgetKeys.basicDetailsNextBtnKey,
              backgroundColor: hasData && snapshot.data != null && isValid!
                  ? healthcloudPrimaryColor
                  : Colors.grey,
              label: Row(
                children: const <Widget>[
                  Text(nextBtnText),
                  Icon(Icons.arrow_forward)
                ],
              ),
              onPressed: hasData && snapshot.data != null && isValid!
                  ? () => _processAndNavigateNextPage()
                  : null,
            );
          },
        ),
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        key: AppWidgetKeys.basicDetailsListViewKey,
        padding: const EdgeInsets.only(bottom: 70),
        children: <Widget>[
          Form(
            key: _basicDetailsFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      patientDetailsText,
                      style: PatientStyles.registerPatientSectionTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        provideBasicInfo,
                        style: PatientStyles.registerPatientSectionSubTitle,
                      ),
                    ),
                  ),
                  if (isCameraPermanentlyDenied)
                    const PermissionsBanner(
                      message: enableCameraPerm,
                    ),

                  // patient's photo
                  StreamBuilder<PatientRegistrationImageData>(
                    stream: _formManager.profileImage,
                    builder: (BuildContext context,
                        AsyncSnapshot<PatientRegistrationImageData> snapshot) {
                      File? profileImage;
                      if (snapshot.data != null) {
                        profileImage =
                            widget.fileSystem.file(snapshot.data?.filePath);
                      }

                      return PatientPhoto(
                        profileImage: profileImage,
                        takePhotoCallback: () =>
                            // take patient's photo
                            takePhoto(documentType: ImageDocumentType.Profile),
                      );
                    },
                  ),

                  largeVerticalSizedBox,

                  // first name
                  NameField(
                    stream: _formManager.firstName,
                    sink: _formManager.inFirstName,
                    formFieldKey: AppWidgetKeys.firstNameKey,
                    focusNode: _firstNameFocusNode,
                    onSubmitted: (String v) {
                      _formManager.inFirstName.add(v);
                      _lastNameFocusNode.requestFocus();
                    },
                    fieldHintText: firstNameHint,
                    formHintText: enterFirstName,
                  ),

                  largeVerticalSizedBox,

                  // last name
                  NameField(
                    stream: _formManager.lastName,
                    sink: _formManager.inLastName,
                    focusNode: _lastNameFocusNode,
                    onSubmitted: (String v) => _formManager.inLastName.add(v),
                    fieldHintText: lastNameHint,
                    formHintText: enterLastName,
                    formFieldKey: AppWidgetKeys.lastNameKey,
                  ),

                  largeVerticalSizedBox,

                  // phone number
                  PhoneNumberFieldWidget(
                    formManager: _formManager.phoneManager,
                    otpReceiver: patientStr,
                  ),

                  mediumVerticalSizedBox,

                  // date of birth
                  const Align(
                    alignment: Alignment.topLeft,
                    child: RequiredTextFormHintText(
                      hintText: hintDob,
                    ),
                  ),
                  smallVerticalSizedBox,
                  SILDatePickerField(
                    gestureDateKey:
                        AppWidgetKeys.basicDetailsDobGestureDetectorKey,
                    hintText: enterDob,
                    allowEligibleDate: true,
                    controller: datePickerController,
                    keyboardType: TextInputType.datetime,
                    onChanged: (String? value) {
                      if (value != null) {
                        final DateTime date =
                            DateFormat('d MMM yyyy').parse(value);
                        _formManager.inDateOfBirth.add(date);
                      }
                    },
                  ),
                  largeVerticalSizedBox,

                  // gender
                  const Align(
                    alignment: Alignment.topLeft,
                    child: RequiredTextFormHintText(hintText: hintGender),
                  ),
                  smallVerticalSizedBox,

                  GenderPicker(
                    dropDownInputKey: AppWidgetKeys.basicDetailsGenderKey,
                    stream: _formManager.gender,
                    hintText: hintSelectGender,
                    onChanged: (String? value) {
                      if (value != null) {
                        _formManager.inGender.add(getGenderFromString(value));
                      }
                    },
                  ),

                  largeVerticalSizedBox,

                  // ID documents
                  IDDocumentsWidget(
                    fileSystem: widget.fileSystem,
                    formManager: _formManager,
                    takePhotoCallback: takePhoto,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<permission_handler.PermissionStatus?>
      requestCameraPermissions() async {
    if (this.mounted) {
      /// Get status of the camera permissions
      final permission_handler.PermissionStatus cameraStatus =
          await permission_handler.Permission.camera.status;

      if (cameraStatus == permission_handler.PermissionStatus.granted) {
        return cameraStatus;
      }

      if (cameraStatus == permission_handler.PermissionStatus.denied) {
        final permission_handler.PermissionStatus status =
            await permission_handler.Permission.camera.request();
        return status;
      }
    }
  }

  /// Captures a photo from the device camera
  Future<void> takePhoto({required ImageDocumentType documentType}) async {
    final permission_handler.PermissionStatus? permissionStatus =
        await requestCameraPermissions();

    if (permissionStatus != null &&
        permissionStatus != permission_handler.PermissionStatus.granted) {
      _updateCameraPermissionsState(permissionStatus);
    }

    if (isCameraDenied || isCameraRestricted) {
      /// notify the user that they need to grant permissions in order to take photos
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(allowPermPhotos),
          duration: const Duration(seconds: kShortSnackBarDuration),
          action: dismissSnackBar(okMsg, white, context),
        ),
      );
    } else {
      final PatientRegistrationImageData? imageData =
          await _getPatientRegistrationImageData(documentType.name);

      if (imageData != null) {
        _formManager.updateImageData(
            documentType: documentType, imageData: imageData);
      }
    }
  }

  /// saves the basic details of the user and navigates to the next step
  Future<void> _processAndNavigateNextPage() async {
    //Process this form before navigating to next step

    final SimplePatientRegistrationInput registerPatientPayload =
        _formManager.submit();

    Map<String, dynamic> result = <String, dynamic>{};

    await showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return BewellSubmitDialog(
          data: <String, dynamic>{'input': registerPatientPayload.toMap()},
          query: registerPatientQuery,
          customNavigation: (Map<String, dynamic> data) {
            result = data;
            Future<void>.delayed(const Duration(milliseconds: 500), () {
              Navigator.of(context).pop();
            });
          },
        );
      },
    );

    if (result['error'] != null) {
      if (result['error'] == phoneNumberExistsText) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(phoneNumberExistsText.capitalize()),
          duration: const Duration(seconds: kLongSnackBarDuration),
          action: dismissSnackBar(okMsg, white, context),
        ));
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(UserFeedBackTexts.getErrorMessage(savingBasicDetails)),
        duration: const Duration(seconds: kLongSnackBarDuration),
        action: dismissSnackBar(okMsg, white, context),
      ));
      return;
    }

    if (result['registerPatient'] != null) {
      final PatientPayload patientPayload = PatientPayload.fromJson(
          result['registerPatient'] as Map<String, dynamic>);

      PatientRegistrationContainer.of(context)
          ?.currentPatient
          .updatePatient(patientPayload);

      StoreProvider.dispatch<AppState>(
        context,
        SavePatientRecordAction(
          patientEdge: PatientEdge(node: patientPayload.patientRecord),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(basicDetailsSaved),
        duration: const Duration(seconds: kShortSnackBarDuration),
        action: dismissSnackBar(okMsg, white, context),
      ));

      const int navIndex = PatientRegistrationContainer.nextOfKinIndex;
      PatientRegistrationContainer.of(context)?.navigate(navIndex);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(UserFeedBackTexts.getErrorMessage(savingBasicDetails)),
        duration: const Duration(seconds: kLongSnackBarDuration),
        action: dismissSnackBar(okMsg, white, context),
      ));
    }
  }

  void _updateCameraPermissionsState(
      permission_handler.PermissionStatus permissionStatus) {
    final bool cameraRestricted = permissionStatus.isRestricted;
    final bool cameraDenied = permissionStatus.isDenied;
    final bool cameraPermanentlyDenied = permissionStatus.isPermanentlyDenied;

    setState(() {
      this.isCameraRestricted = cameraRestricted;
      this.isCameraDenied = cameraDenied;
      this.isCameraPermanentlyDenied = cameraPermanentlyDenied;
    });
  }

  Future<PatientRegistrationImageData?> _getPatientRegistrationImageData(
      String title) async {
    /// prepare a map to store the photo data once it has been captured

    /// 1. Multiply the width and height of the image, in pixels, to get the total pixel count.
    /// 2. Multiply the total pixel count by 3 to get the image size in bytes.
    /// 3. Divide the number of bytes by 1024 to get the image size in kilobytes.
    /// 4. Divide the number of kilobytes by 1024 to get the image size in megabytes.
    ///
    /// from the above definitions, the size of the images that should satisfy a <1MB threshold
    /// would be [500x500] which gives us [0.72MB] which is way below the threshold but ok

    // before we take an image, the user needs to select a source
    // final ImageSource imageSource =
    //     await cameraImageSelectionDialog(context: context) as ImageSource;

    final ImageSource? imageSource = await showDialog<ImageSource?>(
      context: context,
      builder: (BuildContext context) => CameraSelectionDialog(),
    );

    if (imageSource == null) {
      return null;
    }

    // captures the image from the [imageSource] selected above
    // ignore: deprecated_member_use
    final PickedFile? pickedFile = await imagePicker.getImage(
        source: imageSource, maxHeight: 500, maxWidth: 500, imageQuality: 80);

    if (pickedFile != null) {
      // converts the [pickedFile] above into a file for easier processing
      final File image = widget.fileSystem.file(pickedFile.path);
      final String bytes64 = base64Encode(image.readAsBytesSync());
      final String imgType =
          image.path.split('/').last.split('.').last.toUpperCase();
      final String filename = image.path.split('/').last;

      return PatientRegistrationImageData(
        contentType: ImageContentType.values.firstWhere(
            (ImageContentType element) => imgType == element.toStringShort()),
        fileName: filename,
        base64Data: bytes64,
        filePath: pickedFile.path,
        title: title,
      );
    }

    return null;
  }
}
