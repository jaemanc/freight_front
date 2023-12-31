import 'package:equatable/equatable.dart';
import 'package:theme_freight_ui/src/features/user/model/user_entity.dart';
import 'package:theme_freight_ui/src/settings/logger.dart';
import 'package:theme_freight_ui/src/features/user/state/authentication_state.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class DefaultLoadAuthenticationEvent extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  final String name;
  final String email;
  final String token;
  LoginEvent(this.name, this.email, this.token);
  @override
  List<Object?> get props => [name, email, token];
}

class NonMemberRegistration extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class Registration extends AuthenticationEvent {
  final UserEntity userEntity;
  Registration(this.userEntity);

  @override
  List<Object?> get props => [userEntity ];
}

class Refresh extends AuthenticationEvent {
  Refresh();
  @override
  List<Object?> get props => [];
}

class GuestLoginEvent extends AuthenticationEvent {
  GuestLoginEvent();
  
  @override
  List<Object?> get props => [];

}

class Init extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}