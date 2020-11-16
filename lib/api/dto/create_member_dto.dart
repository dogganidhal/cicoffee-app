import 'package:meta/meta.dart';

class CreateMemberDto {
  /// Returns a new [CreateMemberDto] instance.
  CreateMemberDto({
    @required this.firstName,
    @required this.lastName,
    this.email,
    @required this.password,
  });

  /// Returns a new [CreateMemberDto] instance and optionally import its values from
  /// [json] if it's non-null.
  CreateMemberDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      firstName = json['firstName'];
      lastName = json['lastName'];
      email = json['email'];
      password = json['password'];
    }
  }


  String firstName;


  String lastName;


  String email;


  String password;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateMemberDto &&
     other.firstName == firstName &&
     other.lastName == lastName &&
     other.email == email &&
     other.password == password;

  @override
  int get hashCode =>
    firstName.hashCode +
    lastName.hashCode +
    email.hashCode +
    password.hashCode;

  @override
  String toString() => 'CreateMemberDto[firstName=$firstName, lastName=$lastName, email=$email, password=$password]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (firstName != null) {
      json['firstName'] = firstName;
    }
    if (lastName != null) {
      json['lastName'] = lastName;
    }
    if (email != null) {
      json['email'] = email;
    }
    if (password != null) {
      json['password'] = password;
    }
    return json;
  }

  static List<CreateMemberDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateMemberDto>[]
      : json.map((v) => CreateMemberDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, CreateMemberDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateMemberDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = CreateMemberDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of CreateMemberDto-objects as value to a dart map
  static Map<String, List<CreateMemberDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateMemberDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = CreateMemberDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

