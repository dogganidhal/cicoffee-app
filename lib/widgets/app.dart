import 'package:cicoffee_app/widgets/auth_container.dart';
import 'package:flutter/material.dart';


class CICoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xff6355C3);
    final primaryColorDark = Color(0xff1A2384);
    return MaterialApp(
      title: 'CiCoffee',
      theme: ThemeData(
        primaryColorDark: primaryColorDark,
        primaryColor: primaryColorDark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'ProductSans',
        cursorColor: primaryColor,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AuthContainer(),
    );
  }
}
