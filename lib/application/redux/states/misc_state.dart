// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/event_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/faq_content.dart';

part 'misc_state.freezed.dart';
part 'misc_state.g.dart';

@freezed
class MiscState with _$MiscState {
  factory MiscState({
    String? visitCount,
    String? title,
    String? message,
    String? phoneNumber,
    String? otpCode,
    String? pinCode,
    bool? acceptedTerms,
    List<FAQContent?>? faqList,
    EventState? eventState,

    /// [defaultLocation] the location(branch) that the user has chosen
    String? defaultLocation,

    /// [createPin] used when user is creating a PIN.
    String? createPin,

    /// [confirmPin] used when user is creating a PIN for client side validation
    String? confirmPin,

    /// [invalidCredentials] indicates the provided credentials are invalid.
    bool? invalidCredentials,

    /// [unKnownPhoneNo] indicates that the provided phone number is not known by the backend.
    bool? unKnownPhoneNo,

    /// [accountExists] a signal to the frontend that an account with the provided credentials already exists.
    bool? accountExists,

    /// [invalidPin] used when running pin verification procedure.
    bool? invalidPin,

    /// notify user when the start visit action process fails
    @JsonKey(ignore: true)
        Event<bool?>? startVisitFailed, // TODO: rename to startVisitFailedEvent

    String? patientSearchTerm,
    bool? hasCompletedEnteringOTP, // TODO: remove it is unused
    bool? isResendingOTP, // TODO: remove, it is unused
  }) = _MiscState;

  factory MiscState.fromJson(Map<String, dynamic> json) =>
      _$MiscStateFromJson(json);

  factory MiscState.initial() => MiscState(
        visitCount: UNKNOWN,
        title: UNKNOWN,
        message: UNKNOWN,
        otpCode: UNKNOWN,
        pinCode: UNKNOWN,
        faqList: <FAQContent>[],
        accountExists: false,
        acceptedTerms: false,
        createPin: UNKNOWN,
        confirmPin: UNKNOWN,
        defaultLocation: UNKNOWN,
        phoneNumber: UNKNOWN,
        invalidCredentials: false,
        unKnownPhoneNo: false,
        invalidPin: false,
        hasCompletedEnteringOTP: false,
        isResendingOTP: false,
        eventState: EventState.initial(),
        startVisitFailed: Event<bool>.spent(),
      );
}
