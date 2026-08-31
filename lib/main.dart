import 'package:flutter/material.dart';
import 'package:messaging_app/core/constents/app_constent.dart';
import 'core/theme/app_theme.dart';
import 'features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const SplashScreen(),
    );
  }
}
