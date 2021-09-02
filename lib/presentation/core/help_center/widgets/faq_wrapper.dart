import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/faq_list_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/core_state_view_model.dart';
import 'package:bewell_pro_core/domain/clinical/entities/faq_content.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/faq_card.dart';
import 'package:bewell_pro_core/presentation/core/widgets/generic_empty_data_widget.dart';
import 'package:bewell_pro_core/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_ui_components/platform_loader.dart';

/// Used to wrap the [FAQCard] by first fetching the data and then rendering
/// the FAQ cards
class FAQWrapper extends StatefulWidget {
  @override
  _FAQWrapperState createState() => _FAQWrapperState();
}

class _FAQWrapperState extends State<FAQWrapper> {
  late Stream<Object> _stream;
  late StreamController<Object> _streamController;

  @override
  void initState() {
    _streamController = StreamController<Object>.broadcast();
    _stream = _streamController.stream;
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await fetchData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  Future<void> fetchData() async {
    await genericFetchFunction(
      streamController: _streamController,
      context: context,
      logTitle: helpCenterLogTitle,
      queryString: getFAQQuery,
      variables: getFAQQueryVariables(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double faqWrapperWidth = ResponsiveWidget.isLargeScreen(context)
        ? MediaQuery.of(context).size.width * 0.5
        : double.infinity;

    return SizedBox(
      width: faqWrapperWidth,
      child: StreamBuilder<Object>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          /// Shows the loader before the data is displayed
          if (snapshot.data is Map<String, dynamic> &&
              snapshot.data != null &&
              snapshot.data['loading'] != null &&
              snapshot.data['loading'] == true) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SILPlatformLoader(
                color: Theme.of(context).primaryColor,
              ),
            );
          }

          /// Error checking
          if (snapshot.hasError) {
            final dynamic valueHolder = snapshot.error;
            final Map<String, dynamic>? error = valueHolder == null
                ? null
                : valueHolder as Map<String, dynamic>;

            /// check if the error is a timeout error and return an appropriate widget
            if (error == null || error['error'] == 'timeout') {
              return GenericTimeoutWidget(
                recoverRoute: homePageRoute,
                action: 'getting FAQs',
                recoverCallback: () async {
                  await fetchData();
                },
              );
            }

            return const GenericEmptyData(item: faqTextTitle);
          }

          if (snapshot.hasData) {
            if (snapshot.data != null) {
              final List<FAQContent?>? fetchedFaqs = FAQContentRelay.fromJson(
                      snapshot.data as Map<String, dynamic>)
                  .faqs;

              StoreProvider.dispatch<CoreState>(
                  context, FaqListAction(faqList: fetchedFaqs));

              /// Returns an empty state widget here
              if (fetchedFaqs!.isEmpty == true) {
                return const GenericEmptyData(item: faqTextTitle);
              }

              return StoreConnector<CoreState, CoreStateViewModel>(
                converter: (Store<CoreState> store) =>
                    CoreStateViewModel.fromStore(store),
                distinct: true,
                builder: (BuildContext context, CoreStateViewModel vm) {
                  final List<FAQContent?>? faqsFromState =
                      vm.state.miscState!.faqList;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: fetchedFaqs.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final String? faqQuestion = fetchedFaqs[index]!.title;
                      final String? faqAnswer = fetchedFaqs[index]!.html;

                      final String faqQuestionFromState =
                          faqsFromState![index]!.title!;
                      final String faqAnswerFromState =
                          faqsFromState[index]!.html!;

                      return FAQCard(
                        question: faqQuestion ?? faqQuestionFromState,
                        answer: faqAnswer ?? faqAnswerFromState,
                      );
                    },
                  );
                },
              );
            }
          }

          return const GenericEmptyData(item: faqTextTitle);
        },
      ),
    );
  }
}
