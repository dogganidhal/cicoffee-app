
import 'package:cicoffee_app/api/dto/member_dto.dart';
import 'package:cicoffee_app/api/dto/order_item_dto.dart';
import 'package:cicoffee_app/api/dto/session_dto.dart';

class OrderDto {
  /// Returns a new [OrderDto] instance.
  OrderDto({
    this.id,
    this.member,
    this.session,
    this.items = const [],
  });

  /// Returns a new [OrderDto] instance and optionally import its values from
  /// [json] if it's non-null.
  OrderDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      id = json['id'];
      member = MemberDto.fromJson(json['member']);
      session = SessionDto.fromJson(json['session']);
      items = OrderItemDto.listFromJson(json['items']);
    }
  }


  String id;


  MemberDto member;


  SessionDto session;


  List<OrderItemDto> items;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OrderDto &&
     other.id == id &&
     other.member == member &&
     other.session == session &&
     other.items == items;

  @override
  int get hashCode =>
    id.hashCode +
    member.hashCode +
    session.hashCode +
    items.hashCode;

  @override
  String toString() => 'OrderDto[id=$id, member=$member, session=$session, items=$items]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json['id'] = id;
    }
    if (member != null) {
      json['member'] = member;
    }
    if (session != null) {
      json['session'] = session;
    }
    if (items != null) {
      json['items'] = items;
    }
    return json;
  }

  static List<OrderDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <OrderDto>[]
      : json.map((v) => OrderDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, OrderDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, OrderDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = OrderDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of OrderDto-objects as value to a dart map
  static Map<String, List<OrderDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<OrderDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = OrderDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

