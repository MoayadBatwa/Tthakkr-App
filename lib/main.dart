import 'package:flutter/material.dart';
import 'package:tthakkr_app/core/navigation/navigation_router.dart';
import 'package:tthakkr_app/core/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Azkar',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildAppTheme(),
      routerConfig: NavigationRouter.router,
    );
  }
}
