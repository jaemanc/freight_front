import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_freight_ui/src/common/images.dart';
import 'package:theme_freight_ui/src/common/logger.dart';
import 'package:theme_freight_ui/src/user/bloc/authentication_bloc.dart';
import 'package:theme_freight_ui/src/user/bloc/authentication_selector.dart';
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

    return BlocSelector<AuthenticationBloc, AuthenticationState, bool>(
        selector: (state) => state.userEntity.isLogin ?? false,
        builder: ((context, state) {
          logger.i(' ${state} / ${context} 빌더는 동작하나요?? ');

          return !state
              ? Column(children: <Widget>[
                  Row(children: [_exitBtn()]),
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
                                    TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'ID'),
                                      validator: (value) {
                                        if (value == null || value == '') {
                                          return 'ID를 입력해주세요.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _id = value;
                                      },
                                    ),
                                    TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'Contact'),
                                      validator: (value) {
                                        if (value == null || value == '') {
                                          return 'Contact를 입력해주세요.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _contact = value;
                                      },
                                    ),
                                    TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'E-mail'),
                                      validator: (value) {
                                        if (value == null || value == '') {
                                          return 'E-mail을 입력해주세요.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _email = value;
                                      },
                                    ),
                                    TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'Name'),
                                      validator: (value) {
                                        if (value == null || value == '') {
                                          return '이름을 입력해주세요.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _name = value;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),

                              // BlocBuilder<AuthenticationBloc, AuthenticationStateStatus>(
                              //   bloc: authenticationbloc,
                              //   builder: (context, AuthenticationStateStatus state) {
                              //     return Text('test');
                              //   },
                              // ),
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
                                        // Guest login API
                                      },
                                  child: Text('Guest'))
                            ],
                          ))),
                ])
              : const Text(' 아 제발 로그인헀다고 시발롬아 ');
        }));
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
}
