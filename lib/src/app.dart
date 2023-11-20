import 'package:flutter/material.dart';
import 'package:theme_freight_ui/src/common/home_screen.dart';
import 'package:theme_freight_ui/src/theme/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: lightMode,
      darkTheme: darkMode,
      home: const Home(),
    );
  }
}

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
  useMaterial3: true,
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.white),
    titleSmall: TextStyle(color: Colors.white),
    labelMedium: TextStyle(color: Color.fromARGB(255, 197, 113, 141)),
    bodyLarge: TextStyle(color: AppColors.white),
    bodyMedium: TextStyle(color: AppColors.white),
    bodySmall: TextStyle(color: AppColors.white),
  ),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.light(  // flutter 자체 버튼이 아닌 경우 컬러스킴으로 사용 많이 함.
      primaryContainer: AppColors.red),
      hoverColor: AppColors.brown
  ),
  scaffoldBackgroundColor: AppColors.darkGreen
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(color: Colors.amber),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.white),
    bodyMedium: TextStyle(color: AppColors.white),
    bodySmall: TextStyle(color: AppColors.white),
  ),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.light(  // flutter 자체 버튼이 아닌 경우 컬러스킴으로 사용 많이 함.
      primaryContainer: AppColors.black),
      hoverColor: AppColors.blue
  ),
  scaffoldBackgroundColor: AppColors.darkGreen
);