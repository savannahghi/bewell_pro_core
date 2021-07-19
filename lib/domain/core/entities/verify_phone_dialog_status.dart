class VerifyPhoneDialogStatus {
  final bool isVerified;
  final String otp;
  final String? error;

  VerifyPhoneDialogStatus({
    required this.otp,
    required this.isVerified,
    this.error,
  });
}
