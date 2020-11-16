import 'package:meta/meta.dart';
import 'package:dio/dio.dart';


abstract class HttpClient {
  final Dio dio;

  HttpClient({@required this.dio});

  Future<Response<T>> delete<T>(String url, {Map<String, dynamic> queryParams}) {
    try {
      return dio.delete(url, queryParameters: queryParams);
    } catch (exception) {
      _catchException(exception);
    }
  }

  Future<Response<T>> get<T>(String url, {Map<String, dynamic> queryParams}) {
    try {
      return dio.get(url, queryParameters: queryParams);
    } catch (exception) {
      _catchException(exception);
    }
  }

  Future<Response<T>> post<T>(String url, {Map<String, dynamic> queryParams, data}) {
    try {
      return dio.post(url, queryParameters: queryParams, data: data);
    } catch (exception) {
      _catchException(exception);
    }
  }

  Future<Response<T>> put<T>(String url, {Map<String, dynamic> queryParams, data}) {
    try {
      return dio.put(url, queryParameters: queryParams, data: data);
    } catch (exception) {
      _catchException(exception);
    }
  }

  T extractData<T>(Response<T> response) {
    if (response.statusCode >= 400) {
      // TODO(Nidhal) : Handle errors
    }
    return response.data;
  }

  @alwaysThrows
  void _catchException(Exception exception) {
    // TODO(Nidhal) : Handle errors
  }
}
