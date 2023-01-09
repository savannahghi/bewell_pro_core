// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/domain_objects/value_objects/unknown.dart';
import 'package:sghi_core/flutter_graphql_client/flutter_graphql_utils.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

class SummaryAction extends ReduxAction<CoreState> {
  SummaryAction({
    this.doctorsEmail,
    this.phoneNumber,
    required this.context,
  });

  final String? doctorsEmail;
  final String? phoneNumber;
  final BuildContext context;

  @override
  void before() {
    // show a loading indicator
    dispatch(WaitAction<CoreState>.add(summaryExamFlag));
  }

  @override
  Future<CoreState?> reduce() async {
    final String phoneNumber = StoreProvider.state<CoreState>(context)!
        .userState!
        .userProfile!
        .primaryPhoneNumber!
        .getValue();

    await GraphQlUtils().sendOtp(
      client: AppWrapperBase.of(context)!.graphQLClient,
      phoneNumber: phoneNumber,
      email: doctorsEmail == UNKNOWNEMAIL ? null : doctorsEmail,
      logTitle: 'Exam summary : send OTP',
    );

    return null;
  }

  @override
  void after() {
    // remove the loading indicator
    dispatch(WaitAction<CoreState>.remove(summaryExamFlag));
  }
}
