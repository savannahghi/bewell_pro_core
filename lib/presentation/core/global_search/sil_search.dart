// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/global_search/widgets/search_widget.dart';

/// Entry point for SIL global search.
class SILSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        key: AppWidgetKeys.rowKey,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: GestureDetector(
              key: AppWidgetKeys.searchGestureDetector,

              /// Search delegate
              /// Absorbs gesture and navigates to the search delegate
              onTap: () => showSearch(
                context: context,
                delegate: SearchWidget(),
              ),
              child: AbsorbPointer(
                key: AppWidgetKeys.searchAbsorb,
                child: Align(
                  child: SILFormTextField(
                    key: AppWidgetKeys.appSearchInputKey,
                    borderColor: healthcloudAccentColor,
                    prefixIcon:
                        const Icon(UniconsLine.search, color: Colors.grey),
                    customFillColor: Colors.grey[200],
                    hintText: whatWouldYouLikeToDo,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
