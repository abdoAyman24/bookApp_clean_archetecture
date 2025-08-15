import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(String endPoint) async {
    var Response = await _dio.get('$baseUrl$endPoint');
    return Response.data;
  }
}
