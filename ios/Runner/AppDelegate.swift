import UIKit
import Flutter
import OneSignal
import Firebase


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    // Remove this method to stop OneSignal Debugging
    OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)

    // OneSignal initialization
    OneSignal.initWithLaunchOptions(launchOptions, appId: "1f57b5ae-8c76-441e-8dfd-228898defbcc")

    // promptForPushNotifications will show the native iOS notification permission prompt.
    // We recommend removing the following code and instead using an In-App Message to prompt for notification permission (See step 8)
    OneSignal.promptForPushNotifications(userResponse: { accepted in
    print("User accepted notifications: \(accepted)")
    })

    return true
  }
}
