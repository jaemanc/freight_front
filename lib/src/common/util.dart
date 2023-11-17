import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Util {
  final storage = const FlutterSecureStorage();

  void tokenSetter(String token) async{
    storage.write(key: 'token', value: token);
    String? temp = await storage.read(key:'token');
  }

Future<String?> tokenGetter() async {
  String? token = await storage.read(key: 'token');
  return token;
}
} 