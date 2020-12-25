import 'package:cicoffee_app/api/exception/api_exception.dart';
import 'package:cicoffee_app/store/auth/auth_store.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final AuthStore authStore;

  @observable
  bool loading = false;
  @observable
  ApiError error;

  _LoginStore({@required this.authStore});

  @action
  Future login(String email, String password, String teamId) async {
    error = null;
    loading = true;
    try {
      await authStore.login(email, password, teamId);
    } on ApiError catch (error) {
      this.error = error;
    }
    loading = false;
  }
}
