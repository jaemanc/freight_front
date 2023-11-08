import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:theme_freight_ui/src/common/images.dart';
import 'package:theme_freight_ui/src/common/routes.dart';
import 'package:theme_freight_ui/src/user/screen/login_screen.dart';

import 'logger.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  static final storage = FlutterSecureStorage();
  dynamic userInfo = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    // read 함수로 key값에 맞는 정보를 불러오고 데이터타입은 String 타입
    // 데이터가 없을때는 null을 반환
    userInfo = await storage.read(key: 'login');
    // user의 정보가 있다면 로그인 후 들어가는 첫 페이지로 넘어가게 합니다.
    if (userInfo != null) {
      logger.d('push to main');

      Future(() {
        AppNavigator.push(Routes.main);
      });
      
    } else {
      logger.d('push to login');
      Future(() {
         Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
      });
      // FadeRoute(page: const Login());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: const Center(
        child: Column(
          children: [Image(image: AppImages.mainTruck)]
        ),
      ),
    );
  }
}
