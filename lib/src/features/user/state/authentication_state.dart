import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:theme_freight_ui/src/settings/logger.dart';
import 'package:theme_freight_ui/src/features/user/model/user_entity.dart';

enum AuthenticationStateStatus { initial, loading, loadSuccess, loadFailure }

class AuthenticationState extends Equatable {
  final AuthenticationStateStatus status;
  final UserEntity userEntity; 
  final Exception? error;

  const AuthenticationState({
    this.status = AuthenticationStateStatus.initial,
    this.userEntity = const UserEntity(),
    this.error,
  });

  @override
  List<Object?> get props => [status, userEntity, error];

  AuthenticationState initial() {
    return copyWith(status: AuthenticationStateStatus.initial);
  }

  AuthenticationState asLoading() {
    return copyWith(status: AuthenticationStateStatus.loading);
  }

  AuthenticationState asLoadFailure(Exception e) {
    return copyWith(status: AuthenticationStateStatus.loadFailure, error: e);
  }

  AuthenticationState asLoadSuccess() {
    return copyWith(status: AuthenticationStateStatus.loadSuccess);
  }

  AuthenticationState copyWith( {AuthenticationStateStatus? status, UserEntity? userEntity, Exception? error
  }) 
  {
    return AuthenticationState(
        status: status ?? this.status,
        userEntity: userEntity ?? this.userEntity,
        error: error ?? this.error);
  }

}
