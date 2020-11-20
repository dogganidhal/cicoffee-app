// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  Computed<bool> _$userConnectedComputed;

  @override
  bool get userConnected =>
      (_$userConnectedComputed ??= Computed<bool>(() => super.userConnected,
              name: '_AuthStore.userConnected'))
          .value;

  final _$loadingAtom = Atom(name: '_AuthStore.loading');

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

  final _$memberAtom = Atom(name: '_AuthStore.member');

  @override
  MemberDto get member {
    _$memberAtom.reportRead();
    return super.member;
  }

  @override
  set member(MemberDto value) {
    _$memberAtom.reportWrite(value, super.member, () {
      super.member = value;
    });
  }

  final _$tokenAtom = Atom(name: '_AuthStore.token');

  @override
  TokenDto get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(TokenDto value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$loadFromDiskAsyncAction = AsyncAction('_AuthStore.loadFromDisk');

  @override
  Future<dynamic> loadFromDisk() {
    return _$loadFromDiskAsyncAction.run(() => super.loadFromDisk());
  }

  final _$loginAsyncAction = AsyncAction('_AuthStore.login');

  @override
  Future<dynamic> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  final _$logoutAsyncAction = AsyncAction('_AuthStore.logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
member: ${member},
token: ${token},
userConnected: ${userConnected}
    ''';
  }
}
