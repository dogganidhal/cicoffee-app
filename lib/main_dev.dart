import 'package:cicoffee_app/widgets/app.dart';
import 'package:flutter/material.dart';

import 'config/config.dart';
import 'config/container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureContainer(Environment.DEV);
  runApp(CICoffeeApp());
}
