import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/utils/my_http.dart';
import 'package:logger/logger.dart';

import '../model/post.dart';

class PostRepository {
  Future<Map<String, dynamic>> write(String title, String content) async {
    Response response = await dio.get("/api/post", data: {
      "title" :title,
      "content" :content
    });
    final responseBody = response.data;
    Logger().d(responseBody);
    return responseBody;
  }

  Future<Map<String, dynamic>> getList({int page = 0}) async {
    Response response = await dio.get("/api/post", queryParameters: {"page": page});
    final responseBody = response.data;
    Logger().d(responseBody);
    return responseBody;
  }

  // TODO 1 : getOne(postId) 만들기 -> dio세팅후 테스트코드
  Future<Map<String, dynamic>> getOne(int postId) async {
    Response response = await dio.get("/api/post/${postId}");
    final responseBody = response.data;
    Logger().d(responseBody);
    return responseBody;
  }

  Future<Map<String, dynamic>> deleteOne(int postId) async {
    Response response = await dio.get("/api/post/${postId}");
    final responseBody = response.data;
    Logger().d(responseBody);
    return responseBody;
  }

  Future<Map<String, dynamic>> updateOne(Post post) async {
    Response response = await dio.put("/api/post/${post.id}", data: {"title": post.title, "content": post.content});
    final responseBody = response.data;
    Logger().d(responseBody);
    return responseBody;
  }

}