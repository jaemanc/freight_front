// import 'package:flutter/cupertino.dart';
// import 'package:theme_freight_ui/src/common/home.dart';
// import 'package:theme_freight_ui/src/common/logger.dart';
// import 'package:theme_freight_ui/src/operate/screen/operate_screen.dart';
// import 'package:theme_freight_ui/src/user/screen/login_screen.dart';

// enum Routes {
//   home,
//   drive,
//   expenditure,
//   oil,
//   maintenance,
//   simpleLogin,
//   authLogin,
//   signUp,
//   login,
//   main,
//   operate
// }

// class _Paths {
//   static const String home = 'home';
//   static const String expenditure = 'expenditure';
//   static const String oil = 'oil';
//   static const String maintenance = 'maintenance';
//   static const String simpleLogin = 'simpleLogin';
//   static const String authLogin = 'authLogin';
//   static const String signUp = 'signUp';
//   static const String login = 'login';
//   static const String main = 'main';
//   static const String operate = 'operate';

//   static const Map<Routes, String> _pathMap = {
//     Routes.home: _Paths.home,
//     Routes.operate: _Paths.operate,
//     Routes.expenditure: _Paths.expenditure,
//     Routes.oil: _Paths.oil,
//     Routes.maintenance: _Paths.maintenance,
//     Routes.simpleLogin: _Paths.simpleLogin,
//     Routes.authLogin: _Paths.authLogin,
//     Routes.signUp: _Paths.signUp,
//     Routes.login: _Paths.login,
//     Routes.main: _Paths.main
//   };

//   static String of(Routes route) => _pathMap[route] ?? home;
// }

// class AppNavigator {
//   static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

//   static Route onGenerateRoute(RouteSettings settings) {
//     logger.d("generate Route settings name ${settings.name}");

//     switch (settings.name) {
//       case _Paths.login:
//         return FadeRoute(page: const Login());
//       case _Paths.operate:
//         return FadeRoute(page: const Operate());

//       // case _Paths.drive:
//       //   return FadeRoute(page: const DriveScreen());
//       // case _Paths.expenditure:
//       //   return FadeRoute(page: const ExpenditureScreen());
//       // case _Paths.oil:
//       //   return FadeRoute(page: const OilScreen());
//       // case _Paths.maintenance:
//       //   return FadeRoute(page: const MaintenanceScreen());
//       // case _Paths.simpleLogin:
//       //   return FadeRoute(page: const UserScreen());
//       // case _Paths.authLogin:
//       //   return FadeRoute(page: const UserAuthLogin());
//       // case _Paths.signUp:
//       //   return FadeRoute(page: const UserSignUp());
//       default:
//         return FadeRoute(page: const Home());
//     }
//   }

//   static Future? push<T>(Routes route, [T? arguments]) =>
//       state?.pushNamed(_Paths.of(route), arguments: arguments);

//   static Future? replaceWith<T>(Routes route, [T? arguments]) =>
//       state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

//   static void pop() => state?.pop();

//   static NavigatorState? get state => navigatorKey.currentState;
// }

// class FadeRoute extends PageRouteBuilder {
//   FadeRoute({required this.page})
//       : super(
//           pageBuilder: (_, __, ___) => page,
//           transitionsBuilder: (_, animation, __, child) => FadeTransition(
//             opacity: animation,
//             child: child,
//           ),
//         );

//   final Widget page;
// }
