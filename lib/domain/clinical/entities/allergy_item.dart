class AllergyItem {
  late String substance;
  late String reaction;
  late String severity;
  late String note;

  AllergyItem({required dynamic item}) {
    substance = item['reaction'][0]['substance']['text'].toString();
    reaction = item['reaction'][0]['description'].toString();
    severity = item['reaction'][0]['severity'].toString();
    note = item['note'][0]['text'].toString();
  }
}
