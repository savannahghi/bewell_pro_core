import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/entities/sil_custom_exceptions.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';

void main() {
  test('UserNotFoundException returns the correct String', () {
    const UserNotFoundException exception = UserNotFoundException();
    const ErrorWhileSearchingException searchException =
        ErrorWhileSearchingException();

    expect(exception.msg, cantFindUserWithPhone);
    expect(searchException.msg, errorWhileSearching);
  });
}
