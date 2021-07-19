import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/faq_content.dart';

class FaqListAction extends ReduxAction<AppState> {
  FaqListAction({required this.faqList});

  final List<FAQContent?>? faqList;

  @override
  AppState reduce() {
    final AppState newState =
        state.copyWith.miscState!.call(faqList: this.faqList);

    return newState;
  }
}
