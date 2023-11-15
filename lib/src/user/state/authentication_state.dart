import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:theme_freight_ui/src/common/logger.dart';
import 'package:theme_freight_ui/src/user/model/user_entity.dart';

enum AuthenticationStateStatus { initial, loading, loadSuccess, loadFailure }

class AuthenticationState extends Equatable {
  AuthenticationStateStatus status;
  UserEntity userEntity;
  Exception? error;

  AuthenticationState({
    this.status = AuthenticationStateStatus.initial,
    this.userEntity = const UserEntity(),
    this.error,
  });

  @override
  List<Object?> get props => [];

  AuthenticationState initial() {
    return copyWith(status: AuthenticationStateStatus.initial);
  }

  AuthenticationState asLoading() {
    return copyWith(status: AuthenticationStateStatus.loading);
  }

  AuthenticationState asLoadSuccess(UserEntity entity) {
    status = AuthenticationStateStatus.loadSuccess;
    userEntity = entity;

    return copyWith(
        status: AuthenticationStateStatus.loadSuccess, userEntity: entity);
  }

  AuthenticationState asLoadFailure(Exception e) {
    return copyWith(status: AuthenticationStateStatus.loadFailure, error: e);
  }

  AuthenticationState copyWith(
      {AuthenticationStateStatus? status,
      UserEntity? userEntity,
      Exception? error}) {
    // 새로운 AuthenticationState를 리턴하게 된다...
    return AuthenticationState(
        status: status ?? this.status,
        userEntity: userEntity ?? this.userEntity,
        error: error ?? this.error);
  }
}
