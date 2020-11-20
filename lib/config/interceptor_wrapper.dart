import 'package:cicoffee_app/service/session.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:cicoffee_app/api/client/api_client.dart';


class InterceptorWrapper {
  final ApiClient apiClient;
  final Session session;

  InterceptorWrapper({@required this.apiClient, @required this.session});

  Interceptor get auth => InterceptorsWrapper(
    onRequest: (options) async {
      final token = await session.getCredentials();
      if (token != null) {
        options.headers["authorization"] = "${token.type} ${token.accessToken}";
      }
      return options;
    },
    onResponse: (options) async {

    }
  );

}
