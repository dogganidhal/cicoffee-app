import 'package:cicoffee_app/config/config.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/widgets.dart';
import 'package:cicoffee_app/widgets/sign_up.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:cicoffee_app/store/navigation/navigation_store.dart';


void configureDynamicLinks(Config config, NavigationStore navigationStore) async {
  FirebaseDynamicLinks.instance.onLink(
    onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;
      if (deepLink != null) {
        if (deepLink.queryParameters.containsKey('teamId')) {
          String id = deepLink.queryParameters['teamId'];
          navigationStore.navigateToLogin(id);
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
        appStoreId: '',
    ),
  );
  final link = await parameters.buildUrl();
  final ShortDynamicLink shortenedLink = await DynamicLinkParameters.shortenUrl(
    link,
    DynamicLinkParametersOptions(shortDynamicLinkPathLength: ShortDynamicLinkPathLength.unguessable),
  );
  return shortenedLink.shortUrl.toString();
}
