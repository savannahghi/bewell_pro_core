// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative.dart';

class DecodedSystem {
  final Map<String, dynamic> decodedJson;
  final String title;

  DecodedSystem(this.decodedJson, this.title);

  factory DecodedSystem.initial() =>
      DecodedSystem(<String, dynamic>{}, UNKNOWN);

  /// extracts the data based on the [title] you pass in
  ///
  /// this function returns a map containing 2 items
  ///   (1) - the section data based on the title you pass
  ///   (2) - the composition ID used when deleting the composition
  ///
  /// the sample data looks like this:
  /// Map<String, dynamic> data = {
  ///  'decodedJson': '{
  ///     "description": null,
  ///     "symptomEdema": "false",
  ///     "symptomChestPain": "false",
  ///     "symptomDOE": "true",
  ///     "symptomPalp": "true",
  ///     "symptomPND": "false",
  ///     "symptomDiaphore": "true"
  ///   }',
  ///   'compositionID': '532e31bb-de12-45ca-beda-268352398f3f',
  ///   'title': 'respiratory'
  /// };
  factory DecodedSystem.deconstructReviewOfSystem(
      {required String title, required Composition compositionPayload}) {
    final Section? _section = compositionPayload.section?.firstWhere(
      (Section? s) {
        return s?.title == title;
      },
      orElse: () => Section().copyWith.call(text: Narrative(div: UNKNOWN)),
    );

    if (_section != null && _section.text!.div != UNKNOWN) {
      final String? div = _section.text?.div;
      if (div != null && div != UNKNOWN) {
        final Map<String, dynamic> _decodedJson =
            json.decode(div) as Map<String, dynamic>;

        final DecodedSystem _decodedSystem = DecodedSystem(_decodedJson, title);

        return _decodedSystem;
      } else {
        return DecodedSystem.initial();
      }
    } else {
      return DecodedSystem.initial();
    }
  }
}
