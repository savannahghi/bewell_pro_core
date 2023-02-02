// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'misc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MiscState _$MiscStateFromJson(Map<String, dynamic> json) {
  return _MiscState.fromJson(json);
}

/// @nodoc
mixin _$MiscState {
  String? get visitCount => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get otpCode => throw _privateConstructorUsedError;
  String? get pinCode => throw _privateConstructorUsedError;
  bool? get acceptedTerms => throw _privateConstructorUsedError;
  List<FAQContent?>? get faqList => throw _privateConstructorUsedError;
  EventState? get eventState => throw _privateConstructorUsedError;

  /// [defaultLocation] the location(branch) that the user has chosen
  String? get defaultLocation => throw _privateConstructorUsedError;

  /// [createPin] used when user is creating a PIN.
  String? get createPin => throw _privateConstructorUsedError;

  /// [confirmPin] used when user is creating a PIN for client side validation
  String? get confirmPin => throw _privateConstructorUsedError;

  /// [invalidCredentials] indicates the provided credentials are invalid.
  bool? get invalidCredentials => throw _privateConstructorUsedError;

  /// [unKnownPhoneNo] indicates that the provided phone number is not known by the backend.
  bool? get unKnownPhoneNo => throw _privateConstructorUsedError;

  /// [accountExists] a signal to the frontend that an account with the provided credentials already exists.
  bool? get accountExists => throw _privateConstructorUsedError;

  /// [invalidPin] used when running pin verification procedure.
  bool? get invalidPin => throw _privateConstructorUsedError;

  /// notify user when the start visit action process fails
  @JsonKey(ignore: true)
  Event<bool?>? get startVisitFailed =>
      throw _privateConstructorUsedError; // TODO: rename to startVisitFailedEvent
  String? get patientSearchTerm => throw _privateConstructorUsedError;
  bool? get hasCompletedEnteringOTP =>
      throw _privateConstructorUsedError; // TODO: remove it is unused
  bool? get isResendingOTP => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MiscStateCopyWith<MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiscStateCopyWith<$Res> {
  factory $MiscStateCopyWith(MiscState value, $Res Function(MiscState) then) =
      _$MiscStateCopyWithImpl<$Res, MiscState>;
  @useResult
  $Res call(
      {String? visitCount,
      String? title,
      String? message,
      String? phoneNumber,
      String? otpCode,
      String? pinCode,
      bool? acceptedTerms,
      List<FAQContent?>? faqList,
      EventState? eventState,
      String? defaultLocation,
      String? createPin,
      String? confirmPin,
      bool? invalidCredentials,
      bool? unKnownPhoneNo,
      bool? accountExists,
      bool? invalidPin,
      @JsonKey(ignore: true) Event<bool?>? startVisitFailed,
      String? patientSearchTerm,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP});

  $EventStateCopyWith<$Res>? get eventState;
}

/// @nodoc
class _$MiscStateCopyWithImpl<$Res, $Val extends MiscState>
    implements $MiscStateCopyWith<$Res> {
  _$MiscStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitCount = freezed,
    Object? title = freezed,
    Object? message = freezed,
    Object? phoneNumber = freezed,
    Object? otpCode = freezed,
    Object? pinCode = freezed,
    Object? acceptedTerms = freezed,
    Object? faqList = freezed,
    Object? eventState = freezed,
    Object? defaultLocation = freezed,
    Object? createPin = freezed,
    Object? confirmPin = freezed,
    Object? invalidCredentials = freezed,
    Object? unKnownPhoneNo = freezed,
    Object? accountExists = freezed,
    Object? invalidPin = freezed,
    Object? startVisitFailed = freezed,
    Object? patientSearchTerm = freezed,
    Object? hasCompletedEnteringOTP = freezed,
    Object? isResendingOTP = freezed,
  }) {
    return _then(_value.copyWith(
      visitCount: freezed == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: freezed == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedTerms: freezed == acceptedTerms
          ? _value.acceptedTerms
          : acceptedTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
      faqList: freezed == faqList
          ? _value.faqList
          : faqList // ignore: cast_nullable_to_non_nullable
              as List<FAQContent?>?,
      eventState: freezed == eventState
          ? _value.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as EventState?,
      defaultLocation: freezed == defaultLocation
          ? _value.defaultLocation
          : defaultLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      createPin: freezed == createPin
          ? _value.createPin
          : createPin // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPin: freezed == confirmPin
          ? _value.confirmPin
          : confirmPin // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidCredentials: freezed == invalidCredentials
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool?,
      unKnownPhoneNo: freezed == unKnownPhoneNo
          ? _value.unKnownPhoneNo
          : unKnownPhoneNo // ignore: cast_nullable_to_non_nullable
              as bool?,
      accountExists: freezed == accountExists
          ? _value.accountExists
          : accountExists // ignore: cast_nullable_to_non_nullable
              as bool?,
      invalidPin: freezed == invalidPin
          ? _value.invalidPin
          : invalidPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      startVisitFailed: freezed == startVisitFailed
          ? _value.startVisitFailed
          : startVisitFailed // ignore: cast_nullable_to_non_nullable
              as Event<bool?>?,
      patientSearchTerm: freezed == patientSearchTerm
          ? _value.patientSearchTerm
          : patientSearchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCompletedEnteringOTP: freezed == hasCompletedEnteringOTP
          ? _value.hasCompletedEnteringOTP
          : hasCompletedEnteringOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      isResendingOTP: freezed == isResendingOTP
          ? _value.isResendingOTP
          : isResendingOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EventStateCopyWith<$Res>? get eventState {
    if (_value.eventState == null) {
      return null;
    }

    return $EventStateCopyWith<$Res>(_value.eventState!, (value) {
      return _then(_value.copyWith(eventState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MiscStateCopyWith<$Res> implements $MiscStateCopyWith<$Res> {
  factory _$$_MiscStateCopyWith(
          _$_MiscState value, $Res Function(_$_MiscState) then) =
      __$$_MiscStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? visitCount,
      String? title,
      String? message,
      String? phoneNumber,
      String? otpCode,
      String? pinCode,
      bool? acceptedTerms,
      List<FAQContent?>? faqList,
      EventState? eventState,
      String? defaultLocation,
      String? createPin,
      String? confirmPin,
      bool? invalidCredentials,
      bool? unKnownPhoneNo,
      bool? accountExists,
      bool? invalidPin,
      @JsonKey(ignore: true) Event<bool?>? startVisitFailed,
      String? patientSearchTerm,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP});

  @override
  $EventStateCopyWith<$Res>? get eventState;
}

/// @nodoc
class __$$_MiscStateCopyWithImpl<$Res>
    extends _$MiscStateCopyWithImpl<$Res, _$_MiscState>
    implements _$$_MiscStateCopyWith<$Res> {
  __$$_MiscStateCopyWithImpl(
      _$_MiscState _value, $Res Function(_$_MiscState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitCount = freezed,
    Object? title = freezed,
    Object? message = freezed,
    Object? phoneNumber = freezed,
    Object? otpCode = freezed,
    Object? pinCode = freezed,
    Object? acceptedTerms = freezed,
    Object? faqList = freezed,
    Object? eventState = freezed,
    Object? defaultLocation = freezed,
    Object? createPin = freezed,
    Object? confirmPin = freezed,
    Object? invalidCredentials = freezed,
    Object? unKnownPhoneNo = freezed,
    Object? accountExists = freezed,
    Object? invalidPin = freezed,
    Object? startVisitFailed = freezed,
    Object? patientSearchTerm = freezed,
    Object? hasCompletedEnteringOTP = freezed,
    Object? isResendingOTP = freezed,
  }) {
    return _then(_$_MiscState(
      visitCount: freezed == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: freezed == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedTerms: freezed == acceptedTerms
          ? _value.acceptedTerms
          : acceptedTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
      faqList: freezed == faqList
          ? _value._faqList
          : faqList // ignore: cast_nullable_to_non_nullable
              as List<FAQContent?>?,
      eventState: freezed == eventState
          ? _value.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as EventState?,
      defaultLocation: freezed == defaultLocation
          ? _value.defaultLocation
          : defaultLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      createPin: freezed == createPin
          ? _value.createPin
          : createPin // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPin: freezed == confirmPin
          ? _value.confirmPin
          : confirmPin // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidCredentials: freezed == invalidCredentials
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool?,
      unKnownPhoneNo: freezed == unKnownPhoneNo
          ? _value.unKnownPhoneNo
          : unKnownPhoneNo // ignore: cast_nullable_to_non_nullable
              as bool?,
      accountExists: freezed == accountExists
          ? _value.accountExists
          : accountExists // ignore: cast_nullable_to_non_nullable
              as bool?,
      invalidPin: freezed == invalidPin
          ? _value.invalidPin
          : invalidPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      startVisitFailed: freezed == startVisitFailed
          ? _value.startVisitFailed
          : startVisitFailed // ignore: cast_nullable_to_non_nullable
              as Event<bool?>?,
      patientSearchTerm: freezed == patientSearchTerm
          ? _value.patientSearchTerm
          : patientSearchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCompletedEnteringOTP: freezed == hasCompletedEnteringOTP
          ? _value.hasCompletedEnteringOTP
          : hasCompletedEnteringOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      isResendingOTP: freezed == isResendingOTP
          ? _value.isResendingOTP
          : isResendingOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MiscState implements _MiscState {
  _$_MiscState(
      {this.visitCount,
      this.title,
      this.message,
      this.phoneNumber,
      this.otpCode,
      this.pinCode,
      this.acceptedTerms,
      final List<FAQContent?>? faqList,
      this.eventState,
      this.defaultLocation,
      this.createPin,
      this.confirmPin,
      this.invalidCredentials,
      this.unKnownPhoneNo,
      this.accountExists,
      this.invalidPin,
      @JsonKey(ignore: true) this.startVisitFailed,
      this.patientSearchTerm,
      this.hasCompletedEnteringOTP,
      this.isResendingOTP})
      : _faqList = faqList;

  factory _$_MiscState.fromJson(Map<String, dynamic> json) =>
      _$$_MiscStateFromJson(json);

  @override
  final String? visitCount;
  @override
  final String? title;
  @override
  final String? message;
  @override
  final String? phoneNumber;
  @override
  final String? otpCode;
  @override
  final String? pinCode;
  @override
  final bool? acceptedTerms;
  final List<FAQContent?>? _faqList;
  @override
  List<FAQContent?>? get faqList {
    final value = _faqList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final EventState? eventState;

  /// [defaultLocation] the location(branch) that the user has chosen
  @override
  final String? defaultLocation;

  /// [createPin] used when user is creating a PIN.
  @override
  final String? createPin;

  /// [confirmPin] used when user is creating a PIN for client side validation
  @override
  final String? confirmPin;

  /// [invalidCredentials] indicates the provided credentials are invalid.
  @override
  final bool? invalidCredentials;

  /// [unKnownPhoneNo] indicates that the provided phone number is not known by the backend.
  @override
  final bool? unKnownPhoneNo;

  /// [accountExists] a signal to the frontend that an account with the provided credentials already exists.
  @override
  final bool? accountExists;

  /// [invalidPin] used when running pin verification procedure.
  @override
  final bool? invalidPin;

  /// notify user when the start visit action process fails
  @override
  @JsonKey(ignore: true)
  final Event<bool?>? startVisitFailed;
// TODO: rename to startVisitFailedEvent
  @override
  final String? patientSearchTerm;
  @override
  final bool? hasCompletedEnteringOTP;
// TODO: remove it is unused
  @override
  final bool? isResendingOTP;

  @override
  String toString() {
    return 'MiscState(visitCount: $visitCount, title: $title, message: $message, phoneNumber: $phoneNumber, otpCode: $otpCode, pinCode: $pinCode, acceptedTerms: $acceptedTerms, faqList: $faqList, eventState: $eventState, defaultLocation: $defaultLocation, createPin: $createPin, confirmPin: $confirmPin, invalidCredentials: $invalidCredentials, unKnownPhoneNo: $unKnownPhoneNo, accountExists: $accountExists, invalidPin: $invalidPin, startVisitFailed: $startVisitFailed, patientSearchTerm: $patientSearchTerm, hasCompletedEnteringOTP: $hasCompletedEnteringOTP, isResendingOTP: $isResendingOTP)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MiscState &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.acceptedTerms, acceptedTerms) ||
                other.acceptedTerms == acceptedTerms) &&
            const DeepCollectionEquality().equals(other._faqList, _faqList) &&
            (identical(other.eventState, eventState) ||
                other.eventState == eventState) &&
            (identical(other.defaultLocation, defaultLocation) ||
                other.defaultLocation == defaultLocation) &&
            (identical(other.createPin, createPin) ||
                other.createPin == createPin) &&
            (identical(other.confirmPin, confirmPin) ||
                other.confirmPin == confirmPin) &&
            (identical(other.invalidCredentials, invalidCredentials) ||
                other.invalidCredentials == invalidCredentials) &&
            (identical(other.unKnownPhoneNo, unKnownPhoneNo) ||
                other.unKnownPhoneNo == unKnownPhoneNo) &&
            (identical(other.accountExists, accountExists) ||
                other.accountExists == accountExists) &&
            (identical(other.invalidPin, invalidPin) ||
                other.invalidPin == invalidPin) &&
            (identical(other.startVisitFailed, startVisitFailed) ||
                other.startVisitFailed == startVisitFailed) &&
            (identical(other.patientSearchTerm, patientSearchTerm) ||
                other.patientSearchTerm == patientSearchTerm) &&
            (identical(
                    other.hasCompletedEnteringOTP, hasCompletedEnteringOTP) ||
                other.hasCompletedEnteringOTP == hasCompletedEnteringOTP) &&
            (identical(other.isResendingOTP, isResendingOTP) ||
                other.isResendingOTP == isResendingOTP));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        visitCount,
        title,
        message,
        phoneNumber,
        otpCode,
        pinCode,
        acceptedTerms,
        const DeepCollectionEquality().hash(_faqList),
        eventState,
        defaultLocation,
        createPin,
        confirmPin,
        invalidCredentials,
        unKnownPhoneNo,
        accountExists,
        invalidPin,
        startVisitFailed,
        patientSearchTerm,
        hasCompletedEnteringOTP,
        isResendingOTP
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MiscStateCopyWith<_$_MiscState> get copyWith =>
      __$$_MiscStateCopyWithImpl<_$_MiscState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MiscStateToJson(
      this,
    );
  }
}

abstract class _MiscState implements MiscState {
  factory _MiscState(
      {final String? visitCount,
      final String? title,
      final String? message,
      final String? phoneNumber,
      final String? otpCode,
      final String? pinCode,
      final bool? acceptedTerms,
      final List<FAQContent?>? faqList,
      final EventState? eventState,
      final String? defaultLocation,
      final String? createPin,
      final String? confirmPin,
      final bool? invalidCredentials,
      final bool? unKnownPhoneNo,
      final bool? accountExists,
      final bool? invalidPin,
      @JsonKey(ignore: true) final Event<bool?>? startVisitFailed,
      final String? patientSearchTerm,
      final bool? hasCompletedEnteringOTP,
      final bool? isResendingOTP}) = _$_MiscState;

  factory _MiscState.fromJson(Map<String, dynamic> json) =
      _$_MiscState.fromJson;

  @override
  String? get visitCount;
  @override
  String? get title;
  @override
  String? get message;
  @override
  String? get phoneNumber;
  @override
  String? get otpCode;
  @override
  String? get pinCode;
  @override
  bool? get acceptedTerms;
  @override
  List<FAQContent?>? get faqList;
  @override
  EventState? get eventState;
  @override

  /// [defaultLocation] the location(branch) that the user has chosen
  String? get defaultLocation;
  @override

  /// [createPin] used when user is creating a PIN.
  String? get createPin;
  @override

  /// [confirmPin] used when user is creating a PIN for client side validation
  String? get confirmPin;
  @override

  /// [invalidCredentials] indicates the provided credentials are invalid.
  bool? get invalidCredentials;
  @override

  /// [unKnownPhoneNo] indicates that the provided phone number is not known by the backend.
  bool? get unKnownPhoneNo;
  @override

  /// [accountExists] a signal to the frontend that an account with the provided credentials already exists.
  bool? get accountExists;
  @override

  /// [invalidPin] used when running pin verification procedure.
  bool? get invalidPin;
  @override

  /// notify user when the start visit action process fails
  @JsonKey(ignore: true)
  Event<bool?>? get startVisitFailed;
  @override // TODO: rename to startVisitFailedEvent
  String? get patientSearchTerm;
  @override
  bool? get hasCompletedEnteringOTP;
  @override // TODO: remove it is unused
  bool? get isResendingOTP;
  @override
  @JsonKey(ignore: true)
  _$$_MiscStateCopyWith<_$_MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}
