import 'package:cicoffee_app/api/client/http_client.dart';
import 'package:cicoffee_app/api/dto/create_order_dto.dart';
import 'package:cicoffee_app/api/dto/create_session_dto.dart';
import 'package:cicoffee_app/api/dto/order_dto.dart';
import 'package:cicoffee_app/api/dto/session_dto.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


class SessionsApiClient extends HttpClient {
  SessionsApiClient({@required Dio dio}) : super(dio: dio);

  Future<SessionDto> createSession(CreateSessionDto request) async {
    final data = await post("/api/session", data: request);
    return SessionDto.fromJson(data);
  }

  Future<List<SessionDto>> getMemberSessions() async {
    final data = await get("/api/session");
    return (data as List)
        .map((item) => SessionDto.fromJson(item))
        .toList();
  }

  Future<SessionDto> confirmParticipation(String sessionId) async {
    final data = await post("/api/session/$sessionId/confirm-participation");
    return SessionDto.fromJson(data);
  }

  Future<SessionDto> retractParticipation(String sessionId) async {
    final data = await post("/api/session/$sessionId/retract-participation");
    return SessionDto.fromJson(data);
  }

  Future<OrderDto> order(CreateOrderDto request) async {
    final data = await post("/api/session/order", data: request);
    return OrderDto.fromJson(data);
  }

  Future<List<OrderDto>> getOrders(String sessionId) async {
    final data = await get("/api/session/order");
    return (data as List)
        .map((item) => OrderDto.fromJson(item))
        .toList();
  }
}
