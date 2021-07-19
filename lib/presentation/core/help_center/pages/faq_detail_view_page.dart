import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/html_wrapper.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/text_themes.dart';

class FAQDetailViewPage extends StatelessWidget {
  const FAQDetailViewPage(
      {Key? key, required this.question, required this.answer})
      : super(key: key);

  final String answer;
  final String question;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: healthcloudPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(faqTitle, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: SILResponsiveWidget.isLargeScreen(context)
            ? const EdgeInsets.symmetric(horizontal: 20)
            : null,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              question,
              style: TextThemes.boldSize16Text(Colors.black54),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: HtmlWrapper(text: answer),
            ),
          ),
        ],
      ),
    );
  }
}
