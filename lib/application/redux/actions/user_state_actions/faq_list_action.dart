import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/faq_content.dart';

class FaqListAction extends ReduxAction<CoreState> {
  FaqListAction({required this.faqList});

  final List<FAQContent?>? faqList;

  @override
  CoreState reduce() {
    final CoreState newState =
        state.copyWith.miscState!.call(faqList: this.faqList);

    return newState;
  }
}
