import 'package:cicoffee_app/api/exception/api_exception.dart';
import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'reset_password_store.g.dart';

class ResetPasswordStore = _ResetPasswordStore with _$ResetPasswordStore;

abstract class _ResetPasswordStore with Store {
  final ApiClient apiClient;

  @observable
  bool loading = false;
  @observable
  ApiError error;

  _ResetPasswordStore({@required this.apiClient});

  @action
  Future resetPassword(String email) async {
    error = null;
    loading = true;
    try {
      await apiClient.auth.resetPassword(email);
    } on ApiError catch (error) {
      this.error = error;
    }
    loading = false;
  }
}
