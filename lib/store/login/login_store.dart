import 'package:cicoffee_app/store/auth/auth_store.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  final AuthStore authStore;

  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  bool loading = false;
  @observable
  bool successful = false;

  _LoginStore({@required this.authStore});

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future login() async {
    loading = true;
    await authStore.login(email, password);
    successful = true;
    loading = false;
    successful = false;
  }

}
