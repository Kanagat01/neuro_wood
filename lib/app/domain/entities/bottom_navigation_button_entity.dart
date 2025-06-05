import 'package:auto_route/auto_route.dart';

class BottomNavigationButtonEntity {
  final String title;
  //название иконки в assets, в зависмости от состояния добавится суффикс _active/_unactive
  final String icon;
  final int index;
  final PageRouteInfo route;

  const BottomNavigationButtonEntity({
    required this.title,
    required this.icon,
    required this.index,
    required this.route,
  });
}
