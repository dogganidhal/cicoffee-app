// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_invitation.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmailInvitationStore on _EmailInvitationStore, Store {
  final _$valuesAtom = Atom(name: '_EmailInvitationStore.values');

  @override
  List<String> get values {
    _$valuesAtom.reportRead();
    return super.values;
  }

  @override
  set values(List<String> value) {
    _$valuesAtom.reportWrite(value, super.values, () {
      super.values = value;
    });
  }

  final _$sendInvitationsAsyncAction =
      AsyncAction('_EmailInvitationStore.sendInvitations');

  @override
  Future<dynamic> sendInvitations(String team) {
    return _$sendInvitationsAsyncAction.run(() => super.sendInvitations(team));
  }

  final _$_EmailInvitationStoreActionController =
      ActionController(name: '_EmailInvitationStore');

  @override
  void addEmail(String email) {
    final _$actionInfo = _$_EmailInvitationStoreActionController.startAction(
        name: '_EmailInvitationStore.addEmail');
    try {
      return super.addEmail(email);
    } finally {
      _$_EmailInvitationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeEmail(String email) {
    final _$actionInfo = _$_EmailInvitationStoreActionController.startAction(
        name: '_EmailInvitationStore.removeEmail');
    try {
      return super.removeEmail(email);
    } finally {
      _$_EmailInvitationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAll() {
    final _$actionInfo = _$_EmailInvitationStoreActionController.startAction(
        name: '_EmailInvitationStore.removeAll');
    try {
      return super.removeAll();
    } finally {
      _$_EmailInvitationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
values: ${values}
    ''';
  }
}
