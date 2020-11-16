import 'package:meta/meta.dart';

class CreateOrderItemDto {
  /// Returns a new [CreateOrderItemDto] instance.
  CreateOrderItemDto({
    @required this.productId,
    @required this.quantity,
  });

  /// Returns a new [CreateOrderItemDto] instance and optionally import its values from
  /// [json] if it's non-null.
  CreateOrderItemDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      productId = json['productId'];
      quantity = json['quantity'];
    }
  }


  String productId;


  int quantity;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateOrderItemDto &&
     other.productId == productId &&
     other.quantity == quantity;

  @override
  int get hashCode =>
    productId.hashCode +
    quantity.hashCode;

  @override
  String toString() => 'CreateOrderItemDto[productId=$productId, quantity=$quantity]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (productId != null) {
      json['productId'] = productId;
    }
    if (quantity != null) {
      json['quantity'] = quantity;
    }
    return json;
  }

  static List<CreateOrderItemDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateOrderItemDto>[]
      : json.map((v) => CreateOrderItemDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, CreateOrderItemDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateOrderItemDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = CreateOrderItemDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of CreateOrderItemDto-objects as value to a dart map
  static Map<String, List<CreateOrderItemDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateOrderItemDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = CreateOrderItemDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

