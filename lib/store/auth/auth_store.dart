import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/api/dto/login_dto.dart';
import 'package:cicoffee_app/api/dto/create_mobile_device_dto.dart';
import 'package:cicoffee_app/api/dto/member_dto.dart';
import 'package:cicoffee_app/api/dto/token_dto.dart';
import 'package:cicoffee_app/service/session.dart';
import 'package:cicoffee_app/store/navigation/navigation_store.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:device_info/device_info.dart';
import 'dart:io' show Platform;
part 'auth_store.g.dart';


class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {

  final Session session;
  final ApiClient apiClient;
  final NavigationStore navigationStore;

  @observable
  bool loading = true;

  @observable
  MemberDto member;

  @observable
  TokenDto token;

  _AuthStore({@required this.session, @required this.apiClient, @required this.navigationStore});

  @computed
  bool get userConnected => token != null && member != null;

  @action
  Future loadFromDisk() async {
    token = await session.getCredentials();
    member = await session.getMember();
    loading = false;
    if (userConnected)
      navigationStore.navigateToHome();
    else
      navigationStore.navigateToWelcome();
  }

  @action
  Future login(String email, String password, String teamId) async {
    token = await apiClient.auth.login(LoginDto(email: email, password: password));
    await session.persistCredentials(token);
    member = await apiClient.members.getMember();
    await session.setMember(member);
    var status = await OneSignal.shared.getPermissionSubscriptionState();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var name;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      name = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      name = iosInfo.utsname.machine;
    }
    var team = apiClient.teams.joinTeam(teamId);
    apiClient.members.registerDevice(CreateMobileDeviceDto(name: name, identifier: status.subscriptionStatus.userId));
    await navigationStore.navigateToHome();
  }

  @action
  Future logout() async {
    member = null;
    token = null;
    await session.clearCredentials();
    await session.clearMember();
    var status = await OneSignal.shared.getPermissionSubscriptionState();
    apiClient.members.unregisterDevice(status.subscriptionStatus.userId);
    navigationStore.navigateToWelcome();
  }

}
