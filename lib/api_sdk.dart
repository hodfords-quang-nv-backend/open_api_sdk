import 'package:dio/dio.dart';
import 'user_service.dart';

class ApiSdk {
  late final UserService userService;

  ApiSdk({required Dio dio}) {
    userService = UserService(dio: dio);
  }
}
