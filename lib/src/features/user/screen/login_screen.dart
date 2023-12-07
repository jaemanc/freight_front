import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theme_freight_ui/src/common/ui/exit_button.dart';
import 'package:theme_freight_ui/src/common/ui/home_screen.dart';
import 'package:theme_freight_ui/src/features/user/bloc/authentication_bloc.dart';
import 'package:theme_freight_ui/src/features/user/event/authentication_event.dart';
import 'package:theme_freight_ui/src/features/user/model/user_enums.dart';
import 'package:theme_freight_ui/src/features/user/state/authentication_state.dart';
import 'package:theme_freight_ui/src/settings/theme/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _loginScreen();

}

class _loginScreen extends State<LoginScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  AuthenticationBloc get authenticationbloc => context.read<AuthenticationBloc>();

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _token = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(children: <Widget>[
        Row(
          children: [ExitButton()],
        ),
        Align(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    ElevatedButton(onPressed :() {
                      _showUserTokenGuidePopup(context);
                    }, child: Text('사용자 Token?'))
                  ]
                ),
                SizedBox(
                  width: screenWidth*0.5,
                  child: Column(
                    children: [
                      _getTextFormFiled('이름', LoginEnum.name),
                      _getTextFormFiled('E-mail', LoginEnum.email),
                      _getTextFormFiled('사용자 Token', LoginEnum.token),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                BlocSelector<AuthenticationBloc, AuthenticationState, AuthenticationStateStatus> (
                  selector: (state) {
                    return state.status;
                  }, builder: ((context, state) { 
                    if (state == AuthenticationStateStatus.loadSuccess) {
                      Future.microtask(()  {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                      });
                      return Text('메인화면으로 이동합니다!');
                    } else if (state == AuthenticationStateStatus.loadFailure) {
                      // login 실패
                      _showToast();
                      return SizedBox(
                        child: ElevatedButton(
                          onPressed: () => {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save(),
                              //Call Login API
                              authenticationbloc.add(LoginEvent(
                                _name, _email, _token,
                              )),
                            }
                          },
                          child: Text('Login'),
                        ),
                      );
                    }
                    return ElevatedButton(
                          onPressed: () => {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save(),
                              //Call Login API
                              authenticationbloc.add(LoginEvent(
                                _name, _email, _token,
                              )),
                            }
                          },
                          child: Text('Login'),
                        );
                   }),
                ),
              ],
            ),
          )
        )
      ],
    
      ),
    );
  }

  void _showToast() {
    Fluttertoast.showToast(
      msg: '로그인 실패',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      webBgColor: "#e74c3c",
      webPosition: "center",
      fontSize: 16.0,
    );
  }

  TextFormField _getTextFormFiled(String formText, LoginEnum target) {
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
        if (target == LoginEnum.name) {
          _name = value?? '';
        } else if (target == LoginEnum.email) {
          _email = value?? '';
        } else if (target == LoginEnum.token) {
          _token = value?? '';
        }
      },
    );
  }

  void _showUserTokenGuidePopup(BuildContext context) {
    showDialog(
      context: context,
       builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              SizedBox(width: 14),
              Text('사용자 토큰 확인'),
            ],
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(' * 주의 * \r\n 기존 사용자 기기에서 새로운 기기로 데이터를 이전하고 싶은 경우에만 로그인을 해주세요.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              Text('사용자 토큰은 기존에 사용하던 기기의 환경설정 - 사용자 토큰 가져오기 버튼을 통해 확인 할 수 있습니다.',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),)
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('닫기'),
            )
          ]
        );
       }
    );

  }

}

