

import 'package:cicoffee_app/api/dto/product_dto.dart';

class OrderItemDto {
  /// Returns a new [OrderItemDto] instance.
  OrderItemDto({
    this.id,
    this.quantity,
    this.product,
  });

  /// Returns a new [OrderItemDto] instance and optionally import its values from
  /// [json] if it's non-null.
  OrderItemDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      id = json['id'];
      quantity = json['quantity'];
      product = ProductDto.fromJson(json['product']);
    }
  }


  String id;


  int quantity;


  ProductDto product;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OrderItemDto &&
     other.id == id &&
     other.quantity == quantity &&
     other.product == product;

  @override
  int get hashCode =>
    id.hashCode +
    quantity.hashCode +
    product.hashCode;

  @override
  String toString() => 'OrderItemDto[id=$id, quantity=$quantity, product=$product]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json['id'] = id;
    }
    if (quantity != null) {
      json['quantity'] = quantity;
    }
    if (product != null) {
      json['product'] = product;
    }
    return json;
  }

  static List<OrderItemDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <OrderItemDto>[]
      : json.map((v) => OrderItemDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, OrderItemDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, OrderItemDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = OrderItemDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of OrderItemDto-objects as value to a dart map
  static Map<String, List<OrderItemDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<OrderItemDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = OrderItemDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

