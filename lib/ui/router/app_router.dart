import 'package:flutter/material.dart';
import 'package:over_money_manager/ui/router/app_routes.dart';
import 'package:over_money_manager/ui/pages/error_404_page/error_404_page.dart';
import 'package:over_money_manager/app_const.dart';

class AppRouter {
  static const _pageDuration = AppConstants.defaultPageTransition;
  static String get initRoute => AppRoutes.start;

  static Route generate(RouteSettings settings) {
    final _routeName = settings.name?.trim();

    if (_routeName == null) return _errorRoute404;

    final _allAppRoutes = AppRoutes.routes.toList();

    for (var _appRoute in _allAppRoutes) {
      if (_routeName != _appRoute.path) continue;

      final _newRoute = _getRouteTemplate(
        child: _appRoute.page,
        settings: settings,
      );

      return _newRoute;
    }

    return _errorRoute404;
  }

  static Route _getRouteTemplate({
    required Widget child,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      transitionDuration: _pageDuration,
      reverseTransitionDuration: _pageDuration,
      pageBuilder: (_, __, ___) => child,
    );
  }

  static final Route _errorRoute404 = MaterialPageRoute(
    settings: const RouteSettings(name: '/404'),
    builder: (_) => const Error404Page(),
  );
}
