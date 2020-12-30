

class Config {
  final String apiBaseUrl;
  final String oneSignalAppId;

  Config._({this.apiBaseUrl, this.oneSignalAppId});

  factory Config.local() => Config._(
    apiBaseUrl: "http://localhost:8080",
    oneSignalAppId: "1f57b5ae-8c76-441e-8dfd-228898defbcc"
  );

  factory Config.dev() => Config._(
    apiBaseUrl: "http://localhost:8080",
      oneSignalAppId: "1f57b5ae-8c76-441e-8dfd-228898defbcc"
  );

  factory Config.stg() => Config._(
    apiBaseUrl: "https://api.pausa-cafe.ga",
      oneSignalAppId: "1f57b5ae-8c76-441e-8dfd-228898defbcc"
  );

  factory Config.prd() => Config._(
    apiBaseUrl: "https://api.pausa-cafe.ga",
      oneSignalAppId: "1f57b5ae-8c76-441e-8dfd-228898defbcc"
  );

  factory Config.test() => Config._(
    apiBaseUrl: "http://localhost:8080",
      oneSignalAppId: "1f57b5ae-8c76-441e-8dfd-228898defbcc"
  );
}


enum Environment {
  LOCAL,
  TEST,
  DEV,
  STG,
  PRD
}
