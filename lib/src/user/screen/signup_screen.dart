import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_freight_ui/src/common/exit_button.dart';
import 'package:theme_freight_ui/src/common/home_screen.dart';
import 'package:theme_freight_ui/src/common/images.dart';
import 'package:theme_freight_ui/src/common/logger.dart';
import 'package:theme_freight_ui/src/theme/colors.dart';
import 'package:theme_freight_ui/src/user/bloc/authentication_bloc.dart';
import 'package:theme_freight_ui/src/user/event/authentication_event.dart';
import 'package:theme_freight_ui/src/user/model/user_entity.dart';
import 'package:theme_freight_ui/src/user/state/authentication_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _signUpState();
}

class _signUpState extends State<SignUp> {
  // id / contact / e-mail / name // ok! geust!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpForm(),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

class SignUpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  AuthenticationBloc get authenticationbloc =>
      context.read<AuthenticationBloc>();

  final _formKey = GlobalKey<FormState>();
  String? _id;
  String? _contact;
  String? _email;
  String? _name;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocSelector<AuthenticationBloc, AuthenticationState, AuthenticationStateStatus>(
        selector: (state) {
          return state.status;
        }, builder: ((context, state) { 
          if (state == AuthenticationStateStatus.loadSuccess) {
            // 다음 프레임에서 페이지 이동 
            Future.microtask((){
              logger.i('Home 화면으로 이동합니다. ');
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
            });
            return Text('메인화면으로 이동합니다!');

          } else {
            return 
              Column(children: <Widget>[
              Row(children: [ExitButton()]),
              Align(
                  alignment: Alignment.center,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[ 
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight * 0.1,
                                bottom: screenHeight * 0.1),
                            child: const Image(image: AppImages.mainTruck),
                          ),
                          SizedBox(
                            width: screenWidth * 0.5,
                            child: Column(
                              children: [
                                _getTextFormFiled('ID'),
                                _getTextFormFiled('Contact'),
                                _getTextFormFiled('E-mail'),
                                _getTextFormFiled('Name'),
                              ],
                            ),
                          ),
                          SizedBox(height: 16), 

                          ElevatedButton(
                            onPressed: () => {
                              if (_formKey.currentState!.validate())
                                {
                                  _formKey.currentState!.save(),
                                  // call SignUp API
                                  authenticationbloc.add(Registration(
                                      UserEntity(
                                          userId: _id,
                                          contact: _contact,
                                          email: _email,
                                          name: _name,
                                          isLogin: false))),
                                }
                            },
                            child: Text('Sign Up!'),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                              onPressed: () => {
                                    authenticationbloc.add(GuestLoginEvent()),
                                  },
                              child: Text('Guest'))
                        ],
                      ))),
            ]);
          };
        }));
  }

  TextFormField _getTextFormFiled(String formText) {
    return  TextFormField (
      decoration: InputDecoration(
        labelText: formText ,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: AppColors.black
        ),
      ),validator: (value) {
          if (value == null || value == '') {
            return '$formText를 입력해주세요.';
          }
          return null;
        },
        onSaved: (value) {
          _id = value;
        },
    );
  }
}