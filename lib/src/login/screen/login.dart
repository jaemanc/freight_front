import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:theme_freight_ui/src/common/images.dart';
import 'package:theme_freight_ui/src/theme/colors.dart';

class Login extends StatefulWidget {
  // if not login landing page
  
  const Login({super.key});

  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  static final storage = FlutterSecureStorage();
  final GlobalKey<NestedScrollViewState> _scrollkey = GlobalKey();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: _scrollkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(image: AppImages.mainTruck),
            _buildGuestBtn(),
            _buildLoginBtn(),
            _buildSignUpBtn()
          ],
        )
      )
    );
  }

  Widget _buildLoginBtn() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.1,
        right: screenWidth * 0.1,
        top: screenHeight * 0.1
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all()
        ),
        child: GestureDetector(
          onTap: () => {
            print('tap login btn'),
            const Text('login')
          },
        )
      )
    );

  }

  Widget _buildSignUpBtn() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () => {
        print('signUp!')
      },
      child: Text('Sign Up', style: TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(
      ),
    );
  }

  Widget _buildGuestBtn() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;    
    return ElevatedButton(
      onPressed: () => {
        print('geust login!')
      },
      child: Text('Guest Login')
    );
  }

  _setSecurityStorage() async {
    await storage.write(
      key: 'login', value: 'value'
    );
  }

}


