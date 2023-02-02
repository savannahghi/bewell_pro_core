// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/domain_objects/entities/bio_data.dart';
import 'package:sghi_core/domain_objects/entities/communication_settings.dart';
import 'package:sghi_core/domain_objects/entities/user_profile.dart';
import 'package:sghi_core/domain_objects/value_objects/unknown.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:sghi_core/misc_utilities/enums.dart';
import 'package:sghi_core/misc_utilities/number_constants.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/shared_themes/spaces.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';
import 'package:sghi_core/ui_components/src/communication_setting_widget.dart';
import 'package:sghi_core/ui_components/src/profile_banner.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/communication_settings_viewmodel.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

class CommunicationSettingsPage extends StatefulWidget {
  @override
  _CommunicationSettingsPageState createState() =>
      _CommunicationSettingsPageState();
}

class _CommunicationSettingsPageState extends State<CommunicationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final UserProfile? userProfile =
        StoreProvider.state<CoreState>(context)!.userState!.userProfile;
    final BioData bioData = userProfile!.userBioData!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'profile_banner',
                child: Material(
                  child: SILProfileBanner(
                    height: 140,
                    backgroundImagePath: doctorIcon,
                    userPhotoUrl: (userProfile.photoUploadID != null)
                        ? userProfile.photoUploadID!
                        : UNKNOWN,
                    userName:
                        '${toBeginningOfSentenceCase(bioData.firstName!.getValue())} ${toBeginningOfSentenceCase(bioData.lastName!.getValue())}',
                    primaryPhone: userProfile.primaryPhoneNumber != null
                        ? userProfile.primaryPhoneNumber!.getValue()
                        : UNKNOWN,
                    profileRoute: userProfileRoute,
                  ),
                ),
              ),
              veryLargeVerticalSizedBox,
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveWidget.preferredPaddingOnStretchedScreens(
                            context: context)),
                child: BuildCommunicationItems(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildCommunicationItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<CoreState, CommunicationSettingsViewModel>(
      converter: (Store<CoreState> store) =>
          CommunicationSettingsViewModel.fromStore(store),
      builder: (BuildContext context, CommunicationSettingsViewModel vm) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveWidget.deviceType(context) ==
                      DeviceScreensType.Mobile
                  ? number15
                  : number30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              largeVerticalSizedBox,
              Text(
                pageHeader,
                style: TextThemes.heavySize18Text(Colors.black),
              ),
              mediumVerticalSizedBox,
              CommunicationSettingItem(
                title: emailTitle,
                subtitle: emailSubtitle,
                isActive: vm.allowEmail!,
                onTapHandler: changeCommunicationSettings,
                type: CommunicationType.allowEmail,
              ),
              largeVerticalSizedBox,
              CommunicationSettingItem(
                title: messagesTitle,
                subtitle: messagesSubTitle,
                isActive: vm.allowText!,
                onTapHandler: changeCommunicationSettings,
                type: CommunicationType.allowTextSMS,
              ),
              largeVerticalSizedBox,
              CommunicationSettingItem(
                title: whatsAppTitle,
                subtitle: whatsAppSubTitle,
                isActive: vm.allowWhatsApp!,
                onTapHandler: changeCommunicationSettings,
                type: CommunicationType.allowWhatsApp,
              ),
              largeVerticalSizedBox,
              CommunicationSettingItem(
                title: pushTitle,
                subtitle: pushSubTitle,
                isActive: vm.allowPush!,
                onTapHandler: changeCommunicationSettings,
                type: CommunicationType.allowPush,
              ),
              mediumVerticalSizedBox,
            ],
          ),
        );
      },
    );
  }

  Future<bool> changeCommunicationSettings(
      {required CommunicationType channel,
      required bool isAllowed,
      required BuildContext context}) async {
    final CommunicationSettings settings =
        StoreProvider.state<CoreState>(context)!
            .userState!
            .communicationSettings!;
    final Map<String, bool> _variables = <String, bool>{
      'allowEmail': settings.allowEmail!,
      'allowWhatsApp': settings.allowWhatsApp!,
      'allowTextSMS': settings.allowText!,
      'allowPush': settings.allowPush!,
    };
    _variables[channel.toShortString()] = isAllowed;

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    /// fetch the data from the api
    final http.Response _result = await _client.query(
      setCommSettingsMutation,
      _variables,
    );

    final Map<String, dynamic> response = _client.toMap(_result);

    /// check if the response has timeout metadata. If yes, return an error to
    /// handled correctly
    if (_result.statusCode == 408) {
      return false;
    }

    //  check for errors in the data here
    if (_client.parseError(response) != null) {
      return false;
    }
    StoreProvider.dispatch<CoreState>(
        context,
        BatchUpdateUserStateAction(
            communicationSettings: CommunicationSettings(
          allowEmail: _variables['allowEmail'],
          allowPush: _variables['allowPush'],
          allowText: _variables['allowTextSMS'],
          allowWhatsApp: _variables['allowWhatsApp'],
        )));
    return true;
  }
}
