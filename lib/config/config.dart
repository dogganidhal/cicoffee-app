

class Config {
  final String apiBaseUrl;

  Config._({this.apiBaseUrl});

  factory Config.local() => Config._(
    apiBaseUrl: "http://localhost:8080"
  );

  factory Config.dev() => Config._(
    apiBaseUrl: "http://localhost:8080"
  );

  factory Config.stg() => Config._(
    apiBaseUrl: "http://localhost:8080"
  );

  factory Config.prd() => Config._(
    apiBaseUrl: "http://localhost:8080"
  );
}


enum Environment {
  LOCAL,
  DEV,
  STG,
  PRD
}
