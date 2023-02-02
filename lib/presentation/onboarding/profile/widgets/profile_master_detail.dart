// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:intl/intl.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/app_wrapper/enums.dart';
import 'package:sghi_core/domain_objects/entities/bio_data.dart';
import 'package:sghi_core/domain_objects/entities/user_profile.dart';
import 'package:sghi_core/domain_objects/value_objects/unknown.dart';
import 'package:sghi_core/misc_utilities/enums.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/shared_themes/spaces.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/theme/colors.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/enums.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_item_builder.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_page_items.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:sghi_core/ui_components/src/profile_banner.dart';
import 'build_profile_footer.dart';

/// used for [master view] in master detail ui
class ProfileMasterDetail extends StatefulWidget {
  const ProfileMasterDetail({
    Key? key,
    required this.selection,
    required this.logoutAction,
  }) : super(key: key);

  final ReduxAction<CoreState> logoutAction;
  final ValueNotifier<ProfileItem> selection;

  @override
  _ProfileMasterDetailState createState() => _ProfileMasterDetailState();
}

class _ProfileMasterDetailState extends State<ProfileMasterDetail> {
  ProfileSubject profileSubject = ProfileSubject();

  @override
  Widget build(BuildContext context) {
    final UserProfile? userProfile =
        StoreProvider.state<CoreState>(context)?.userState?.userProfile;

    final BioData? bioData = userProfile?.userBioData;
    final String firstName =
        toBeginningOfSentenceCase(bioData?.firstName?.getValue()) ?? 'Hey';
    final String lastName =
        toBeginningOfSentenceCase(bioData?.lastName?.getValue()) ?? 'You';
    final String userName = '$firstName $lastName';

    final String? primaryPhoneNumber =
        userProfile?.primaryPhoneNumber?.getValue();

    return Column(
      children: <Widget>[
        /// [ProfileBanner] section
        Hero(
          tag: 'profile_banner',
          child: Material(
            child: SILProfileBanner(
              editable: true,
              backgroundImagePath: doctorIcon,
              userPhotoUrl: (userProfile?.photoUploadID != null)
                  ? userProfile!.photoUploadID!
                  : UNKNOWN,
              userName: userName,
              primaryPhone: primaryPhoneNumber ?? UNKNOWN,
              profileRoute: editUserProfileRoute,
            ),
          ),
        ),
        veryLargeVerticalSizedBox,
        mediumVerticalSizedBox,

        /// [Account] section
        const ProfileSeparator(text: accountSection),

        ProfileItemBuilder(
          onSelect: (ProfileItem val) async {
            if (ResponsiveWidget.deviceType(context) ==
                DeviceScreensType.Mobile) {
              navigateToProfileItemPage(context: context, profileItem: val);
            } else {
              if (val.onTapRoute == pinVerificationRoute) {
                /// dispatch action to set [isChangingPin] to true
                await Navigator.of(context).pushNamed(
                  pinVerificationRoute,
                  arguments: PinVerificationType.pinChange,
                );
              }

              if (val.text != changePINText &&
                  val.text != termsOfServiceSettings) {
                setState(() {
                  widget.selection.value = val;
                });

                profileSubject.selectedTile.add(val.text);
              }

              profileSubject.color.add(Colors.purple[100]!);
            }
          },
          section: ProfileItemType.account,
        ),

        /// [Legal] section

        const ProfileSeparator(text: legalSection),

        ProfileItemBuilder(
          onSelect: (ProfileItem val) async {
            if (ResponsiveWidget.deviceType(context) ==
                DeviceScreensType.Mobile) {
              navigateToProfileItemPage(context: context, profileItem: val);
            } else {
              profileSubject.color.add(Colors.purple[100]!);

              if (val.onTapRoute == termsAndConditionsRoute) {
                final List<AppContext> appContext =
                    AppWrapperBase.of(context)!.appContexts;

                String? termsUrl;
                if (appContext.contains(AppContext.AfyaMoja)) {
                  termsUrl = afyaMojaTermsUrl;
                }

                await triggerNavigationEvent(
                    context: context, route: val.onTapRoute, args: termsUrl);
              }
            }
          },
          section: ProfileItemType.legal,
        ),
        BuildProfileFooter(
          logoutAction: widget.logoutAction,
        ),
      ],
    );
  }
}

class ProfileSeparator extends StatelessWidget {
  const ProfileSeparator({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 15, 22, 5),
      decoration: const BoxDecoration(color: profileSeparatorBackgroundColor),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text.toUpperCase(),
          style: TextThemes.boldSize12Text().copyWith(
              color: Theme.of(context).colorScheme.secondary, fontSize: 8),
        ),
      ),
    );
  }
}
