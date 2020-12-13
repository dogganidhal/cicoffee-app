import 'package:cicoffee_app/widgets/home.dart';
import 'package:cicoffee_app/widgets/login.dart';
import 'package:cicoffee_app/widgets/sign_up.dart';
import 'package:cicoffee_app/widgets/welcome.dart';
import 'package:flutter/cupertino.dart';


abstract class Router {
  static final String welcome = "/welcome";
  static final String login = "/login";
  static final String signUp = "/sign-up";
  static final String home = "/home";


  static final Map<String, WidgetBuilder> routeBindings = {
    welcome: (context) => Welcome(),
    login: (context) => Login(),
    signUp: (context) => SignUp(),
    home: (context) => Home(),

  };
}
