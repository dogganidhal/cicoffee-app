import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/api/dto/create_member_dto.dart';
import 'package:cicoffee_app/api/exception/api_exception.dart';
import 'package:cicoffee_app/store/navigation/navigation_store.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  final ApiClient apiClient;
  final NavigationStore navigationStore;

  @observable
  bool loading = false;
  @observable
  ApiError error;

  _SignUpStore({@required this.apiClient, @required this.navigationStore});

  @action
  Future signUp({
    String email,
    String password,
    String firstName,
    String lastName
  }) async {
    error = null;
    loading = true;
    try {
      await apiClient.members.signUp(CreateMemberDto(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName
      ));
      await navigationStore.popAndNavigateToLogin();
    } on ApiError catch (apiError) {
      error = apiError;
    }
    loading = false;
  }
}
