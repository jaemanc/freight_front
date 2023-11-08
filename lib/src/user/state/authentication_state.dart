import 'package:equatable/equatable.dart';
import 'package:theme_freight_ui/src/user/model/user_entity.dart';

abstract class AuthenticationState extends Equatable {
  final UserEntity? userEntity;
  final Exception? error;

  const AuthenticationState({this.userEntity, this.error});

}

class InitAuthenticationState extends AuthenticationState {
  const InitAuthenticationState() : super(userEntity: null, error: null);

  @override
  List<Object?> get props => [userEntity, error];
}

class LoadingAuthenticationState extends AuthenticationState {
  const LoadingAuthenticationState({super.userEntity});

  @override
  List<Object?> get props => [userEntity];
}

class LoadedAuthenticationState extends AuthenticationState {
  const LoadedAuthenticationState({super.userEntity});

  @override
  List<Object?> get props => [userEntity];
}

class ErrorAuthenticationstate extends AuthenticationState {
  final String errorMsg;
  const ErrorAuthenticationstate(this.errorMsg);

  @override
  List<Object?> get props => [error];
}
