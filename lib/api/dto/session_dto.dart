

import 'package:cicoffee_app/api/dto/member_dto.dart';
import 'package:cicoffee_app/api/dto/order_dto.dart';
import 'package:cicoffee_app/api/dto/team_dto.dart';

class SessionDto {
  /// Returns a new [SessionDto] instance.
  SessionDto({
    this.id,
    this.startDate,
    this.endDate,
    this.team,
    this.author,
    this.orders = const [],
    this.participants = const [],
  });

  /// Returns a new [SessionDto] instance and optionally import its values from
  /// [json] if it's non-null.
  SessionDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      id = json['id'];
      startDate = json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate']);
      endDate = json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate']);
      team = TeamDto.fromJson(json['team']);
      author = MemberDto.fromJson(json['author']);
      orders = OrderDto.listFromJson(json['orders']);
      participants = MemberDto.listFromJson(json['participants']);
    }
  }


  String id;


  DateTime startDate;


  DateTime endDate;


  TeamDto team;


  MemberDto author;


  List<OrderDto> orders;


  List<MemberDto> participants;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SessionDto &&
     other.id == id &&
     other.startDate == startDate &&
     other.endDate == endDate &&
     other.team == team &&
     other.author == author &&
     other.orders == orders &&
     other.participants == participants;

  @override
  int get hashCode =>
    id.hashCode +
    startDate.hashCode +
    endDate.hashCode +
    team.hashCode +
    author.hashCode +
    orders.hashCode +
    participants.hashCode;

  @override
  String toString() => 'SessionDto[id=$id, startDate=$startDate, endDate=$endDate, team=$team, author=$author, orders=$orders, participants=$participants]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json['id'] = id;
    }
    if (startDate != null) {
      json['startDate'] = startDate.toUtc().toIso8601String();
    }
    if (endDate != null) {
      json['endDate'] = endDate.toUtc().toIso8601String();
    }
    if (team != null) {
      json['team'] = team;
    }
    if (author != null) {
      json['author'] = author;
    }
    if (orders != null) {
      json['orders'] = orders;
    }
    if (participants != null) {
      json['participants'] = participants;
    }
    return json;
  }

  static List<SessionDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SessionDto>[]
      : json.map((v) => SessionDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, SessionDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SessionDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SessionDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SessionDto-objects as value to a dart map
  static Map<String, List<SessionDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SessionDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SessionDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

