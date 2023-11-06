import 'package:flutter/material.dart';
import 'package:theme_freight_ui/src/common/images.dart';
import 'package:theme_freight_ui/src/common/logger.dart';

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
}

class SignUpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _formKey = GlobalKey<FormState>();
  String? _id;
  String? _contact;
  String? _email;
  String? _name;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: screenHeight* 0.1, bottom: screenHeight * 0.1),
              child: const Image(image: AppImages.mainTruck),
              
            ),
            SizedBox(
              width: screenWidth * 0.5,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'ID'),
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
                    decoration: InputDecoration(labelText: 'Contact'),
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
                    decoration: InputDecoration(labelText: 'E-mail'),
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
                    decoration: InputDecoration(labelText: 'Name'),
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
            ElevatedButton(
              onPressed: () => {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save(),
                  logger.d('id : ${_id} / contact : ${_contact} / email : ${_email} / name : ${_name}' )
                  // SignUp API
                  
                }
              },
               child: Text('Sign Up!')
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () => {
              // Guest login API
            },
            child: Text('Guest'))
          ],
        )
      )
    );
  }

}