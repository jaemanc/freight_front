import 'dart:convert';

import 'package:theme_freight_ui/src/common/client.dart';
import 'package:theme_freight_ui/src/common/logger.dart';
import 'package:theme_freight_ui/src/user/model/user_entity.dart';
import 'package:theme_freight_ui/src/user/screen/login_screen.dart';

abstract class AuthenticationRepository {
  Future<LoginEntity> login(LoginEntity loginEntity);
  Future<LoginEntity> nonMemberRegistration();
  Future<LoginEntity> registration(LoginEntity loginEntity);
}

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final _client = APIClient();
  AuthenticationRepositoryImpl();

  @override
  Future<LoginEntity> registration(LoginEntity loginEntity) async {
    final response =
        await _client.post('/api/v1/user/registration', loginEntity);
    final status = response.statusCode;
    final resultData = jsonDecode(utf8.decode(response.bodyBytes));

    logger.d('[POST] /api/v1/user/registration');
    logger.d('[REQ BODY] $loginEntity');
    logger.d('[STATUS] $status');
    logger.d('[RESPONSE] $resultData');
    logger.d('TEST :::  $LoginEntity.fromJson(resultData');

    return LoginEntity.fromJson(resultData);
  }

  @override
  Future<LoginEntity> login(LoginEntity loginEntity) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<LoginEntity> nonMemberRegistration() {
    // TODO: implement nonMemberRegistration
    throw UnimplementedError();
  }
}
