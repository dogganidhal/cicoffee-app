

class CreateSessionDto {
  /// Returns a new [CreateSessionDto] instance.
  CreateSessionDto({
    this.startDate,
    this.endDate,
    this.teamId,
  });

  /// Returns a new [CreateSessionDto] instance and optionally import its values from
  /// [json] if it's non-null.
  CreateSessionDto.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      startDate = json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate']);
      endDate = json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate']);
      teamId = json['teamId'];
    }
  }


  DateTime startDate;


  DateTime endDate;


  String teamId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateSessionDto &&
     other.startDate == startDate &&
     other.endDate == endDate &&
     other.teamId == teamId;

  @override
  int get hashCode =>
    startDate.hashCode +
    endDate.hashCode +
    teamId.hashCode;

  @override
  String toString() => 'CreateSessionDto[startDate=$startDate, endDate=$endDate, teamId=$teamId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (startDate != null) {
      json['startDate'] = startDate.toUtc().toIso8601String();
    }
    if (endDate != null) {
      json['endDate'] = endDate.toUtc().toIso8601String();
    }
    if (teamId != null) {
      json['teamId'] = teamId;
    }
    return json;
  }

  static List<CreateSessionDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <CreateSessionDto>[]
      : json.map((v) => CreateSessionDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, CreateSessionDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, CreateSessionDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = CreateSessionDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of CreateSessionDto-objects as value to a dart map
  static Map<String, List<CreateSessionDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CreateSessionDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = CreateSessionDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

