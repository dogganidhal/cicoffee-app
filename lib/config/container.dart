import 'package:cicoffee_app/config/config.dart';
import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/config/interceptor_wrapper.dart';
import 'package:cicoffee_app/service/session.dart';
import 'package:cicoffee_app/service/storage.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


void configureContainer(Environment environment) {
  Config config;
  switch(environment) {
    case Environment.LOCAL:
      config = Config.local();
      break;
    case Environment.DEV:
      config = Config.dev();
      break;
    case Environment.STG:
      config = Config.stg();
      break;
    case Environment.PRD:
      config = Config.prd();
      break;
  }

  configureSession(config);
  configureDio(config);
}

void configureSession(Config config) {
  final storageService = StorageService();
  final session = Session(storageService: storageService);

  GetIt.instance.registerSingleton<StorageService>(storageService);
  GetIt.instance.registerSingleton<Session>(session);
}

void configureDio(Config config) {
  Dio dio = Dio(BaseOptions(
      baseUrl: config.apiBaseUrl
  ));
  ApiClient vanillaApiClient = ApiClient(dio: dio);

  Session session = GetIt.instance.get();
  InterceptorWrapper interceptors = InterceptorWrapper(
    session: session,
    apiClient: vanillaApiClient
  );
  dio.interceptors.add(interceptors.auth);

  ApiClient apiClient = ApiClient(dio: dio);

  GetIt.instance.registerSingleton<Dio>(dio);
  GetIt.instance.registerSingleton<ApiClient>(apiClient);
}
