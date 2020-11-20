import 'package:cicoffee_app/config/config.dart';
import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/config/interceptor_wrapper.dart';
import 'package:cicoffee_app/service/session.dart';
import 'package:cicoffee_app/service/storage.dart';
import 'package:cicoffee_app/store/auth/auth_store.dart';
import 'package:cicoffee_app/store/hubs/hub_store.dart';
import 'package:cicoffee_app/store/login/login_store.dart';
import 'package:cicoffee_app/store/navigation/navigation_store.dart';
import 'package:cicoffee_app/store/sign_up/sign_up_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';


void configureContainer(Environment environment, GlobalKey<NavigatorState> navigatorKey) {
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
    case Environment.TEST:
      config = Config.test();
      break;
  }

  _configureSession(config);
  _configureDio(config);
  _configureStores(navigatorKey);
}

void _configureSession(Config config) {
  final storageService = StorageService();
  final session = Session(storageService: storageService);

  GetIt.instance.registerSingleton<StorageService>(storageService);
  GetIt.instance.registerSingleton<Session>(session);
}

void _configureDio(Config config) {
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

void _configureStores(GlobalKey<NavigatorState> navigatorKey) {
  final session = GetIt.instance.get<Session>();
  final apiClient = GetIt.instance.get<ApiClient>();
  final navigationStore = NavigationStore(navigatorKey: navigatorKey);
  final authStore = AuthStore(
    session: session,
    apiClient: apiClient,
    navigationStore: navigationStore
  );
  GetIt.instance.registerSingleton<NavigationStore>(navigationStore);
  GetIt.instance.registerSingleton<AuthStore>(authStore);
  GetIt.instance.registerFactory<LoginStore>(() => LoginStore(authStore: authStore));
  GetIt.instance.registerFactory<SignUpStore>(() => SignUpStore(
    apiClient: apiClient,
    navigationStore: navigationStore
  ));
  GetIt.instance.registerFactory<HubStore>(() => HubStore(apiClient: apiClient, session: session));
}
