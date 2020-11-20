import 'package:cicoffee_app/config/config.dart';
import 'package:cicoffee_app/config/container.dart';
import 'package:flutter/material.dart';


class AppConfigurer extends StatefulWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;
  final Environment environment;

  AppConfigurer({
    Key key,
    @required this.child,
    @required this.navigatorKey,
    @required this.environment
  }) : super(key: key);

  @override
  _AppConfigurerState createState() => _AppConfigurerState();
}

class _AppConfigurerState extends State<AppConfigurer> {
  @override
  void initState() {
    super.initState();
    configureContainer(widget.environment, widget.navigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
