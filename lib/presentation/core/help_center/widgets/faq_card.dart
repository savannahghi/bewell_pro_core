import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/help_center/pages/faq_detail_view_page.dart';
import 'package:shared_themes/spaces.dart';

import 'package:shared_themes/text_themes.dart';

import 'package:unicons/unicons.dart';

class FAQCard extends StatelessWidget {
  const FAQCard({required this.question, required this.answer});

  final String answer;
  final String question;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<FAQDetailViewPage>(
            builder: (_) =>
                FAQDetailViewPage(answer: answer, question: question),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F6),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        key: AppWidgetKeys.helpCenterContainerKey,
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 6,
              child: Text(
                question,
                style: TextThemes.veryHeavySize14Text(
                  Colors.black.withOpacity(0.6),
                ),
              ),
            ),
            verySmallHorizontalSizedBox,
            const Icon(UniconsLine.angle_right)
          ],
        ),
      ),
    );
  }
}
