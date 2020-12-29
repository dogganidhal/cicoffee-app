import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;


abstract class _NavigationStore with Store {
  final GlobalKey<NavigatorState> navigatorKey;

  _NavigationStore({@required this.navigatorKey});

  @action
  Future navigateToHome([Object argument]) async {
    _popAll();
    navigatorKey.currentState.pushReplacementNamed("/home", arguments: argument);
  }

  @action
  Future navigateToWelcome() async {
    navigatorKey.currentState.pushReplacementNamed("/welcome");
  }

  @action
  Future navigateToLogin([Object argument]) async {
    navigatorKey.currentState.pushNamed("/login", arguments: argument);
  }

  @action
  Future navigateToSignUp() async {
    navigatorKey.currentState.pushNamed("/sign-up");
  }

  @action
  Future popAndNavigateToLogin() async {
    navigatorKey.currentState.popAndPushNamed("/login");
  }

  @action
  Future navigateToInvitationQR() async {
    navigatorKey.currentState.pushNamed("/invitation-qr");
  }

  @action
  Future pop() async {
    navigatorKey.currentState.pop();
  }

  void _popAll() {
    while (navigatorKey.currentState.canPop()) {
      navigatorKey.currentState.pop();
    }
  }
}
