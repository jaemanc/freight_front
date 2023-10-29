import 'package:flutter/material.dart';
import 'package:theme_freight_ui/src/page/home.dart';
import 'package:theme_freight_ui/src/theme/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: lightMode,
      darkTheme: darkMode,

      // login

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
  scaffoldBackgroundColor: const Color(0xffEAE8F4),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(color: Colors.amber),
  // textTheme: const TextTheme(),
  // buttonTheme: ButtonTheme(buttonColor: Colors.white70, child: null,),
  // bottomNavigationBarTheme: ,
  scaffoldBackgroundColor: AppColors.lightPink,
);

class _chkLogin extends State<Login> {
  @override
  Widget build(BuildContext context) {
        
  }
}

class Login {
  final bool? isLogin;
  Login({
    this.isLogin
    });
}
