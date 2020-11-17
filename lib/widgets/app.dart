import 'package:cicoffee_app/widgets/auth_container.dart';
import 'package:flutter/material.dart';


class CICoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xff1A2384);
    return MaterialApp(
      title: 'CiCoffee',
      theme: ThemeData(
        primaryColorDark: primaryColor,
        primaryColor: primaryColor,
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
          )
        )
      ),
      home: AuthContainer(),
    );
  }
}
