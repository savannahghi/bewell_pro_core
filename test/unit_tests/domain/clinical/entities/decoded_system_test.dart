// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/decoded_system.dart';
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative_status.dart';
import 'package:sghi_core/domain_objects/value_objects/unknown.dart';

void main() {
  test('Decoded System should return initial when the div is null', () {
    const String title = 'respiratory';
    final Composition composition = Composition(
      title: 'respiratory',
      section: <Section>[
        Section(
          title: 'respiratory',
          text: Narrative(
            status: NarrativeStatusEnum.generated,
          ),
        )
      ],
    );

    expect(
      DecodedSystem.deconstructReviewOfSystem(
              title: title, compositionPayload: composition)
          .title,
      UNKNOWN,
    );
  });
}
