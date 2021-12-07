// Package imports:
import 'package:dartz/dartz.dart';

class StartVisitStatus {
  /// indicates whether the visit was started or not
  final bool hasVisitStarted;

  /// can be either a [Map] or [String] which indicates the payload
  /// returned from the response
  final Either<String?, Map<String, dynamic>> payload;

  StartVisitStatus(this.payload, {required this.hasVisitStarted});
}
