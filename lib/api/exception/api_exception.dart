

import 'package:dio/dio.dart';

class ApiError extends Error {
  final String status;
  final String errorCode;

  ApiError({
    this.errorCode, this.status
  });

  factory ApiError.fromDioError(DioError dioError) {
    final data = dioError.response.data;
    return ApiError(
      errorCode: data["errorCode"],
      status: data["status"]
    );
  }

}
