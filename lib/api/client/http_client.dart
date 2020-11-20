import 'package:cicoffee_app/api/exception/api_exception.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';


abstract class HttpClient {
  final Dio dio;

  HttpClient({@required this.dio});

  Future<dynamic> delete(String url, {Map<String, dynamic> queryParams}) async {
    try {
      final response = await dio.delete(url, queryParameters: queryParams);
      return response.data;
    } on DioError catch (dioError) {
      _catchException(dioError);
    }
  }

  Future<dynamic> get(String url, {Map<String, dynamic> queryParams}) async {
    try {
      final response = await dio.get(url, queryParameters: queryParams);
      return response.data;
    } on DioError catch (dioError) {
      _catchException(dioError);
    }
  }

  Future<dynamic> post<T>(String url, {Map<String, dynamic> queryParams, data}) async {
    try {
      final response = await dio.post(url, queryParameters: queryParams, data: data);
      return response.data;
    } on DioError catch (dioError) {
      _catchException(dioError);
    }
  }

  Future<dynamic> put(String url, {Map<String, dynamic> queryParams, data}) async {
    try {
      final response = await dio.put(url, queryParameters: queryParams, data: data);
      return response.data;
    } on DioError catch (dioError) {
      _catchException(dioError);
    }
  }

  @alwaysThrows
  void _catchException(DioError dioError) {
    throw ApiError.fromDioError(dioError);
  }
}
