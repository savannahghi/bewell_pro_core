// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';

class UserNotFoundException extends UserException {
  const UserNotFoundException() : super(cantFindUserWithPhone);
}

class ErrorWhileSearchingException extends UserException {
  const ErrorWhileSearchingException() : super(errorWhileSearching);
}
