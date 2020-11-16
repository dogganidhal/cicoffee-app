import 'package:meta/meta.dart';

class RefreshDto {
  /// Returns a new [RefreshDto] instance.
  RefreshDto({
    @required this.token,
  });

  /// Returns a new [RefreshDto] instance and optionally import its values from
  /// [json] if it's non-null.
  RefreshDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      token = json['token'];
    }
  }


  String token;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RefreshDto &&
     other.token == token;

  @override
  int get hashCode =>
    token.hashCode;

  @override
  String toString() => 'RefreshDto[token=$token]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (token != null) {
      json['token'] = token;
    }
    return json;
  }

  static List<RefreshDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RefreshDto>[]
      : json.map((v) => RefreshDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, RefreshDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, RefreshDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = RefreshDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of RefreshDto-objects as value to a dart map
  static Map<String, List<RefreshDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<RefreshDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = RefreshDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

