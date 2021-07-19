class PatientVital {
  final String? vitalText;
  final String? vitalValue;
  final String? interpretation;
  final String? issueDate;
  final String? unit;

  PatientVital(
      {required this.vitalText,
      required this.vitalValue,
      required this.interpretation,
      required this.issueDate,
      required this.unit});
  factory PatientVital.fromJson(Map<String, dynamic> vital) => PatientVital(
        vitalText: vital['Code']['Text']?.toString(),
        vitalValue: vital['ValueQuantity']['Value']?.toString(),
        interpretation:
            vital['Interpretation'][0]['Text']?.toString().toUpperCase(),
        issueDate: vital['Issued']?.toString(),
        unit: vital['ValueQuantity']['Unit']?.toString(),
      );

  factory PatientVital.initial() => PatientVital(
        vitalText: null,
        vitalValue: null,
        interpretation: null,
        issueDate: null,
        unit: null,
      );
}
