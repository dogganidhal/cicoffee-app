import 'package:cicoffee_app/api/client/http_client.dart';
import 'package:cicoffee_app/api/dto/token_dto.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:cicoffee_app/api/dto/login_dto.dart';
import 'package:cicoffee_app/api/dto/refresh_dto.dart';


class AuthApiClient extends HttpClient {
  AuthApiClient({@required Dio dio}) : super(dio: dio);

  Future<TokenDto> login(LoginDto request) async {
    final data = extractData(await post("/api/auth/login", data: request));
    return TokenDto.fromJson(data);
  }

  Future<TokenDto> refresh(RefreshDto request) async {
    final data = extractData(await post("/api/auth/refresh", data: request));
    return TokenDto.fromJson(data);
  }
}
