class GenericException {
  final String message;

  factory GenericException.withMessage(String message) {
    return GenericException._(message);
  }

  GenericException._(this.message);

  @override
  bool operator ==(Object other) =>
      other is GenericException && other.message == this.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() {
    return 'GenericException: $message';
  }
}
