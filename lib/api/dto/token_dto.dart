

class TokenDto {
  /// Returns a new [TokenDto] instance.
  TokenDto({
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.type,
  });

  /// Returns a new [TokenDto] instance and optionally import its values from
  /// [json] if it's non-null.
  TokenDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      accessToken = json['accessToken'];
      refreshToken = json['refreshToken'];
      expiresIn = json['expiresIn'];
      type = json['type'];
    }
  }


  String accessToken;


  String refreshToken;


  int expiresIn;


  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TokenDto &&
     other.accessToken == accessToken &&
     other.refreshToken == refreshToken &&
     other.expiresIn == expiresIn &&
     other.type == type;

  @override
  int get hashCode =>
    accessToken.hashCode +
    refreshToken.hashCode +
    expiresIn.hashCode +
    type.hashCode;

  @override
  String toString() => 'TokenDto[accessToken=$accessToken, refreshToken=$refreshToken, expiresIn=$expiresIn, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (accessToken != null) {
      json['accessToken'] = accessToken;
    }
    if (refreshToken != null) {
      json['refreshToken'] = refreshToken;
    }
    if (expiresIn != null) {
      json['expiresIn'] = expiresIn;
    }
    if (type != null) {
      json['type'] = type;
    }
    return json;
  }

  static List<TokenDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <TokenDto>[]
      : json.map((v) => TokenDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, TokenDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, TokenDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = TokenDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of TokenDto-objects as value to a dart map
  static Map<String, List<TokenDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<TokenDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = TokenDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

