import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(
      {required String url, Map<String, dynamic>? query}) async {
    return dio.get(url, queryParameters: query);
  }

  Future<Response> postData(
      {required String url, Map<String, dynamic>? body}) async {
    return dio.post(url, data: body);
  }
}
