class RoutesObserver {
  static List<String> registerdRoutes = [];
  static addRoute(String routeName) {
    if (registerdRoutes.contains(routeName)) return;
    registerdRoutes.add(routeName);
  }
  
}
