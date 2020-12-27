import 'package:cicoffee_app/config/config.dart';
import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/config/interceptor_wrapper.dart';
import 'package:cicoffee_app/service/session.dart';
import 'package:cicoffee_app/service/storage.dart';
import 'package:cicoffee_app/store/auth/auth_store.dart';
import 'package:cicoffee_app/store/session/session_store.dart';
import 'package:cicoffee_app/store/team/team_store.dart';
import 'package:cicoffee_app/store/login/login_store.dart';
import 'package:cicoffee_app/store/navigation/navigation_store.dart';
import 'package:cicoffee_app/store/sign_up/sign_up_store.dart';
import 'package:cicoffee_app/store/invitation/email_invitation.dart';
import 'package:cicoffee_app/store/session_details/session_details_store.dart';
import 'package:cicoffee_app/store/participant_order/participant_order_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';


void configureContainer(Config config, GlobalKey<NavigatorState> navigatorKey) {
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
  Dio vanillaDio = Dio(BaseOptions(
    baseUrl: config.apiBaseUrl
  ));
  ApiClient vanillaApiClient = ApiClient(dio: vanillaDio);

  Session session = GetIt.instance.get();
  InterceptorWrapper interceptors = InterceptorWrapper(
    session: session,
    apiClient: vanillaApiClient
  );

  Dio dio = Dio(BaseOptions(
      baseUrl: config.apiBaseUrl
  ))
  ..interceptors.add(interceptors.auth);

  ApiClient apiClient = ApiClient(dio: dio);

  GetIt.instance.registerSingleton<Dio>(dio);
  GetIt.instance.registerSingleton<ApiClient>(apiClient);
}

void _configureStores(GlobalKey<NavigatorState> navigatorKey) {
  final session = GetIt.instance.get<Session>();
  final apiClient = GetIt.instance.get<ApiClient>();
  final navigationStore = NavigationStore(navigatorKey: navigatorKey);
  final sessionStore = SessionStore(apiClient: apiClient, session: session);
  final teamStore = TeamStore(apiClient: apiClient, session: session);
  final authStore = AuthStore(
    session: session,
    apiClient: apiClient,
    navigationStore: navigationStore,
    sessionStore: sessionStore,
    teamStore: teamStore
  );
  GetIt.instance.registerSingleton<NavigationStore>(navigationStore);
  GetIt.instance.registerSingleton<AuthStore>(authStore);
  GetIt.instance.registerSingleton<LoginStore>(LoginStore(authStore: authStore));
  GetIt.instance.registerSingleton<SignUpStore>( SignUpStore(
    apiClient: apiClient,
    navigationStore: navigationStore
  ));
  GetIt.instance.registerFactory<TeamStore>(() => (teamStore));
  GetIt.instance.registerFactory<SessionStore>(() => (sessionStore));
  GetIt.instance.registerSingleton<EmailInvitationStore>(EmailInvitationStore(apiClient: apiClient));
  GetIt.instance.registerSingleton<SessionDetailsStore>(SessionDetailsStore(apiClient: apiClient));
  GetIt.instance.registerFactory<ParticipantOrderStore>(() => (ParticipantOrderStore(apiClient: apiClient)));

}
