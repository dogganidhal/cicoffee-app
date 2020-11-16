import 'package:cicoffee_app/api/client/auth.dart';
import 'package:cicoffee_app/api/client/members.dart';
import 'package:cicoffee_app/api/client/products.dart';
import 'package:cicoffee_app/api/client/sessions.dart';
import 'package:cicoffee_app/api/client/teams.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient({@required this.dio});

  MembersApiClient get members => MembersApiClient(dio: dio);
  SessionsApiClient get sessions => SessionsApiClient(dio: dio);
  TeamsApiClient get teams => TeamsApiClient(dio: dio);
  AuthApiClient get auth => AuthApiClient(dio: dio);
  ProductsApiClient get products => ProductsApiClient(dio: dio);
}
