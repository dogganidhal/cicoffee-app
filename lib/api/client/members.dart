import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:cicoffee_app/api/client/http_client.dart';
import 'package:cicoffee_app/api/dto/create_member_dto.dart';
import 'package:cicoffee_app/api/dto/create_mobile_device_dto.dart';
import 'package:cicoffee_app/api/dto/member_dto.dart';


class MembersApiClient extends HttpClient {
  MembersApiClient({@required Dio dio}) : super(dio: dio);

  Future registerDevice(CreateMobileDeviceDto request) async {
    await post("/api/member/device", data: request);
  }

  Future<MemberDto> getMember() async {
    final data = await get("/api/member");
    return MemberDto.fromJson(data);
  }

  Future<MemberDto> signUp(CreateMemberDto request) async {
    final data = await post("/api/member", data: request);
    return MemberDto.fromJson(data);
  }

  Future unregisterDevice(String identifier) async {
    await get("/api/member/device/$identifier");
  }
}
