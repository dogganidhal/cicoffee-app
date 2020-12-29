import 'package:cicoffee_app/config/config.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/widgets.dart';
import 'package:cicoffee_app/widgets/sign_up.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:get_it/get_it.dart';
import 'package:cicoffee_app/store/auth/auth_store.dart';
import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/store/navigation/navigation_store.dart';

// https://pausa-cafe.ga/vVoNvR6mrPg8m2Jf7
final authStore = GetIt.instance.get<AuthStore>();

void configureDynamicLinks(Config config, NavigationStore navigationStore) async {
  FirebaseDynamicLinks.instance.onLink(
    onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;
      if (deepLink != null) {
        if (deepLink.queryParameters.containsKey('teamId')) {
          String id = deepLink.queryParameters['teamId'];
          if(!authStore.userConnected){
          navigationStore.navigateToLogin(id);
          }
          else{
            authStore.apiClient.teams.joinTeam(id);
            authStore.teamStore.loadTeams();
            navigationStore.navigateToHome(id);
          }
        }
      }
    },
    onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    }
  );

}

Future<String> createDynamicLink(String teamId) async {
  var parameters = DynamicLinkParameters(
    uriPrefix: 'https://pausa-cafe.ga',
    link: Uri.parse('https://pausa-cafe.ga/email-invite?teamId=$teamId'),
    androidParameters: AndroidParameters(
      packageName: "com.softkall.cicoffee",
      minimumVersion: 1,
    ),
    iosParameters: IosParameters(
      bundleId: "com.softkall.cicoffee",
        minimumVersion: '1',
        appStoreId: '123456789',
    ),
  );
  final link = await parameters.buildUrl();
  final ShortDynamicLink shortenedLink = await DynamicLinkParameters.shortenUrl(
    link,
    DynamicLinkParametersOptions(shortDynamicLinkPathLength: ShortDynamicLinkPathLength.unguessable),
  );
  return shortenedLink.shortUrl.toString();
}
