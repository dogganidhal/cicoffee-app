import 'package:cicoffee_app/widgets/app.dart';
import 'package:cicoffee_app/config/config.dart';
import 'package:flutter/material.dart';


void main() async {
  runApp(CICoffeeApp(config: Config.local()));
}