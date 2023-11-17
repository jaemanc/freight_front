import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_freight_ui/src/common/logger.dart';
import 'package:theme_freight_ui/src/user/event/authentication_event.dart';
import 'package:theme_freight_ui/src/user/repository/authentication_repository.dart';
import 'package:theme_freight_ui/src/user/state/authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  final _authenticationController = StreamController<AuthenticationState>();
  Stream<AuthenticationState> get authenticationStream => _authenticationController.stream;

  AuthenticationBloc(this._authenticationRepository)
      : super(InitAuthenticationBloc()) {
    on<Login>(_login);
    on<Registration>(_registration);
    on<GuestLoginEvent>(_guestLoginEvent);
  }

  void _login(Login event, Emitter<AuthenticationState> emit) async {
    //_authenticationRepository.registration(state.userEntity);
  }

  void _guestLoginEvent(GuestLoginEvent event, Emitter<AuthenticationState> emit) async{
      try {
        emit(state.asLoading());
        final data = await _authenticationRepository.guestLogin();
        
        if (data.isLogin == true) {
          emit(state.asLoadSuccess());
        } else {
          emit(state.asLoadFailure(Exception(('GUEST LOGIN FAIL'))));
        }
      } on Exception catch(e, stackTrace) {
        logger.e('$e $stackTrace');
        emit(state.asLoadFailure(e));
      }
  }

  void _registration(Registration event, Emitter<AuthenticationState> emit) async {
    try {
      emit(state.asLoading());
      final data = await _authenticationRepository.registration(event.userEntity);

      if (data.isLogin == true) {

        emit(state.asLoadSuccess());

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
  const InitAuthenticationBloc();
}
