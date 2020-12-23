import 'package:meta/meta.dart';

class CreateInviteDto {
  /// Returns a new [CreateInviteDto] instance.
  CreateInviteDto({
    @required this.link,
    @required this.emails
  });

  /// Returns a new [CreateMemberDto] instance and optionally import its values from
  /// [json] if it's non-null.
  CreateInviteDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      link = json['link'];
      emails = json['emails'];
    }
  }


  String link;

  List<String> emails;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateInviteDto &&
      other.link == link &&
      other.emails == emails;

  @override
  int get hashCode =>
      link.hashCode +
          emails.hashCode;

  @override
  String toString() => 'CreateInviteDto[link=$link, emails=$emails]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (link != null) {
      json['link'] = link;
    }
    if (emails != null) {
      json['emails'] = emails;
    }

    return json;
  }

  static List<CreateInviteDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
      json == null || json.isEmpty
          ? true == emptyIsNull ? null : <CreateInviteDto>[]
          : json.map((v) => CreateInviteDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, CreateInviteDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateInviteDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = CreateInviteDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of CreateMemberDto-objects as value to a dart map
  static Map<String, List<CreateInviteDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateInviteDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = CreateInviteDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

