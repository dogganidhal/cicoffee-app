import 'package:cicoffee_app/widgets/auth_container.dart';
import 'package:flutter/material.dart';


class CICoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CiCoffee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthContainer(),
    );
  }
}
