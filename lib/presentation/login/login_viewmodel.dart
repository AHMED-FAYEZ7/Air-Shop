import 'dart:async';

import 'package:air_shop/app/functions.dart';
import 'package:air_shop/domain/usecase/login_usecase.dart';
import 'package:air_shop/presentation/base/base_viewmodel.dart';


class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {

  final StreamController _emailStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController = StreamController<void>.broadcast();
  StreamController isUserLoggedInSuccessfullyStreamController = StreamController<String>();

  // var loginObject = LoginObject("","");

  LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  // inputs
  @override
  void start() {
    // TODO: implement start
  }

  @override
  void dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
    // _isAllInputValidStreamController.close();
    // isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  login(){}

  @override
  setEmail(String email) {
    inputEmail.add(email);
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
  }

  //---outputs-----

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<bool> get outputIsPasswordValid =>
      _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  //--------private----------

  _isPasswordValid(String password){
    return password.isNotEmpty;
  }

}

abstract class LoginViewModelInputs {
  // three functions for actions
  setEmail(String email);
  setPassword(String password);
  login();
// two sinks for streams
  Sink get inputEmail;
  Sink get inputPassword;
  // Sink get inputAllInputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputIsPasswordValid;
  // Stream<bool> get outputAllInputsValid;
}