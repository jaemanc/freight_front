import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

}

abstract class AuthenticationEvent extends Equatable {}

class SignUpEvent extends LoginEvent