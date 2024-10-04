import 'package:mobx/mobx.dart';
import 'package:whaticket_app/src/models/auth_model.dart';
import 'package:whaticket_app/src/services/auth_service.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final Authentication authentication;
  _AuthController(this.authentication);

  @computed
  bool get isLogged => auth?.token?.isNotEmpty ?? false;

  @observable
  AuthModel? auth = AuthModel();

  @action
  void setAuth(AuthModel? value) {
    auth = value;
  }

  Future<void> login(String email, String password) async {
    try {
      final r = await authentication.login(email: email, password: password);
      setAuth(r);
    } catch (e) {
      print(e);
      //mostrar notificação de erro
    }
  }

  Future<void> verifyAuth() async {
    try {
      final r = await authentication.verifyAuth();
      setAuth(r);
    } catch (e) {
      print(e);
      //redirecionar para login
    }
  }
}
