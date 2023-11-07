import 'dart:convert';

import 'package:intl/intl.dart';
class LoginEntity {
  final String userId;
  final String contact;
  final DateTime createdAt;
  final String email;
  final String name;
  final String extra;
  final bool isLogin;

  const LoginEntity(
    {
      required this.userId,
      required this.contact,
      required this.createdAt,
      required this.email, 
      required this.name, 
      required this.extra,
      required this.isLogin
    }
  );

  LoginEntity.fromJson(Map<String, dynamic> json)
      : contact = json['contact'] as String? ?? '',
        createdAt = DateTime.parse(json['createdAt']),
        email = json['email'] as String? ?? '',
        extra = json['extra'] as String? ?? '',
        name = json['name'] as String? ?? '',
        userId = json['userId'] as String? ?? '',
        isLogin = json['isLogin'] as bool? ?? false;

  String toJson({bool encode = true}) {
    final Map<String, dynamic> data = {
      'contact': contact,
      'userId': userId,
      'createdAt': DateFormat("yyyy-MM-dd").format(createdAt ?? DateTime.now()),
      'email': email,
      'extra': extra,
      'name': name,
      'isLogin': isLogin,
    };
    return jsonEncode(data);
  }

}