// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_errors_state.freezed.dart';
part 'core_errors_state.g.dart';

@freezed
class CoreErrorsState with _$CoreErrorsState {
  factory CoreErrorsState({
    required String failure,
  }) = _CoreErrorsState;

  factory CoreErrorsState.fromJson(Map<String, dynamic> json) =>
      _$CoreErrorsStateFromJson(json);
}
