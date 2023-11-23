import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:theme_freight_ui/src/settings/client.dart';
import 'package:theme_freight_ui/src/settings/logger.dart';
import 'package:theme_freight_ui/src/common/util.dart';
import 'package:theme_freight_ui/src/features/user/model/user_entity.dart';

abstract class AuthenticationRepository {
  Future<UserEntity> login(UserEntity userEntity);
  Future<UserEntity> registration(UserEntity userEntity);
  Future<UserEntity> guestLogin();
}

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final _client = APIClient();
  AuthenticationRepositoryImpl();
  Util util = Util();


  @override
  Future<UserEntity> registration(UserEntity userEntity) async {
    final response = await _client.post('/api/v1/user/registration', body: userEntity.toJson());
    final status = response.statusCode;
    bool loginFlag = false;
    if (status == HttpStatus.created) {
      loginFlag = true;
    }

    Map<String, dynamic> resultData = jsonDecode(utf8.decode(response.bodyBytes));
    resultData["isLogin"] = loginFlag;

    userEntity = UserEntity.fromJson(resultData);

    logger.d('''
      [POST]     : /api/v1/user/registration
      [REQ BODY] : ${userEntity.toJson()}
      [STATUS]   : $status
      [RESPONSE] : $resultData
      [RES_HEAD] : ${response.headers}
      [RESULT]   : ${userEntity.toJson()}
      [TOKEN]    : ${response.headers['authorization']}
      ''');
    
    String token = response.headers['authorization'].toString();
    util.tokenSetter(token);

    return userEntity;
  }

  @override
  Future<UserEntity> login(UserEntity userEntity) {
    // TODO: implement login
    throw UnimplementedError();
  }
  
  @override
  Future<UserEntity> guestLogin() async {
    
    final response = await _client.post('/api/v1/user/non-member-registration');
    final status = response.statusCode;
    bool loginFlag = false;

    if (status == HttpStatus.created) {
      loginFlag = true;
    }
      
    Map<String, dynamic> resultData = jsonDecode(utf8.decode(response.bodyBytes));
    resultData["isLogin"] = loginFlag;

    UserEntity userEntity = UserEntity.fromJson(resultData);

    logger.d('''
      [POST]     : /api/v1/user/non-member-registration
      [REQ BODY] : ${userEntity.toJson()}
      [STATUS]   : $status
      [RESPONSE] : $resultData
      [RES_HEAD] : ${response.headers}
      [RESULT]   : ${userEntity.toJson()}
      [TOKEN]    : ${response.headers['authorization']}
      ''');

    String token = response.headers['authorization'].toString();
    util.tokenSetter(token);

    return userEntity;
  }
}
