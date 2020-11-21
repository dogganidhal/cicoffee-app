import 'package:cicoffee_app/api/client/http_client.dart';
import 'package:cicoffee_app/api/dto/create_team_dto.dart';
import 'package:cicoffee_app/api/dto/team_dto.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';


class TeamsApiClient extends HttpClient {
  TeamsApiClient({@required Dio dio}) : super(dio: dio);

  Future<TeamDto> createTeam(CreateTeamDto request) async {
    final data = await post("/api/team", data: request);
    return TeamDto.fromJson(data);
  }

  Future<List<TeamDto>> getTeams() async {
    final data = await get("/api/team");
    return (data as List)
      .map((item) => TeamDto.fromJson(item))
      .toList();
  }

  Future<TeamDto> joinTeam(String teamId) async {
    final data = await post("/api/team/$teamId/join");
    return TeamDto.fromJson(data);
  }

  Future leaveTeam(String teamId) async {
    await post("/api/team/$teamId/leave");
  }

  Future deleteTeam(String teamId) async {
    await delete("/api/team/$teamId");
  }

  Future<TeamDto> addMember(String teamId, String memberId) async {
    final data = await post("/api/team/$teamId/members/$memberId");
    return TeamDto.fromJson(data);
  }
}
