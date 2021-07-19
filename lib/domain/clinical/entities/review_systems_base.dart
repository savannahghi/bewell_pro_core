import 'package:rxdart/rxdart.dart';

/// Contains all the relevant information to be used in the review of systems
/// drawers.
class ReviewSystemBase {
  /// Used to reset all UI values when opening the drawers
  final List<String> symptoms;

  /// The map of symptoms to be used when rendering the UI
  final Map<String, bool> symptomsMap;

  /// Any notes the doctor may want to add
  final BehaviorSubject<String?> description;

  /// - The map of review of system data based on the user interactions
  final dynamic dataObject;

  /// The property in the [ExamCompositionObject] that
  /// will this system's encoded data when the UI is ready to save
  final BehaviorSubject<String?> compositionDataObject;

  ReviewSystemBase({
    required this.symptoms,
    required this.symptomsMap,
    required this.description,
    required this.dataObject,
    required this.compositionDataObject,
  });
}
