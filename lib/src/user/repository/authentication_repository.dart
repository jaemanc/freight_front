import 'package:theme_freight_ui/src/user/model/LoginEntity.dart';
import 'package:theme_freight_ui/src/user/screen/loginScreen.dart';

abstract class AuthenticationRepository {
  Future<LoginEntity> login(LoginEntity loginEntity);
  Future<List<String>> nonMemberRegistration();
  Future<LoginEntity> Registration(LoginEntity loginEntity);
}

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl();
  
  @override
  Future<List<String>> Registration(LoginEntity loginEntity) {
    // TODO: implement Registration
    throw UnimplementedError();
  }
  
  @override
  Future<LoginEntity> login() {
    // TODO: implement login
    throw UnimplementedError();
  }
  
  @override
  Future<List<String>> nonMemberRegistration() {
    // TODO: implement nonMemberRegistration
    throw UnimplementedError();
  }


}