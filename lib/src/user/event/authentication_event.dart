import 'package:equatable/equatable.dart';
import 'package:theme_freight_ui/src/user/model/user_entity.dart';
import 'package:theme_freight_ui/src/common/logger.dart';

abstract class AuthenticationEvent extends Equatable{
  const AuthenticationEvent();
}

class DefaultLoadAuthenticationEvent extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class Login extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class NonMemberRegistration extends AuthenticationEvent {

  @override
  List<Object?> get props => throw UnimplementedError();

}

class Registration extends AuthenticationEvent {
  final UserEntity userEntity;
  Registration(this.userEntity);

  @override
  List<Object?> get props => throw UnimplementedError();
}