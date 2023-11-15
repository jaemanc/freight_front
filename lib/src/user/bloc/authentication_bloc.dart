import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_freight_ui/src/common/logger.dart';
import 'package:theme_freight_ui/src/user/event/authentication_event.dart';
import 'package:theme_freight_ui/src/user/model/user_entity.dart';
import 'package:theme_freight_ui/src/user/repository/authentication_repository.dart';
import 'package:theme_freight_ui/src/user/state/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc(this._authenticationRepository)
      : super(InitAuthenticationBloc()) {
    on<Login>(_login);
    on<Registration>(_registration);
  }

  void _defaultLoadAuthenticationEvent() {
    logger.d(state.userEntity);
  }

  void _login(Login event, Emitter<AuthenticationState> emit) async {
    //_authenticationRepository.registration(state.userEntity);
  }

  void _nonMemberRegistration() {}

  void _registration(
      Registration event, Emitter<AuthenticationState> emit) async {
    try {
      emit(state.asLoading());
      var data = await _authenticationRepository.registration(event.userEntity);

      if (data.isLogin == true) {
        emit(state.asLoadSuccess(data));

        logger.d(' STATUS 변경값 체크  :  ${state.userEntity} / status : ${state.status}');
      } else {
        emit(state.asLoadFailure(Exception('REGISTRATION FAIL')));
      }
    } on Exception catch (e, stackTrace) {
      logger.e('$e $stackTrace');
      emit(state.asLoadFailure(e));
    }
  }
}

class InitAuthenticationBloc extends AuthenticationState {
  //InitAuthenticationBloc(super.status, super.userEntity, super.error);
}
