import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:theme_freight_ui/src/common/ui/exit_button.dart';
import 'package:theme_freight_ui/src/common/ui/home_screen.dart';
import 'package:theme_freight_ui/src/features/user/screen/login_screen.dart';
import 'package:theme_freight_ui/src/settings/images.dart';
import 'package:theme_freight_ui/src/settings/logger.dart';
import 'package:theme_freight_ui/src/common/ui/setting_screen.dart';
import 'package:theme_freight_ui/src/features/user/bloc/authentication_bloc.dart';
import 'package:theme_freight_ui/src/features/user/event/authentication_event.dart';
import 'package:theme_freight_ui/src/features/user/screen/signup_screen.dart';
import 'package:theme_freight_ui/src/features/user/state/authentication_state.dart';


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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
          key: _scrollkey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  ExitButton(),
                  const SettingButton(),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight* 0.2),
                child: Image(
                  image: AppImages.mainTruck,
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.2,
                  fit: BoxFit.fill,
                  ),
              ),
              _buildLoginBtn(),
              _buildSignUpBtn(),
                BlocSelector<AuthenticationBloc, AuthenticationState, AuthenticationStateStatus> 
                (
                selector: (state) {
                  return state.status;
                },
                builder: ((context, state) {
                  if (state == AuthenticationStateStatus.loadSuccess ) {
                        Future.microtask((){
                          logger.i('Home 화면으로 이동합니다. ');
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                        });
                        return Text('go to home');
                  } else {
                    return _buildGuestBtn(context);
                  }
                })
              ),
            ],
          )));
  }

  Widget _buildLoginBtn() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.07 ),
      child: ElevatedButton(
        onPressed: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()))
        },
        child: Text(' login ', style: TextStyle(fontSize: 40)),
        style: ElevatedButton.styleFrom(),
      ),
    );
  }

  Widget _buildSignUpBtn() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.019 ),
      child: ElevatedButton(
        onPressed: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()))
        },
        child: Text(' Sign Up ', style: TextStyle(fontSize: 40)),
        style: ElevatedButton.styleFrom(),
      ),
    );
  }

  Widget _buildGuestBtn(BuildContext context) {
    
    AuthenticationBloc authenticationbloc = BlocProvider.of<AuthenticationBloc>(context);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.019 ),
      child: ElevatedButton(
          onPressed: () => {
            authenticationbloc.add(GuestLoginEvent())
          }, 
          child: Text('Guest Login' , style: TextStyle(fontSize: 40) )),
    );
  }

  _setSecurityStorage() async {
    await storage.write(key: 'login', value: 'value');
  }
}
