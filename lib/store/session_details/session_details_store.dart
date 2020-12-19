import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/api/dto/create_team_dto.dart';
import 'package:cicoffee_app/api/dto/team_dto.dart';
import 'package:cicoffee_app/api/dto/member_dto.dart';
import 'package:cicoffee_app/api/dto/order_dto.dart';
import 'package:cicoffee_app/api/dto/session_dto.dart';
import 'package:cicoffee_app/api/exception/api_exception.dart';
import 'package:cicoffee_app/service/session.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

part 'session_details_store.g.dart';

class SessionDetailsStore = _SessionDetailsStore with _$SessionDetailsStore;

abstract class _SessionDetailsStore with Store {
  final ApiClient apiClient;

  SessionDto session;

  @observable
  bool loading = false;

  @observable
  List<ParticipantOrders> participants = List.empty();

  _SessionDetailsStore({this.apiClient});

  @action
  Future loadParticipants(String sessionId) async {
    loading = true;
    final session = await apiClient.sessions.getById(sessionId);
    participants = session.team.members
      .map((member) {
        var orderIfAny;
        try {
          orderIfAny = session.orders
              .firstWhere((element) => element.member.id == member.id);
        } catch (_) {
          orderIfAny = null;
        }
        return ParticipantOrders(
          member: member,
          order: orderIfAny,
          confirmed: session.participants.where((participant) => participant.id == member.id).isNotEmpty
        );
      })
      .toList();
    print(participants.map((p) => p.toJson()));
    loading = false;
  }

}

class ParticipantOrders {
  MemberDto member;
  OrderDto order;
  bool confirmed;

  ParticipantOrders({this.order, this.member, this.confirmed});

  Map<String, dynamic> toJson() {
    return {
      'member': member.toJson(),
      'order': order?.toJson()
    };
  }
}
