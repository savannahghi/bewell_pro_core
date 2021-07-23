import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/theme/colors.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/no_results_found.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_card/patient_search_card_connector.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_guide.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

/// Search for a patient using their phone number
class PatientSearchWidget extends StatefulWidget {
  const PatientSearchWidget({
    required this.phoneNumberFormValidator,
    required this.searchPatientFunction,
    required this.patientEdgeList,
    required this.searchResult,
    required this.validateAndSearch,
  });

  final String? Function(String? value) phoneNumberFormValidator;
  final List<PatientEdge?>? patientEdgeList;

  // function for searching a patient by phone number
  final Function(BuildContext context, String searchParam)
      searchPatientFunction;

  final SearchResultWidgetEnum searchResult;

  final Function(BuildContext context, String searchParam,
      GlobalKey<FormState> patientSearchFormKey) validateAndSearch;

  @override
  State<StatefulWidget> createState() => _PatientSearchWidget();
}

class _PatientSearchWidget extends State<PatientSearchWidget> {
  /// Used to run validation checks on search param (phoneNumber)
  final GlobalKey<FormState> _patientSearchFormKey = GlobalKey<FormState>();

  /// Used to focus and unfocus the search input
  /// Once the user taps on the `Done` button in the search input, or on keyboard
  final FocusNode _patientSearchInputFocus = FocusNode();

  /// Used to monitor the status of the search parameter (phoneNumber)
  final TextEditingController _patientSearchController =
      TextEditingController();

  final ScrollController _searchResultsScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreenDevice = ResponsiveWidget.isSmallScreen(context);

    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 10.0, top: 10.0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    size15VerticalSizedBox,
                    Text(
                      patientIdentificationTitle,
                      key: AppWidgetKeys.patientIdentificationTitleKey,
                      style: TextThemes.veryBoldSize16Text(),
                    ),
                    smallVerticalSizedBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Form(
                          key: _patientSearchFormKey,
                          child: Expanded(
                            child: SILFormTextField(
                              key: AppWidgetKeys.patientSearchInputKey,
                              hintText: searchWithPhoneHint,
                              prefixIcon: const Icon(Icons.search, size: 30),
                              keyboardType: TextInputType.text,
                              isSearchFieldSmall: isSmallScreenDevice,
                              focusNode: _patientSearchInputFocus,
                              textInputAction: TextInputAction.search,
                              customFillColor:
                                  patientSearchInputFillColor.withOpacity(0.1),
                              autoFocus: false,
                              validator: widget.phoneNumberFormValidator,
                              suffixIcon: GestureDetector(
                                key: AppWidgetKeys.patientSearchDoneKey,
                                onTap: () async {
                                  widget.searchPatientFunction(
                                      context, _patientSearchController.text);
                                },
                                child: Text(
                                  doneBtnText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          color: healthcloudAccentColor,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                              onFieldSubmit: (String searchTerm) =>
                                  widget.validateAndSearch(context, searchTerm,
                                      _patientSearchFormKey),
                              controller: _patientSearchController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: searchResult()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchResult() {
    switch (widget.searchResult) {
      case SearchResultWidgetEnum.loadingIndicator:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(searchingPrompt, style: TextThemes.veryBoldSize16Text()),
              smallVerticalSizedBox,
              const SILPlatformLoader(),
            ],
          ),
        );

      case SearchResultWidgetEnum.searchNotFound:
        return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: NoPatientFound(searchString: _patientSearchController.text));

      case SearchResultWidgetEnum.searchGuide:
        return SearchGuide();

      case SearchResultWidgetEnum.patientSearchCard:
        return Scrollbar(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.patientEdgeList?.length,
            controller: _searchResultsScrollController,
            itemBuilder: (BuildContext context, int index) {
              return ListBody(
                key: AppWidgetKeys.patientIdentificationSearchResult,
                children: <Widget>[
                  PatientSearchCardConnector(
                    patientEdge: widget.patientEdgeList?[index],
                  ),
                ],
              );
            },
          ),
        );
    }
  }

  @override
  void dispose() {
    _patientSearchController.dispose();
    super.dispose();
  }
}

enum SearchResultWidgetEnum {
  loadingIndicator,
  searchGuide,
  searchNotFound,
  patientSearchCard
}
