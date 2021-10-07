// Flutter imports:
import 'package:flutter/material.dart';

const String silPhoneNumber = 'tel:+254790360360';
const String supportEmail = 'mailto:support@slade360.co.ke';
const String call = 'tel://+254790360360';

/// RegEx
final RegExp idRegex = RegExp('[0-9 -]');
final RegExp passportRegex = RegExp('[a-zA-Z0-9]');
const int waitPeriod = 120;

const String defaultDate = '1970-01-01';

final GlobalKey<NavigatorState> globalAppNavigatorKey =
    GlobalKey<NavigatorState>();

const String afyaMojaTermsUrl = 'https://legal.healthcloud.co.ke/terms';
