
class ProductDto {
  /// Returns a new [ProductDto] instance.
  ProductDto({
    this.id,
    this.name,
    this.photoUrl,
  });

  /// Returns a new [ProductDto] instance and optionally import its values from
  /// [json] if it's non-null.
  ProductDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      id = json['id'];
      name = json['name'];
      photoUrl = json['photoUrl'];
    }
  }


  String id;


  String name;


  String photoUrl;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProductDto &&
     other.id == id &&
     other.name == name &&
     other.photoUrl == photoUrl;

  @override
  int get hashCode =>
    id.hashCode +
    name.hashCode +
    photoUrl.hashCode;

  @override
  String toString() => 'ProductDto[id=$id, name=$name, photoUrl=$photoUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json['id'] = id;
    }
    if (name != null) {
      json['name'] = name;
    }
    if (photoUrl != null) {
      json['photoUrl'] = photoUrl;
    }
    return json;
  }

  static List<ProductDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ProductDto>[]
      : json.map((v) => ProductDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, ProductDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ProductDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ProductDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ProductDto-objects as value to a dart map
  static Map<String, List<ProductDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ProductDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ProductDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

