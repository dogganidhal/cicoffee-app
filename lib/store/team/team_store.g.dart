// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TeamStore on _TeamStore, Store {
  final _$loadingAtom = Atom(name: '_TeamStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$teamsAtom = Atom(name: '_TeamStore.teams');

  @override
  List<TeamDto> get teams {
    _$teamsAtom.reportRead();
    return super.teams;
  }

  @override
  set teams(List<TeamDto> value) {
    _$teamsAtom.reportWrite(value, super.teams, () {
      super.teams = value;
    });
  }

  final _$loadTeamsAsyncAction = AsyncAction('_TeamStore.loadTeams');

  @override
  Future<dynamic> loadTeams() {
    return _$loadTeamsAsyncAction.run(() => super.loadTeams());
  }

  final _$addTeamAsyncAction = AsyncAction('_TeamStore.addTeam');

  @override
  Future<dynamic> addTeam(String name) {
    return _$addTeamAsyncAction.run(() => super.addTeam(name));
  }

  final _$removeTeamAsyncAction = AsyncAction('_TeamStore.removeTeam');

  @override
  Future<dynamic> removeTeam(TeamDto team) {
    return _$removeTeamAsyncAction.run(() => super.removeTeam(team));
  }

  final _$leaveTeamAsyncAction = AsyncAction('_TeamStore.leaveTeam');

  @override
  Future<dynamic> leaveTeam(TeamDto team) {
    return _$leaveTeamAsyncAction.run(() => super.leaveTeam(team));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
teams: ${teams}
    ''';
  }
}
