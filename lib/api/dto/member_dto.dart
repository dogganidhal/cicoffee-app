

class MemberDto {
  /// Returns a new [MemberDto] instance.
  MemberDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
  });

  /// Returns a new [MemberDto] instance and optionally import its values from
  /// [json] if it's non-null.
  MemberDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      id = json['id'];
      firstName = json['firstName'];
      lastName = json['lastName'];
      email = json['email'];
    }
  }


  String id;


  String firstName;


  String lastName;


  String email;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MemberDto &&
     other.id == id &&
     other.firstName == firstName &&
     other.lastName == lastName &&
     other.email == email;

  @override
  int get hashCode =>
    id.hashCode +
    firstName.hashCode +
    lastName.hashCode +
    email.hashCode;

  @override
  String toString() => 'MemberDto[id=$id, firstName=$firstName, lastName=$lastName, email=$email]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json['id'] = id;
    }
    if (firstName != null) {
      json['firstName'] = firstName;
    }
    if (lastName != null) {
      json['lastName'] = lastName;
    }
    if (email != null) {
      json['email'] = email;
    }
    return json;
  }

  static List<MemberDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <MemberDto>[]
      : json.map((v) => MemberDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, MemberDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, MemberDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = MemberDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of MemberDto-objects as value to a dart map
  static Map<String, List<MemberDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<MemberDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = MemberDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

