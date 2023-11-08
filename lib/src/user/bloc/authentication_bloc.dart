import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_freight_ui/src/user/event/authentication_event.dart';
import 'package:theme_freight_ui/src/user/repository/authentication_repository.dart';
import 'package:theme_freight_ui/src/user/state/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc(this._authenticationRepository)
      : super(InitAuthenticationState()) {
    on<AuthenticationLoadStarted>(_authenticationLoadStarted);
  }

  void _authenticationLoadStarted(AuthenticationLoadStarted event, Emitter<AuthenticationState> emit) async {
    try {
      emit(state.)
    }
  }

}
