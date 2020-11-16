import 'package:cicoffee_app/api/dto/create_order_item_dto.dart';

class CreateOrderDto {
  /// Returns a new [CreateOrderDto] instance.
  CreateOrderDto({
    this.items = const [],
  });

  /// Returns a new [CreateOrderDto] instance and optionally import its values from
  /// [json] if it's non-null.
  CreateOrderDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      items = CreateOrderItemDto.listFromJson(json['items']);
    }
  }


  List<CreateOrderItemDto> items;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateOrderDto &&
     other.items == items;

  @override
  int get hashCode =>
    items.hashCode;

  @override
  String toString() => 'CreateOrderDto[items=$items]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (items != null) {
      json['items'] = items;
    }
    return json;
  }

  static List<CreateOrderDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateOrderDto>[]
      : json.map((v) => CreateOrderDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, CreateOrderDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateOrderDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = CreateOrderDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of CreateOrderDto-objects as value to a dart map
  static Map<String, List<CreateOrderDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateOrderDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = CreateOrderDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

