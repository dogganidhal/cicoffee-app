import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;


abstract class _NavigationStore with Store {
  final GlobalKey<NavigatorState> navigatorKey;

  _NavigationStore({@required this.navigatorKey});

  @action
  Future navigateToHome() async {
    _popAll();
    navigatorKey.currentState.pushReplacementNamed("/home");
  }

  @action
  Future navigateToWelcome() async {
    navigatorKey.currentState.pushReplacementNamed("/welcome");
  }

  @action
  Future navigateToLogin() async {
    navigatorKey.currentState.pushNamed("/login");
  }

  @action
  Future navigateToSignUp() async {
    navigatorKey.currentState.pushNamed("/sign-up");
  }

  void _popAll() {
    while (navigatorKey.currentState.canPop()) {
      navigatorKey.currentState.pop();
    }
  }
}
