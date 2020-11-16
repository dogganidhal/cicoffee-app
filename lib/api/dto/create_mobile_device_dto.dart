import 'package:meta/meta.dart';

class CreateMobileDeviceDto {
  /// Returns a new [CreateMobileDeviceDto] instance.
  CreateMobileDeviceDto({
    @required this.identifier,
    this.name,
  });

  /// Returns a new [CreateMobileDeviceDto] instance and optionally import its values from
  /// [json] if it's non-null.
  CreateMobileDeviceDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      identifier = json['identifier'];
      name = json['name'];
    }
  }


  String identifier;


  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateMobileDeviceDto &&
     other.identifier == identifier &&
     other.name == name;

  @override
  int get hashCode =>
    identifier.hashCode +
    name.hashCode;

  @override
  String toString() => 'CreateMobileDeviceDto[identifier=$identifier, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (identifier != null) {
      json['identifier'] = identifier;
    }
    if (name != null) {
      json['name'] = name;
    }
    return json;
  }

  static List<CreateMobileDeviceDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateMobileDeviceDto>[]
      : json.map((v) => CreateMobileDeviceDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, CreateMobileDeviceDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateMobileDeviceDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = CreateMobileDeviceDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of CreateMobileDeviceDto-objects as value to a dart map
  static Map<String, List<CreateMobileDeviceDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateMobileDeviceDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = CreateMobileDeviceDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

