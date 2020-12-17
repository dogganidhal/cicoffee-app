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

  _SessionDetailsStore({@required this.apiClient}) {

  }

  @observable
  bool loading = false;


  @observable
  List<ParticipantOrders> participants = List.empty();

  @action
  Future loadParticipants() async {
    loading = true;
    try {
      List<SessionDto> sessions = await apiClient.sessions.getMemberSessions();

    } on ApiError catch (apiError) {
      print(apiError);
    }
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