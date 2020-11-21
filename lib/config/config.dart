

class Config {
  final String apiBaseUrl;

  Config._({this.apiBaseUrl});

  factory Config.local() => Config._(
    apiBaseUrl: "http://192.168.1.90:8080"
  );

  factory Config.dev() => Config._(
    apiBaseUrl: "http://192.168.1.90:8080"
  );

  factory Config.stg() => Config._(
    apiBaseUrl: "http://192.168.1.90:8080"
  );

  factory Config.prd() => Config._(
    apiBaseUrl: "http://192.168.1.90:8080"
  );

  factory Config.test() => Config._(
    apiBaseUrl: "http://192.168.1.90:8080"
  );
}


enum Environment {
  LOCAL,
  TEST,
  DEV,
  STG,
  PRD
}
