import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/api/dto/create_session_dto.dart';
import 'package:cicoffee_app/api/dto/create_team_dto.dart';
import 'package:cicoffee_app/api/dto/team_dto.dart';
import 'package:cicoffee_app/api/exception/api_exception.dart';
import 'package:cicoffee_app/service/session.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

part 'team_store.g.dart';

class TeamStore = _TeamStore with _$TeamStore;

abstract class _TeamStore with Store {
  final ApiClient apiClient;
  final Session session;

  _TeamStore({@required this.apiClient, @required this.session}) {
    loadTeams();
  }

  @observable
  bool loading = false;

  @observable
  List<TeamDto> teams = List.empty();

  @action
  Future loadTeams() async {
    loading = true;
    teams = await apiClient.teams.getTeams();
    final currentMember = await session.getMember();
    teams.forEach((element) {
      element.currentMemberIsCreator = currentMember.id == element.creator.id;
    });
    loading = false;
  }

  @action
  Future addTeam(String name) async {
    loading = true;
    try {
      await apiClient.teams.createTeam(CreateTeamDto(name: name));
    } on ApiError catch (apiError) {
      print(apiError.errorCode);
    }
    loadTeams();
  }

  @action
  Future removeTeam(TeamDto team) async {
    loading = true;
    try {
      await apiClient.teams.deleteTeam(team.id);
    } on ApiError catch (apiError) {
      print(apiError);
    }
    loadTeams();
  }

  @action
  Future leaveTeam(TeamDto team) async {
    loading = true;
    try {
      await apiClient.teams.leaveTeam(team.id);
    } on ApiError catch (apiError) {
      print(apiError);
    }
    loadTeams();
  }
}