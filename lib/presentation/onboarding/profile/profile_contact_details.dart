// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:intl/intl.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/profile_banner.dart';
import 'package:user_profile/contact_utils.dart';
import 'package:user_profile/contacts.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/contact_view_model.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

final GlobalKey<ScaffoldState> _contactDetailsKey = GlobalKey<ScaffoldState>();

/// Renders [ContactDetails] profile item
/// Allows user to add/edit primary email, secondary phone number, and secondary email
/// Renders [Profile banner] and [BuildContactProvider]
class ProfileContactDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProfile? userProfile =
        StoreProvider.state<CoreState>(context)!.userState!.userProfile;

    final BioData bioData = userProfile!.userBioData!;
    return Scaffold(
      key: _contactDetailsKey,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'profile_banner',
              child: Material(
                child: SILProfileBanner(
                  editable: true,
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
            largeVerticalSizedBox,
            BuildContactProvider(),
          ],
        ),
      ),
    );
  }
}

class BuildContactProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserFeedStore().refreshFeed.add(true);
    return StoreConnector<CoreState, ContactViewModel>(
      converter: (Store<CoreState> store) => ContactViewModel.fromStore(store),
      builder: (BuildContext context, ContactViewModel vm) {
        bool checkWaitingFor({required String flag}) {
          return StoreProvider.state<CoreState>(
                  _contactDetailsKey.currentContext!)!
              .wait!
              .isWaitingFor(flag);
        }

        return ContactProvider(
          primaryEmail: vm.primaryEmail,
          primaryPhone: vm.primaryPhone,
          secondaryEmails: vm.secondaryEmails,
          secondaryPhones: vm.secondaryPhones,
          wait: StoreProvider.state<CoreState>(context)!.wait!,
          checkWaitingFor: checkWaitingFor,
          contactUtils: ContactUtils(
            toggleLoadingIndicator: toggleWaitStateFlagIndicator,
            client: AppWrapperBase.of(context)!.graphQLClient,
            updateStateFunc: updateStateContacts,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveWidget.deviceType(context) !=
                      DeviceScreensType.Mobile
                  ? number30
                  : number0,
            ),
            child: const ContactDetails(),
          ),
        );
      },
    );
  }
}
