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
    return copyWith(AuthenticationStateStatus.loading);
  }

  AuthenticationState asLoadSuccess(UserEntity entity) {
    copyWith(status: AuthenticationStateStatus.loadSuccess, userEntity: entity);

    logger.f('스테이트 바뀌었나? $userEntity , 아니 여긴 값이 있는디 ..?  $entity');

    return this;
  }

  AuthenticationState asLoadFailure(Exception e) {
    return copyWith(status: AuthenticationStateStatus.loadFailure, error: e);
  }

  AuthenticationState copyWith({AuthenticationStateStatus? status, UserEntity? userEntity, Exception? error}) {
    this.status = status!;
    this.userEntity = userEntity!;
    error ?? (this.error = error);

    return AuthenticationState();
  }
}
