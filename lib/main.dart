import 'package:flutter/material.dart';

import 'config/route/app_route.dart';
import 'config/theme/light_theme.dart';
import 'features/login/presentation/pages/login_screen.dart';
import 'package:flutter_file_upload/di_container.dart' as di;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
        onGenerateRoute: AppRoute.onGenerateRoutes,
        home: LoginScreen()
    );
  }
}


