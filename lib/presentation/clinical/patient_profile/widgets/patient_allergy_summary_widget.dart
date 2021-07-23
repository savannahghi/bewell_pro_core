import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/problem_allergy_summary.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

class PatientAllergySummaryWidget extends StatefulWidget {
  @override
  _PatientAllergySummaryWidgetState createState() =>
      _PatientAllergySummaryWidgetState();
}

class _PatientAllergySummaryWidgetState
    extends State<PatientAllergySummaryWidget> {
  late Stream<dynamic> problemAllergyStream;
  late StreamView<dynamic> refreshController;

  late StreamController<dynamic> _problemAllergyStreamStreamController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// listener to refresh the problems and allergies once they are added
    /// or retired from patient exam or the secondary patient banner
    refreshController = StreamView<dynamic>(
        PrimaryBannerInfoObject().patientBannerChangeListener.stream);

    refreshController.listen((dynamic value) async {
      if (value is bool && value == true) {
        await _fetchProblemAllergySummary(context);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _problemAllergyStreamStreamController =
        StreamController<dynamic>.broadcast();
    problemAllergyStream = _problemAllergyStreamStreamController.stream;

    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await _fetchProblemAllergySummary(context);
    });
  }

  Future<void> _fetchProblemAllergySummary(BuildContext context) async {
    await genericFetchFunction(
      queryString: problemAllergySummaryQuery,
      variables: problemAllergySummaryQueryVariables(),
      context: context,
      logTitle: 'Fetch patient problem and allergy summary',
      streamController: _problemAllergyStreamStreamController,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return StreamBuilder<dynamic>(
      stream: problemAllergyStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text(errorFetchingPatients),
          );
        }

        if (snapshot.hasData) {
          //show the loader before data is displayed
          if (snapshot.data['loading'] != null &&
              snapshot.data['loading'] == true) {
            return const SILPlatformLoader();
          }

          final ProblemAllergySummary problemAllergySummary =
              ProblemAllergySummary.fromJson(
                  snapshot.data as Map<String, dynamic>);

          final GenerateProblemAllergySummaryData conditionSummary =
              generateProblemAllergySummary(
                  problemAllergySummary.problemSummary, conditionsString);

          final GenerateProblemAllergySummaryData allergiesSummary =
              generateProblemAllergySummary(
                  problemAllergySummary.allergySummary, allergiesString);

          final List<Widget> problemAllergyWidgets = <Widget>[
            Wrap(
              runSpacing: 5,
              children: <Widget>[
                Text(
                  knownConditionsText,
                  style: TextThemes.veryBoldSize15Text(textBodyColor).copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
                smallHorizontalSizedBox,
                Text(
                  conditionSummary.problemOrAllergyString,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: grey),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  conditionSummary.remainingItemsString,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Theme.of(context).accentColor),
                ),
              ],
            ),
            if (isSmallScreen)
              verySmallVerticalSizedBox
            else
              smallVerticalSizedBox,
            Wrap(
              runSpacing: 5,
              children: <Widget>[
                Text(knownAllergiesTitle,
                    style: TextThemes.veryBoldSize15Text(textBodyColor)
                        .copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor)),
                smallHorizontalSizedBox,
                Text(
                  allergiesSummary.problemOrAllergyString,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: grey),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  allergiesSummary.remainingItemsString,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Theme.of(context).accentColor),
                ),
              ],
            ),
          ];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: problemAllergyWidgets,
          );
        } else {
          return const SILPlatformLoader();
        }
      },
    );
  }
}
