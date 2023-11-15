import 'dart:convert';
import 'dart:io';

import 'package:theme_freight_ui/src/common/client.dart';
import 'package:theme_freight_ui/src/common/logger.dart';
import 'package:theme_freight_ui/src/user/model/user_entity.dart';

abstract class AuthenticationRepository {
  Future<UserEntity> login(UserEntity userEntity);
  Future<UserEntity> nonMemberRegistration();
  Future<UserEntity> registration(UserEntity userEntity);
}

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final _client = APIClient();
  AuthenticationRepositoryImpl();

  @override
  Future<UserEntity> registration(UserEntity userEntity) async {
    final response = await _client.post('/api/v1/user/registration',
        body: userEntity.toJson());
    final status = response.statusCode;

    if (status != HttpStatus.created) {
      logger.d('''
        [REQ BODY] : ${userEntity.toString()} 
        [STATUS]   : $status
      ''');

      userEntity.isLogin == false;
      return userEntity;
    }

    Map<String, dynamic> resultData = jsonDecode(utf8.decode(response.bodyBytes));
    resultData["isLogin"] = true;

    userEntity = UserEntity.fromJson(resultData);

    logger.d('''
      [POST]     : /api/v1/user/registration
      [REQ BODY] : ${userEntity.toJson()}
      [STATUS]   : $status
      [RESPONSE] : $resultData
      [RES_HEAD] : ${response.headers}
      [RESULT]   : ${userEntity.toJson()}
      ''');

    return userEntity;
  }

  @override
  Future<UserEntity> login(UserEntity userEntity) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> nonMemberRegistration() {
    // TODO: implement nonMemberRegistration
    throw UnimplementedError();
  }
}
