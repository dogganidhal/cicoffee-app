import 'package:cicoffee_app/config/config.dart';
import 'package:cicoffee_app/config/container.dart';
import 'package:cicoffee_app/config/onesignal.dart';
import 'package:cicoffee_app/config/dynamic_links.dart';
import 'package:flutter/material.dart';


class AppConfigurer extends StatefulWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;
  final Config config;

  AppConfigurer({
    Key key,
    @required this.child,
    @required this.navigatorKey,
    @required this.config
  }) : super(key: key);

  @override
  _AppConfigurerState createState() => _AppConfigurerState();
}

class _AppConfigurerState extends State<AppConfigurer> {
  @override
  void initState() {
    super.initState();
    configureContainer(widget.config, widget.navigatorKey);
    configureOneSignal(widget.config);
    configureDynamicLinks(widget.config, context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
