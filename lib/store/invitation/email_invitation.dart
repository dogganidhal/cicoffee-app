import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

part 'email_invitation.g.dart';

class EmailInvitationStore = _EmailInvitationStore with _$EmailInvitationStore;

abstract class _EmailInvitationStore with Store {
  final ApiClient apiClient;

  _EmailInvitationStore({@required this.apiClient});

  @observable
  List<String> values = [];

  @action
  void addEmail(String email) {
    if (!values.contains(email)) {
      values = [...values, email];
    }
  }

  @action
  void removeEmail(String email) {
    values = [
      ...(
          values
              ..remove(email)
      )
    ];
  }

  @action
  void removeAll() {
    values = [];
  }

  @action
  void sendInvitations() {
    // TODO(Ahmed): Send invitation request to API
    values = [];
  }
}