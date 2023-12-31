import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_freight_ui/src/common/ui/exit_button.dart';
import 'package:theme_freight_ui/src/common/ui/home_screen.dart';
import 'package:theme_freight_ui/src/features/user/model/user_enums.dart';
import 'package:theme_freight_ui/src/settings/images.dart';
import 'package:theme_freight_ui/src/settings/logger.dart';
import 'package:theme_freight_ui/src/settings/theme/colors.dart';
import 'package:theme_freight_ui/src/features/user/bloc/authentication_bloc.dart';
import 'package:theme_freight_ui/src/features/user/event/authentication_event.dart';
import 'package:theme_freight_ui/src/features/user/model/user_entity.dart';
import 'package:theme_freight_ui/src/features/user/state/authentication_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _signUpState();
}

class _signUpState extends State<SignUp> {

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
                                _getTextFormFiled('ID',SignUpEnum.id),
                                _getTextFormFiled('Contact',SignUpEnum.contact),
                                _getTextFormFiled('E-mail',SignUpEnum.email),
                                _getTextFormFiled('Name',SignUpEnum.name),
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

  TextFormField _getTextFormFiled(String formText, SignUpEnum target) {
    return  TextFormField (
      decoration: InputDecoration(
        labelText: formText ,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: AppColors.black
        ),
      ),
      validator: (value) {
        if (value == null || value == '') {
          return '$formText를 입력해주세요.';
        }
        return null;
      },
      onSaved: (value) {
        if (target == SignUpEnum.id) {
          _id = value;
        } else if (target == SignUpEnum.contact) {
          _contact = value;
        } else if (target == SignUpEnum.email) {
          _email = value;
        } else if (target == SignUpEnum.name) {
          _name = value;
        }
      },
    );
  }
}