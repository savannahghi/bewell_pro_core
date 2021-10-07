// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';

class EmptyProblemsContainer extends StatelessWidget {
  const EmptyProblemsContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: const GenericZeroStateWidget(
        title: zeroStateProblemTitle,
        subtitle: zeroStateProblemSubTitle,
      ),
    );
  }
}
