import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const CareerGuideApp());
}

class CareerGuideApp extends StatelessWidget {
  const CareerGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Career Guide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primary,
        ),
      ),
      home: const LoginPage(),
    );
  }
}
