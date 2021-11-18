// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/text_or_html.dart';

/// Renders the widget based on whether it is html or normal text
class HtmlWrapper extends StatelessWidget {
  const HtmlWrapper({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final TextOrHtml validatedText = TextOrHtml.withValue(text);

    return validatedText.value.fold(
      (String normalText) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          text,
          style: TextThemes.normalSize14Text(Colors.black.withOpacity(0.6)),
        ),
      ),
      (String textWithHtml) => Center(
        child: Html(
          data: text,
          onLinkTap: onBodyLinkOrImageTapCallback,
          onImageTap: onBodyLinkOrImageTapCallback,
          shrinkWrap: true,
          customRender: <String, dynamic Function(RenderContext, Widget)>{
            'figure': (RenderContext context, Widget child) {
              return Container(
                key: AppWidgetKeys.htmlWrapperImageKey,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: healthcloudPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Card(
                  elevation: 0,
                  child: Image(
                      image: NetworkImage(context.tree.element!.children.first
                          .attributes.entries.first.value)),
                ),
              );
            },
          },
          style: <String, Style>{
            'li': Style(
              lineHeight: LineHeight.em(1.5),
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          },
        ),
      ),
    );
  }
}
