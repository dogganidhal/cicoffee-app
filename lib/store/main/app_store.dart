import 'package:cicoffee_app/store/auth/auth_store.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {

  final auth = AuthStore();

}
