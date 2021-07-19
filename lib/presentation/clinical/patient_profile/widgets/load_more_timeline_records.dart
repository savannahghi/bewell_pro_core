import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:misc_utilities/misc.dart';

import 'package:shared_themes/spaces.dart';

import 'package:shared_themes/colors.dart';

import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';

class LoadMoreTimelineRecords extends StatefulWidget {
  final Function() callback;
  final int count;

  const LoadMoreTimelineRecords({required this.callback, required this.count});

  @override
  _LoadMoreTimelineRecordsState createState() =>
      _LoadMoreTimelineRecordsState();
}

class _LoadMoreTimelineRecordsState extends State<LoadMoreTimelineRecords> {
  Future<void> timelineNavigationFunction() async {
    setState(() {
      loading = true;
    });
    final bool status = await widget.callback() as bool;
    setState(() {
      loading = false;
    });
    Color color = black;

    if (!status) {
      color = red;
      timelineMessage = UserFeedBackTexts.getErrorMessage();
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      content: Text(
        timelineMessage,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: white),
      ),
      duration: const Duration(seconds: kShortSnackBarDuration),
      action: dismissSnackBar(closeBtnText, white, context),
    ));
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: <Widget>[
          Text('Showing ${widget.count} visits'),
          mediumHorizontalSizedBox,
          if (!loading)
            SILPrimaryButton(
              buttonKey: AppWidgetKeys.timelineNavigatorButtonKey,
              onPressed: () => timelineNavigationFunction(),
              buttonColor: healthcloudAccentColor,
              text: loadMoreText,
            ),
          if (loading) const SILPlatformLoader()
        ],
      ),
    );
  }
}
