import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_errors_state.freezed.dart';
part 'app_errors_state.g.dart';

@freezed
class AppErrorsState with _$AppErrorsState {
  factory AppErrorsState({
    required String failure,
  }) = _AppErrorsState;

  factory AppErrorsState.fromJson(Map<String, dynamic> json) =>
      _$AppErrorsStateFromJson(json);
}
