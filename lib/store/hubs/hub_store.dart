import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/api/dto/create_team_dto.dart';
import 'package:cicoffee_app/api/dto/team_dto.dart';
import 'package:cicoffee_app/api/exception/api_exception.dart';
import 'package:cicoffee_app/service/session.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

part 'hub_store.g.dart';

class HubStore = _HubStore with _$HubStore;

abstract class _HubStore with Store {
  final ApiClient apiClient;
  final Session session;

  _HubStore({@required this.apiClient, @required this.session}) {
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
}
