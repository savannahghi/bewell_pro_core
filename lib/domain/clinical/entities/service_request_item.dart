class ServiceRequestItem {
  late String? request;
  late String? display;
  late String? status;
  ServiceRequestItem({required dynamic item}) {
    request = item['category'][0]['text'].toString();
    display = item['code'] == null ? null : item['code']['text'].toString();
    status = item['status'].toString();
  }
}
