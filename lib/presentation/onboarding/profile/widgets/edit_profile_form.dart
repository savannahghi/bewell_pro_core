import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/core_state_view_model.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/widgets/text_field_label.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late String displayName;
  late String firstName;
  late TextEditingController firstNameController = TextEditingController();
  late String lastName;
  late TextEditingController lastNameController = TextEditingController();
  bool loading = false;
  Map<String, dynamic> variables = <String, dynamic>{};

  final FocusNode _firstNameFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _lastNameFocusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) {
      final CoreState state = StoreProvider.state<CoreState>(context)!;
      displayName =
          state.userState!.userProfile!.userBioData!.firstName!.getValue();

      firstName =
          state.userState!.userProfile!.userBioData!.firstName!.getValue();
      lastName =
          state.userState!.userProfile!.userBioData!.lastName!.getValue();

      firstNameController.text = firstName;
      lastNameController.text = lastName;

      variables['firstName'] = firstName;
      variables['lastName'] = lastName;
    });

    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  Future<void> saveDetails({
    required Map<String, dynamic> variables,
    required String displayName,
  }) async {
    toggleWaitStateFlagIndicator(context: context, flag: editProfileFlag);

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;
    final http.Response result = await _client.query(
        updateUserProfileMutation, <String, dynamic>{'input': variables});
    final Map<String, dynamic> body = _client.toMap(result);
    toggleWaitStateFlagIndicator(
        context: context, flag: editProfileFlag, show: false);

    //check first for errors
    if (_client.parseError(body) != null) {
      showErrorSnackbar(context);
      return;
    }

    if (body['data'] != null) {
      StoreProvider.dispatch<CoreState>(
        context,
        BatchUpdateUserStateAction(
          userProfile: UserProfile(
            userBioData: BioData(
              firstName: Name.withValue(variables['firstName'].toString()),
              lastName: Name.withValue(variables['lastName'].toString()),
            ),
          ),
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: const Text(updateSuccessful),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar('close', white, context),
          ),
        );
      await Future<void>.delayed(
          const Duration(seconds: kShortSnackBarDuration));

      await triggerNavigationEvent(
          context: context, route: userProfileRoute, shouldReplace: true);
      return;
    }
    showErrorSnackbar(context);
  }

  Future<void> saveUserNames() async {
    if (_formKey.currentState!.validate()) {
      displayName = '${variables['firstName']} ${variables['lastName']}';
      await saveDetails(
        variables: variables,
        displayName: displayName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CoreState, CoreStateViewModel>(
      converter: (Store<CoreState> store) =>
          CoreStateViewModel.fromStore(store),
      distinct: true,
      builder: (BuildContext context, CoreStateViewModel vm) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveWidget.preferredPaddingOnStretchedScreens(
                  context: context)),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                largeVerticalSizedBox,
                const Text(
                  updateProfile,
                  style: TextStyle(color: titleBlack, fontSize: 15),
                ),
                largeVerticalSizedBox,
                // first name
                const TextFieldLabel(label: updateFirstName),
                smallVerticalSizedBox,
                SILFormTextField(
                  borderColor: subtitleColor,
                  key: AppWidgetKeys.firstName,
                  controller: firstNameController,
                  focusNode: _firstNameFocusNode,
                  validator: (String? value) {
                    if (value.toString().isEmpty) {
                      return updateFirstNameReq;
                    }
                    return null;
                  },
                  onChanged: (String value) {
                    variables['firstName'] = value;
                  },
                ),
                largeVerticalSizedBox,

                // last name
                const TextFieldLabel(label: updateLastName),
                smallVerticalSizedBox,
                SILFormTextField(
                  textFieldBackgroundColor: Colors.cyan,
                  borderColor: subtitleColor,
                  controller: lastNameController,
                  key: AppWidgetKeys.lastName,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return updateLastNameReq;
                    }
                    return null;
                  },
                  onChanged: (String value) {
                    variables['lastName'] = value;
                  },
                  focusNode: _lastNameFocusNode,
                ),
                largeVerticalSizedBox,
                if (vm.state.wait!.isWaitingFor(editProfileFlag)) ...<Widget>[
                  const Center(child: SILPlatformLoader())
                ],
                if (!vm.state.wait!.isWaitingFor(editProfileFlag)) ...<Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: number48,
                    child: SILPrimaryButton(
                      buttonKey: AppWidgetKeys.editProfileDetailsButton,
                      onPressed: () => saveUserNames(),
                      buttonColor: Theme.of(context).accentColor,
                      text: saveAndContinueButtonText,
                    ),
                  )
                ],
                mediumVerticalSizedBox
              ],
            ),
          ),
        );
      },
    );
  }
}
