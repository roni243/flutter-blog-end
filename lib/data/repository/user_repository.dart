
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
    Logger().d("회원가입응답 : $responseBody");
    //Logger().d("username : ${username}, email : ${email}, password : ${password}");
    return responseBody;

  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    // 1. Map 변환
    final requestBody = {
      "username": username,
      "password": password,
    };

    // 2. 통신
    Response response = await dio.post("/login", data: requestBody);
    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }

  Future<Map<String, dynamic>> autoLogin(String accessToken) async {
    Response response = await dio.post(
        "/auto/login",
        options: Options(
          headers: {"Authorization" : accessToken}
        )
    );
    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }

  // Future<Map<String, dynamic>> login(String username, String password) async {
  //   //1. Map 변환
  //   final requestBody = {
  //     "username":username,
  //     "password":password
  //   };
  //
  //   //2. 통신
  //   Response response = await dio.post("/login", data: requestBody);
  //   Map<String, dynamic> responseBody = response.data;
  //
  //
  //   //3. 헤더에서 토큰을 바디로 옮기기
  //   String accessToken = "";
  //   try {
  //     accessToken = response.headers["Authorization"]![0];
  //     responseBody["response"]["accessToken"] = accessToken;
  //   } catch(e) {
  //     Logger().d(responseBody);
  //
  //   }
  //   return responseBody;
  // }
}