// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SessionStore on _SessionStore, Store {
  Computed<List<SessionDto>> _$incomingSessionsComputed;

  @override
  List<SessionDto> get incomingSessions => (_$incomingSessionsComputed ??=
          Computed<List<SessionDto>>(() => super.incomingSessions,
              name: '_SessionStore.incomingSessions'))
      .value;
  Computed<List<SessionDto>> _$ongoingSessionsComputed;

  @override
  List<SessionDto> get ongoingSessions => (_$ongoingSessionsComputed ??=
          Computed<List<SessionDto>>(() => super.ongoingSessions,
              name: '_SessionStore.ongoingSessions'))
      .value;
  Computed<List<SessionDto>> _$pastSessionsComputed;

  @override
  List<SessionDto> get pastSessions => (_$pastSessionsComputed ??=
          Computed<List<SessionDto>>(() => super.pastSessions,
              name: '_SessionStore.pastSessions'))
      .value;

  final _$loadingAtom = Atom(name: '_SessionStore.loading');

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

  final _$sessionsAtom = Atom(name: '_SessionStore.sessions');

  @override
  List<SessionDto> get sessions {
    _$sessionsAtom.reportRead();
    return super.sessions;
  }

  @override
  set sessions(List<SessionDto> value) {
    _$sessionsAtom.reportWrite(value, super.sessions, () {
      super.sessions = value;
    });
  }

  final _$mutedSessionsAtom = Atom(name: '_SessionStore.mutedSessions');

  @override
  List<String> get mutedSessions {
    _$mutedSessionsAtom.reportRead();
    return super.mutedSessions;
  }

  @override
  set mutedSessions(List<String> value) {
    _$mutedSessionsAtom.reportWrite(value, super.mutedSessions, () {
      super.mutedSessions = value;
    });
  }

  final _$loadSessionsAsyncAction = AsyncAction('_SessionStore.loadSessions');

  @override
  Future<dynamic> loadSessions() {
    return _$loadSessionsAsyncAction.run(() => super.loadSessions());
  }

  final _$createSessionAsyncAction = AsyncAction('_SessionStore.createSession');

  @override
  Future<dynamic> createSession(
      TeamDto team, DateTime startDate, DateTime endDate) {
    return _$createSessionAsyncAction
        .run(() => super.createSession(team, startDate, endDate));
  }

  final _$muteSessionAsyncAction = AsyncAction('_SessionStore.muteSession');

  @override
  Future<dynamic> muteSession(SessionDto session) {
    return _$muteSessionAsyncAction.run(() => super.muteSession(session));
  }

  final _$confirmAsyncAction = AsyncAction('_SessionStore.confirm');

  @override
  Future<dynamic> confirm(SessionDto session) {
    return _$confirmAsyncAction.run(() => super.confirm(session));
  }

  final _$retractAsyncAction = AsyncAction('_SessionStore.retract');

  @override
  Future<dynamic> retract(SessionDto session) {
    return _$retractAsyncAction.run(() => super.retract(session));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
sessions: ${sessions},
mutedSessions: ${mutedSessions},
incomingSessions: ${incomingSessions},
ongoingSessions: ${ongoingSessions},
pastSessions: ${pastSessions}
    ''';
  }
}
