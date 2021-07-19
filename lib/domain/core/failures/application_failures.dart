import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_failures.freezed.dart';

/// [ApplicationFailures] represents generic errors from our value objects.
/// In the event a value requires it's own specilized failures, we will create
/// a new Failure class specilized for that usecase.
@freezed
class ApplicationFailures<T> with _$ApplicationFailures<T> {
  const factory ApplicationFailures.invalidOtp({
    required T failedValue,
  }) = InvalidOtp<T>;

  const factory ApplicationFailures.unexpectedLoginFail({
    required T failedValue,
  }) = UnexpectedLoginFail<T>;
}
