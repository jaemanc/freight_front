import 'package:flutter/material.dart';
import 'package:theme_freight_ui/src/common/home.dart';
import 'package:theme_freight_ui/src/theme/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

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
    titleLarge: TextStyle(color: Colors.brown),
    titleSmall: TextStyle(color: Colors.amber),
    labelMedium: TextStyle(color: Colors.pink),
  ),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.light(  // flutter 자체 버튼이 아닌 경우 컬러스킴으로 사용 많이 함.
      primaryContainer: AppColors.red),
      hoverColor: AppColors.brown
  ),
  scaffoldBackgroundColor: const Color(0xffEAE8F4),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(color: Colors.amber),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.light(  // flutter 자체 버튼이 아닌 경우 컬러스킴으로 사용 많이 함.
      primaryContainer: AppColors.black),
      hoverColor: AppColors.blue
  ),
  scaffoldBackgroundColor: AppColors.lightPink,
);