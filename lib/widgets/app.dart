import 'package:cicoffee_app/config/config.dart';
import 'package:cicoffee_app/config/router.dart';
import 'package:cicoffee_app/widgets/app_configurer.dart';
import 'package:cicoffee_app/widgets/auth_loader.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:cicoffee_app/widgets/invitation_qrcode_generator.dart';
import 'package:cicoffee_app/widgets/join_team_qrcode.dart';
import 'package:cicoffee_app/widgets/session_details.dart';
import 'package:cicoffee_app/widgets/product_cart.dart';
import 'package:cicoffee_app/widgets/login.dart';
import 'package:cicoffee_app/widgets/reset-password.dart';

class CICoffeeApp extends StatelessWidget {
  final Config config;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  CICoffeeApp({Key key, @required this.config}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xff1A2384);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));
    return MaterialApp(
      title: 'CiCoffee',
      navigatorKey: _navigatorKey,
      theme: ThemeData(
        primaryColorDark: primaryColor,
        primaryColor: primaryColor,
        accentColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'ProductSans',
        cursorColor: primaryColor,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: primaryColor
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.shifting
        )
      ),
      routes: Router.routeBindings,
      home: AppConfigurer(
        config: config,
        navigatorKey: _navigatorKey,
        child: AuthLoader(),
      ),
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name);
        if(uri.pathSegments.first == 'invitation-qr') {
          final id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => InvitationQRGenerator(teamId: id));
        }
        if(uri.pathSegments.first == 'session') {
          final id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => SessionDetails(sessionId: id));
        }
        if(uri.pathSegments.first == 'join-qr') {
          return MaterialPageRoute(builder: (context) => ScanPhoto());
        }
        if(uri.pathSegments.first == 'email-invite') {
          return MaterialPageRoute(builder: (context) => Login());
        }
        if(uri.pathSegments.first == 'reset-password') {
          return MaterialPageRoute(builder: (context) => ResetPassword());
        }
        if(uri.pathSegments.first == 'products') {
          final id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => ProductCart(sessionId: id));
        }
        return MaterialPageRoute(builder: (context) => Container());
      },
    );
  }
}
