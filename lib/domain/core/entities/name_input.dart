// Package imports:

// Project imports:
import 'package:bewell_pro_core/domain/core/entities/payload_input.dart';
import 'package:sghi_core/domain_objects/value_objects/name.dart';

class NameInput with PayloadInput {
  final Name firstName;
  final Name lastName;
  final Name? otherNames;

  NameInput({
    required this.firstName,
    required this.lastName,
    this.otherNames,
  });

  @override
  Map<String, String?> toMap() {
    return <String, String?>{
      'firstName': firstName.getValue(),
      'lastName': lastName.getValue(),
      'otherNames': otherNames?.getValue(),
    };
  }
}
