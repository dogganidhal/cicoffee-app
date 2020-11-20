// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStore, Store {
  final _$loadingAtom = Atom(name: '_SignUpStore.loading');

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

  final _$errorAtom = Atom(name: '_SignUpStore.error');

  @override
  ApiError get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(ApiError value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$signUpAsyncAction = AsyncAction('_SignUpStore.signUp');

  @override
  Future<dynamic> signUp(
      {String email, String password, String firstName, String lastName}) {
    return _$signUpAsyncAction.run(() => super.signUp(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error}
    ''';
  }
}
