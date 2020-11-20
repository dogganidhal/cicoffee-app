// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hub_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HubStore on _HubStore, Store {
  final _$loadingAtom = Atom(name: '_HubStore.loading');

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

  final _$teamsAtom = Atom(name: '_HubStore.teams');

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

  final _$loadTeamsAsyncAction = AsyncAction('_HubStore.loadTeams');

  @override
  Future<dynamic> loadTeams() {
    return _$loadTeamsAsyncAction.run(() => super.loadTeams());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
teams: ${teams}
    ''';
  }
}
