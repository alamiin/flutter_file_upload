import 'package:flutter/material.dart';
import 'package:flutter_file_upload/features/login/presentation/pages/login_screen.dart';



//01405529145
class AppRoute{
  static const String defaultRoute = "/";
  static const String userDetailsRoute = "/DashBoardScreen";

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case defaultRoute:
        return _materialRoute(const LoginScreen());
      default:
        return _materialRoute(const LoginScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

}