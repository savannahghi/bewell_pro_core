// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/misc_utilities/misc.dart';
import 'package:sghi_core/user_feed/src/domain/value_objects/constants.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

Map<String, Function> getFeedActionCallbacks({required BuildContext context}) {
  return <String, Function>{
    kCompleteProfile: () {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: comingSoonText));
    },
    kVerifyEmail: () {
      Navigator.of(context, rootNavigator: true)
          .pushNamed(profileContactDetailsRoute);
    },
  };
}
