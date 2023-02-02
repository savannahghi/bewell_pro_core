// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:intl/intl.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/domain_objects/entities/bio_data.dart';
import 'package:sghi_core/domain_objects/entities/user_profile.dart';
import 'package:sghi_core/ui_components/src/profile_banner.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/widgets/edit_profile_form.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final UserProfile userProfile =
        StoreProvider.state<CoreState>(context)!.userState!.userProfile!;

    final BioData bioData = userProfile.userBioData!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'profile_banner',
              child: Material(
                child: SILProfileBanner(
                  backgroundImagePath: doctorIcon,
                  userPhotoUrl: (userProfile.photoUploadID != null)
                      ? userProfile.photoUploadID!
                      : UNKNOWN,
                  userName:
                      '${toBeginningOfSentenceCase(bioData.firstName?.getValue())} ${toBeginningOfSentenceCase(bioData.lastName?.getValue())}',
                  primaryPhone: userProfile.primaryPhoneNumber!.getValue(),
                  profileRoute: editUserProfileRoute,
                ),
              ),
            ),
            veryLargeVerticalSizedBox,
            EditProfileForm(),
          ],
        ),
      ),
    );
  }
}
