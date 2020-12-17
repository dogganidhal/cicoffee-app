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
    participants = session.participants
      .map((participant) {
        var orderIfAny;
        try {
          orderIfAny = session.orders
              .firstWhere((element) => element.member.id == participant.id);
        } catch (_) {
          orderIfAny = null;
        }
        return ParticipantOrders(
          member: participant,
          order: orderIfAny
        );
      })
      .toList();
    loading = false;
  }

}

class ParticipantOrders {

  MemberDto member;
  OrderDto order;

  ParticipantOrders({MemberDto member, OrderDto order}) {
    this.member = member;
    this.order = order;
  }

}