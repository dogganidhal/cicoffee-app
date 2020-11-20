import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/api/dto/login_dto.dart';
import 'package:cicoffee_app/api/dto/member_dto.dart';
import 'package:cicoffee_app/api/dto/token_dto.dart';
import 'package:cicoffee_app/service/session.dart';
import 'package:cicoffee_app/store/navigation/navigation_store.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';


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
    await Future.delayed(Duration(seconds: 3));
    token = await session.getCredentials();
    member = await session.getMember();
    loading = false;
    if (userConnected)
      navigationStore.navigateToHome();
    else
      navigationStore.navigateToWelcome();
  }

  @action
  Future login(String email, String password) async {
    token = await apiClient.auth.login(LoginDto(email: email, password: password));
    await session.persistCredentials(token);
    member = await apiClient.members.getMember();
    await session.setMember(member);
    await navigationStore.navigateToHome();
  }

  @action
  Future logout() async {
    member = null;
    token = null;
    await session.clearCredentials();
    await session.clearMember();
    navigationStore.navigateToWelcome();
  }

}
