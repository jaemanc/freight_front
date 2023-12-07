import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:theme_freight_ui/src/common/util.dart';
import 'package:theme_freight_ui/src/features/user/model/user_entity.dart';
import 'package:theme_freight_ui/src/features/user/screen/signup_screen.dart';
import 'package:theme_freight_ui/src/settings/logger.dart';

class APIClient {
  final util = Util();
  final host = dotenv.get('API_HOST');
  Uri getUri(String unencodedPath, { Map<String, dynamic>? queryParameters } ){
    
    return Uri.http(
        host,
        unencodedPath,
        queryParameters
    );
  }

  Future<Map<String, String>> headers() async {
    final FlutterSecureStorage storage = FlutterSecureStorage();

    String token = '';
    util.tokenGetter().then((value) {
      token = value.toString();
    });
    
    logger.i('request tkn : $token');

    return {
      'Authorization': token,
      'Content-Type': 'application/json',
      'accept': '*/*',
      'Accept-Charset': 'utf-8'
    };
  }

  Future<http.Response> get(String endpoint, { Map<String, dynamic>? queryParameters }) async {
      http.Response res =
      await http.get(
          getUri(
            endpoint,
            queryParameters: queryParameters,
          ),
          headers: await headers()
      );

      return res;
  }

  Future<http.Response> post(String endpoint, {Object? body}) async {
    http.Response res = 
    await http.post(
      getUri(
        endpoint,
      ),
      headers: await headers(),
      body: body
    );
    return res;
  }

  Future<http.Response> login(String endpoint, {Object? body, String? token} ) async {
    http.Response res = 
    await http.post(
      getUri(
        endpoint,
      ),
      headers: {
        'Authorization': token!,
        'Content-Type': 'application/json',
        'accept': '*/*',
        'Accept-Charset': 'utf-8'
      },
      body: body
    );
    return res;
  }

  Future<http.Response> put(String endpoint, {Object? body}) async {
    http.Response res =
    await http.put(
        getUri(
          endpoint,
        ),
        headers: await headers(),
        body: body
    );
    return res;
  }

  Future<http.Response> delete(String endpoint, {Object? body}) async {
    http.Response res =
    await http.delete(
        getUri(
          endpoint,
        ),
        headers: await headers(),
        body: body
    );
    return res;
  }

}