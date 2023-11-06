import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:theme_freight_ui/src/common/images.dart';
import 'package:theme_freight_ui/src/common/logger.dart';
import 'package:theme_freight_ui/src/theme/colors.dart';
import 'package:theme_freight_ui/src/user/screen/signupScreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  static final storage = FlutterSecureStorage();
  final GlobalKey<NestedScrollViewState> _scrollkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    logger.d('login page');
    return Scaffold(
        body: SingleChildScrollView(
            key: _scrollkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _exitBtn(),
                    _settingBtn(),
                  ],
                ),
                const Image(image: AppImages.mainTruck),
                _buildGuestBtn(),
                _buildLoginBtn(),
                _buildSignUpBtn()
              ],
            )));
  }

  Widget _exitBtn() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding:
            EdgeInsets.only(left: screenWidth * 0.01, top: screenHeight * 0.02),
        child: GestureDetector(
          onTap: () {
            // 클릭이벤트
            logger.d(' exit click ');
          },
          child: const Image(image: AppImages.exit2),
        ));
  }

  Widget _settingBtn() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding:
            EdgeInsets.only(left: screenWidth * 0.01, top: screenHeight * 0.02),
        child: GestureDetector(
            onTap: () {
              // 클릭이벤트
              logger.d('setting click ');
            },
            child: Image(
              image: AppImages.setting,
            )));
  }

  Widget _buildLoginBtn() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () => {print('login btn!')},
      child: Text('login', style: TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(),
    );
  }

  Widget _buildSignUpBtn() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()))
      },
      child: Text('Sign Up', style: TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(),
    );
  }

  Widget _buildGuestBtn() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
        onPressed: () => {print('geust login!')}, child: Text('Guest Login'));
  }

  _setSecurityStorage() async {
    await storage.write(key: 'login', value: 'value');
  }
}
