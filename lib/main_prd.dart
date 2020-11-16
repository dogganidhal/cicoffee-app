import 'package:cicoffee_app/widgets/app.dart';
import 'package:cicoffee_app/config/config.dart';
import 'package:cicoffee_app/config/container.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureContainer(Environment.PRD);
  runApp(CICoffeeApp());
}
