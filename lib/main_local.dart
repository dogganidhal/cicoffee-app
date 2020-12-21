import 'package:cicoffee_app/widgets/app.dart';
import 'package:cicoffee_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.init(
      "1f57b5ae-8c76-441e-8dfd-228898defbcc",
      iOSSettings: {
        OSiOSSettings.autoPrompt: false,
        OSiOSSettings.inAppLaunchUrl: false
      }
  );
  OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
  OneSignal.shared.promptUserForPushNotificationPermission();
  runApp(CICoffeeApp(environment: Environment.LOCAL));

}