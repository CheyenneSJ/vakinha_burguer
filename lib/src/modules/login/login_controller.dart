
import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:vakinha_burguer/src/repositories/auth/login_service.dart';

import '../../core/exceptions/unauthorized_exception.dart';
part 'login_controller.g.dart';


 enum LoginStateStatus{
  initial, loading, success, error,
 }

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
final LoginService _loginService;
@readonly
var _loginstatus = LoginStateStatus.initial;
@readonly
String? _errorMessage;

LoginControllerBase(this._loginService);

@action
Future<void> login(String email, String password) async {
try {
  _loginstatus = LoginStateStatus.loading;
  await _loginService.execute(email, password);
  _loginstatus = LoginStateStatus.success;
} on UnauthorizedException {
  _errorMessage = 'Login ou senha inválidos';
  _loginstatus = LoginStateStatus.error;
}catch (e, s){
  log('Erro ao realizar login', error: e, stackTrace: s);
  _errorMessage = 'Tente novamente mais tarde';
    _loginstatus = LoginStateStatus.error;

}
}
}   