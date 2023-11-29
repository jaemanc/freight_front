import 'dart:convert';

import 'package:intl/intl.dart';
class UserEntity {
  final String? userId;
  final String? contact;
  final DateTime? createdAt;
  final String? email;
  final String? name;
  final String? extra;
  final bool? isLogin;
    
  const UserEntity({
    this.userId,
    this.contact,
    this.createdAt,
    this.email, 
    this.name,
    this.extra,
    this.isLogin
});

  @override
  String toString() {
    return 'UserEntity{userId: $userId, contact: $contact, createdAt: $createdAt, email: $email, name: $name, extra: $extra, isLogin: $isLogin}';
  }

  UserEntity.fromJson(Map<String, dynamic> json)
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
      // 'createdAt': DateFormat("yyyy-MM-dd").format(createdAt ?? DateTime.now()),
      'email': email,
      'extra': extra,
      'name': name,
      'isLogin': isLogin,
    };
    return jsonEncode(data);
  }

}