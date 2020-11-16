

import 'package:cicoffee_app/api/dto/member_dto.dart';

class TeamDto {
  /// Returns a new [TeamDto] instance.
  TeamDto({
    this.id,
    this.name,
    this.members = const [],
  });

  /// Returns a new [TeamDto] instance and optionally import its values from
  /// [json] if it's non-null.
  TeamDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      id = json['id'];
      name = json['name'];
      members = MemberDto.listFromJson(json['members']);
    }
  }


  String id;


  String name;


  List<MemberDto> members;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TeamDto &&
     other.id == id &&
     other.name == name &&
     other.members == members;

  @override
  int get hashCode =>
    id.hashCode +
    name.hashCode +
    members.hashCode;

  @override
  String toString() => 'TeamDto[id=$id, name=$name, members=$members]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json['id'] = id;
    }
    if (name != null) {
      json['name'] = name;
    }
    if (members != null) {
      json['members'] = members;
    }
    return json;
  }

  static List<TeamDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <TeamDto>[]
      : json.map((v) => TeamDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, TeamDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, TeamDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = TeamDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of TeamDto-objects as value to a dart map
  static Map<String, List<TeamDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<TeamDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = TeamDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

