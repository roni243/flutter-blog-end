
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../_core/utils/my_http.dart';

class UserRepository {

  Future<Map<String, dynamic>> join(String username, String email, String password) async {
    final requestBody = {
      "username":username,
      "email":email,
      "password":password
    };

    Response response = await dio.post("/join", data: requestBody);
    final responseBody = response.data;
    //Logger.("회원가입응답 : $responseBody");
    return responseBody;

  }
}