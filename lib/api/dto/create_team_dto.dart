import 'package:meta/meta.dart';

class CreateTeamDto {
  /// Returns a new [CreateTeamDto] instance.
  CreateTeamDto({
    @required this.name,
  });

  /// Returns a new [CreateTeamDto] instance and optionally import its values from
  /// [json] if it's non-null.
  CreateTeamDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      name = json['name'];
    }
  }


  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateTeamDto &&
     other.name == name;

  @override
  int get hashCode =>
    name.hashCode;

  @override
  String toString() => 'CreateTeamDto[name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (name != null) {
      json['name'] = name;
    }
    return json;
  }

  static List<CreateTeamDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateTeamDto>[]
      : json.map((v) => CreateTeamDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, CreateTeamDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateTeamDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = CreateTeamDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of CreateTeamDto-objects as value to a dart map
  static Map<String, List<CreateTeamDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateTeamDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = CreateTeamDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

