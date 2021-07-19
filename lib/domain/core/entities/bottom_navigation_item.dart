class BottomNavigationItem {
  const BottomNavigationItem({
    required this.iconUrl,
    required this.text,
    required this.onTapRoute,
    this.onTapRouteArguments,
  });

  final String iconUrl;
  final String? onTapRoute;
  final Map<String, dynamic>? onTapRouteArguments;
  final String text;
}
