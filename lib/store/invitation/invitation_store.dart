import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/api/dto/member_dto.dart';
import 'package:cicoffee_app/api/exception/api_exception.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

part 'invitation_store.g.dart';

class InvitationStore = _InvitationStore with _$InvitationStore;

abstract class _InvitationStore with Store {
  final ApiClient apiClient;

  _InvitationStore({@required this.apiClient});
  @observable
  bool loading = false;
  @observable
  List<MemberDto> suggestedMembers = List.empty();
  @observable
  List<MemberDto> selectedMembers = List.empty();

  Future<List<MemberDto>> searchMembers(String query) async {
    return await apiClient.members.searchMembers(query);
  }

  @action
  Future selectMember(String id) async {
    selectedMembers.add(
      suggestedMembers.firstWhere((element) => element.id == id)
    );
    suggestedMembers = List.empty();
  }
}