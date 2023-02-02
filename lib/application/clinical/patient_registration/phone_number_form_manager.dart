// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:quiver/core.dart';
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:bewell_pro_core/application/clinical/patient_registration/validator_mixin.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:sghi_core/flutter_graphql_client/flutter_graphql_utils.dart';

class PhoneNumberFormManager with Validator {
  final BehaviorSubject<String> _phoneNumber = BehaviorSubject<String>();
  Stream<String> get phoneNumber =>
      _phoneNumber.stream.transform(validatePhoneNumbers);
  Sink<String> get inPhoneNumber => _phoneNumber.sink;

  final BehaviorSubject<PhoneNumberVerifiedState> _isPhoneVerified =
      BehaviorSubject<PhoneNumberVerifiedState>();
  Stream<PhoneNumberVerifiedState> get isPhoneVerified =>
      _isPhoneVerified.stream;
  Sink<PhoneNumberVerifiedState> get inIsPhoneVerified => _isPhoneVerified.sink;

  final BehaviorSubject<String> _verificationCode = BehaviorSubject<String>();
  Stream<String> get verificationCode => _verificationCode.stream;
  Sink<String> get inVerificationCode => _verificationCode.sink;

  final BehaviorSubject<bool> _mobileOptIn =
      BehaviorSubject<bool>.seeded(false);
  Sink<bool> get inMobileOptIn => _mobileOptIn.sink;

  String? get phoneNumberValue => _phoneNumber.valueOrNull;

  String? get verificationCodeValue => _verificationCode.value;

  bool? get mobileOptInValue => _mobileOptIn.value;

  Future<String?> verifyPhone(BuildContext context) async {
    final String phoneNumber = _phoneNumber.valueOrNull!;

    final String? otp = await sendOtpRequest(
      graphQlClient: AppWrapperBase.of(context)!.graphQLClient,
      phoneNumber: phoneNumber,
    );

    return otp;
  }

  Future<String> resendOtp(BuildContext context, int step) async {
    final String phoneNumber = _phoneNumber.valueOrNull!;

    final String otp = await GraphQlUtils().generateRetryOtp(
      client: AppWrapperBase.of(context)!.graphQLClient,
      phoneNumber: phoneNumber,
      step: step,
    );

    inVerificationCode.add(otp);

    return otp;
  }
}

class PhoneNumberVerifiedState {
  final bool isSendingOtp;
  final bool isPhoneVerified;

  PhoneNumberVerifiedState({
    required this.isSendingOtp,
    required this.isPhoneVerified,
  });

  @override
  bool operator ==(Object other) =>
      other is PhoneNumberVerifiedState &&
      other.isSendingOtp == isSendingOtp &&
      other.isPhoneVerified == isPhoneVerified;

  @override
  int get hashCode => hash2(isSendingOtp, isPhoneVerified);
}
