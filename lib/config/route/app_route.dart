import 'package:flutter/material.dart';
import 'package:flutter_file_upload/features/login/presentation/pages/login_screen.dart';

import '../../features/dashboard/presentation/pages/dashboard_page.dart';

class AppRoute{
  static const String defaultRoute = "/";
  static const String dashboardRoute = "/DashBoardScreen";

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case defaultRoute:
        return _materialRoute(const LoginScreen());
        case dashboardRoute:
        return _materialRoute(const DashboardPage());
      default:
        return _materialRoute(const LoginScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

}