// Mocks generated by Mockito 5.0.15 from annotations
// in bewell_pro_core/test/unit_tests/application/core/services/helpers_test.dart.
// Do not manually edit this file.

// Dart imports:
import 'dart:async' as _i8;

// Flutter imports:
import 'package:flutter/material.dart' as _i9;

// Package imports:
import 'package:dart_fcm/src/fcm.dart' as _i3;
import 'package:dart_fcm/src/reminder_notification.dart' as _i7;
import 'package:dart_fcm/src/setup_on_message.dart' as _i6;
import 'package:firebase_messaging/firebase_messaging.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:rxdart/rxdart.dart' as _i2;

import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeBehaviorSubject_0<T> extends _i1.Fake
    implements _i2.BehaviorSubject<T> {}

class _FakeSILFCM_1 extends _i1.Fake implements _i3.SILFCM {}

class _FakeIOSInitializationSettings_2 extends _i1.Fake
    implements _i4.IOSInitializationSettings {}

class _FakeMacOSInitializationSettings_3 extends _i1.Fake
    implements _i4.MacOSInitializationSettings {}

class _FakeNotificationSettings_4 extends _i1.Fake
    implements _i5.NotificationSettings {}

/// A class which mocks [SILFCM].
///
/// See the documentation for Mockito's code generation for more information.
class MockSILFCM extends _i1.Mock implements _i3.SILFCM {
  MockSILFCM() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set navigationCallback(_i6.OnMessageCallback? _navigationCallback) => super
      .noSuchMethod(Invocation.setter(#navigationCallback, _navigationCallback),
          returnValueForMissingStub: null);
  @override
  set androidChannel(_i4.AndroidNotificationChannel? _androidChannel) =>
      super.noSuchMethod(Invocation.setter(#androidChannel, _androidChannel),
          returnValueForMissingStub: null);
  @override
  _i2.BehaviorSubject<_i7.ReminderNotification>
      get didReceiveLocalNotificationSubject => (super.noSuchMethod(
              Invocation.getter(#didReceiveLocalNotificationSubject),
              returnValue: _FakeBehaviorSubject_0<_i7.ReminderNotification>())
          as _i2.BehaviorSubject<_i7.ReminderNotification>);
  @override
  _i2.BehaviorSubject<String> get selectNotificationSubject =>
      (super.noSuchMethod(Invocation.getter(#selectNotificationSubject),
              returnValue: _FakeBehaviorSubject_0<String>())
          as _i2.BehaviorSubject<String>);
  @override
  _i8.Future<_i3.SILFCM> configure(
          {_i9.BuildContext? context, _i6.OnMessageCallback? callback}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #configure, [], {#context: context, #callback: callback}),
              returnValue: Future<_i3.SILFCM>.value(_FakeSILFCM_1()))
          as _i8.Future<_i3.SILFCM>);
  @override
  _i8.Future<void> listenOnDeviceTokenChanges(dynamic graphQLClient) =>
      (super.noSuchMethod(
          Invocation.method(#listenOnDeviceTokenChanges, [graphQLClient]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> onMessageSetup<T extends _i5.FirebaseMessaging>(
          {_i9.BuildContext? context, _i6.OnMessageCallback? callback}) =>
      (super.noSuchMethod(
          Invocation.method(
              #onMessageSetup, [], {#context: context, #callback: callback}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> initializeLocalNotifications() =>
      (super.noSuchMethod(Invocation.method(#initializeLocalNotifications, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<bool> onNotificationSelected(String? payload) =>
      (super.noSuchMethod(Invocation.method(#onNotificationSelected, [payload]),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i4.IOSInitializationSettings initializeIOSInitializationSettings() =>
      (super.noSuchMethod(
              Invocation.method(#initializeIOSInitializationSettings, []),
              returnValue: _FakeIOSInitializationSettings_2())
          as _i4.IOSInitializationSettings);
  @override
  _i4.MacOSInitializationSettings initializeMacOSInitializationSettings() =>
      (super.noSuchMethod(
              Invocation.method(#initializeMacOSInitializationSettings, []),
              returnValue: _FakeMacOSInitializationSettings_3())
          as _i4.MacOSInitializationSettings);
  @override
  _i8.Future<_i5.NotificationSettings> requestIOSFCMMessagingPermission() =>
      (super.noSuchMethod(
              Invocation.method(#requestIOSFCMMessagingPermission, []),
              returnValue: Future<_i5.NotificationSettings>.value(
                  _FakeNotificationSettings_4()))
          as _i8.Future<_i5.NotificationSettings>);
  @override
  _i8.Future<_i5.NotificationSettings> requestMacOSFCMMessagingPermission() =>
      (super.noSuchMethod(
              Invocation.method(#requestMacOSFCMMessagingPermission, []),
              returnValue: Future<_i5.NotificationSettings>.value(
                  _FakeNotificationSettings_4()))
          as _i8.Future<_i5.NotificationSettings>);
  @override
  _i8.Future<String?> getDeviceToken() =>
      (super.noSuchMethod(Invocation.method(#getDeviceToken, []),
          returnValue: Future<String?>.value()) as _i8.Future<String?>);
  @override
  _i8.Future<void> resetToken() =>
      (super.noSuchMethod(Invocation.method(#resetToken, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Stream<String> onDeviceTokenRefresh() =>
      (super.noSuchMethod(Invocation.method(#onDeviceTokenRefresh, []),
          returnValue: Stream<String>.empty()) as _i8.Stream<String>);
  @override
  String toString() => super.toString();
}
