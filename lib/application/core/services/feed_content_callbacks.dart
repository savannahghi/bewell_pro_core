import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:user_feed/user_feed.dart';
import 'package:misc_utilities/misc.dart';

Map<String, Function> getFeedActionCallbacks({required BuildContext context}) {
  return <String, Function>{
    kCompleteProfile: () {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: 'Coming soon'));
    },
    kVerifyEmail: () {
      Navigator.of(context, rootNavigator: true)
          .pushNamed(profileContactDetailsRoute);
    },
  };
}
