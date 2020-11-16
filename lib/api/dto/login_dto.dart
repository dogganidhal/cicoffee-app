import 'package:meta/meta.dart';

class LoginDto {
  /// Returns a new [LoginDto] instance.
  LoginDto({
    this.email,
    @required this.password,
  });

  /// Returns a new [LoginDto] instance and optionally import its values from
  /// [json] if it's non-null.
  LoginDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      email = json['email'];
      password = json['password'];
    }
  }


  String email;


  String password;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginDto &&
     other.email == email &&
     other.password == password;

  @override
  int get hashCode =>
    email.hashCode +
    password.hashCode;

  @override
  String toString() => 'LoginDto[email=$email, password=$password]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (email != null) {
      json['email'] = email;
    }
    if (password != null) {
      json['password'] = password;
    }
    return json;
  }

  static List<LoginDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <LoginDto>[]
      : json.map((v) => LoginDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, LoginDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, LoginDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = LoginDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of LoginDto-objects as value to a dart map
  static Map<String, List<LoginDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<LoginDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = LoginDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

