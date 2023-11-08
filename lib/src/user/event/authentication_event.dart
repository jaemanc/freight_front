abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticationLoadStarted extends AuthenticationEvent {
  final bool loadAll;
  const AuthenticationLoadStarted({this.loadAll = false});
}
