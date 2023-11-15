import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_freight_ui/src/user/bloc/authentication_bloc.dart';
import 'package:theme_freight_ui/src/user/state/authentication_state.dart';

class AuthenticationStateSelector extends BlocSelector {
  AuthenticationStateSelector({required super.selector, required super.builder});
}

class IsLoginSelector extends AuthenticationStateSelector {
  IsLoginSelector({required super.selector, required super.builder});
  
}