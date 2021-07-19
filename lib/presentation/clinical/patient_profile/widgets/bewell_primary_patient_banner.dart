import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/clinical/patient_profile/patient_banner_view_model.dart';
import 'package:bewell_pro_core/domain/clinical/entities/attachment.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_allergy_summary_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_banner_bio_info.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_timeline_divider_widget.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';

class BeWellPrimaryPatientBanner extends StatelessWidget {
  final PrimaryBannerInfoObject primaryBannerInfoObject =
      PrimaryBannerInfoObject();

  String? _getImageData(List<Attachment>? patientPhotos) {
    return patientPhotos != null && patientPhotos.isNotEmpty
        ? patientPhotos.first.data
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreenDevice = SILResponsiveWidget.isLargeScreen(context);
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);

    return StoreConnector<AppState, BeWellPrimaryPatientBannerViewModel>(
      converter: (Store<AppState> store) =>
          BeWellPrimaryPatientBannerViewModel.fromStore(store),
      builder: (BuildContext context, BeWellPrimaryPatientBannerViewModel vm) {
        final List<Attachment>? patientPhotos = vm.photo;
        final String? imageData = _getImageData(patientPhotos);

        return Column(
          children: <Widget>[
            Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(isSmallScreen ? 5 : 18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// Show profile image if present and on large screen
                    if (isLargeScreenDevice)
                      CircleAvatar(
                        radius: 54,
                        backgroundColor: patientIDLightCyan,
                        backgroundImage: imageData != null
                            ? MemoryImage(base64Decode(imageData))
                            : null,
                      ),
                    if (isSmallScreen)
                      verySmallHorizontalSizedBox
                    else
                      smallHorizontalSizedBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          PatientBannerBioInfo(
                            patientName: vm.patientName,
                            patientAge: vm.patientAge,
                            patientDOB: vm.patientDob,
                            patientGender: vm.patientGender,
                            patientPhoneNumber: vm.patientPhoneNumber,
                          ),
                          smallVerticalSizedBox,
                          PatientTimelineDividerWidget(),
                          smallVerticalSizedBox,
                          PatientAllergySummaryWidget(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
