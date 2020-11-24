import 'package:cicoffee_app/config/config.dart';
import 'package:cicoffee_app/config/router.dart';
import 'package:cicoffee_app/widgets/app_configurer.dart';
import 'package:cicoffee_app/widgets/auth_loader.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';


class CICoffeeApp extends StatelessWidget {
  final Environment environment;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  CICoffeeApp({Key key, @required this.environment}) : super(key: key);

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
        environment: environment,
        navigatorKey: _navigatorKey,
        child: AuthLoader(),
      ),
    );
  }
}
