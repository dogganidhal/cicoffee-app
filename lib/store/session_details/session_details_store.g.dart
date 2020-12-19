// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SessionDetailsStore on _SessionDetailsStore, Store {
  final _$loadingAtom = Atom(name: '_SessionDetailsStore.loading');

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

  final _$participantsAtom = Atom(name: '_SessionDetailsStore.participants');

  @override
  List<ParticipantOrders> get participants {
    _$participantsAtom.reportRead();
    return super.participants;
  }

  @override
  set participants(List<ParticipantOrders> value) {
    _$participantsAtom.reportWrite(value, super.participants, () {
      super.participants = value;
    });
  }

  final _$loadParticipantsAsyncAction =
      AsyncAction('_SessionDetailsStore.loadParticipants');

  @override
  Future<dynamic> loadParticipants(String sessionId) {
    return _$loadParticipantsAsyncAction
        .run(() => super.loadParticipants(sessionId));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
participants: ${participants}
    ''';
  }
}
