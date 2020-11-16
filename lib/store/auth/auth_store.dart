import 'package:cicoffee_app/api/dto/member_dto.dart';
import 'package:cicoffee_app/api/dto/token_dto.dart';
import 'package:cicoffee_app/store/login/login_store.dart';
import 'package:cicoffee_app/store/sign_up/sign_up_store.dart';
import 'package:mobx/mobx.dart';


part 'auth_store.g.dart';


class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {

  final loginStore = LoginStore();
  final signUpStore = SignUpStore();

  @observable
  MemberDto member;

  @observable
  TokenDto token;

  @computed
  bool get userConnected => token != null;

  @action
  Future loadFromDisk() async {

  }

  @action
  Future login(String email, String password) async {

  }

}
