import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(
      {required String url, Map<String, dynamic>? query, String? token}) async {
    dio.options.headers = {'token': token};

    return dio.get(url, queryParameters: query);
  }

  Future<Response> postData(
      {required String url, Map<String, dynamic>? body, String? token}) async {
    dio.options.headers = {'token': token};
    return dio.post(url, data: body);
  }

  Future<Response> putData({
    required String url,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    dio.options.headers = {'token': token};
    return dio.put(url, data: body);
  }

  Future<Response> deleteData(
      {Map<String, dynamic>? body,
      required String url,
      required String token}) async {
    dio.options.headers = {'token': token};
    return dio.delete(
      url,
      data: body,
    );
  }
}
