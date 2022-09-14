import 'dart:async';
import 'package:air_shop/app/functions.dart';
import 'package:air_shop/domain/usecase/login_usecase.dart';
import 'package:air_shop/presentation/base/base_viewmodel.dart';
import 'package:air_shop/presentation/common/freezed_data_classes.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {

  final StreamController _emailStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController = StreamController<void>.broadcast();
  StreamController isUserLoggedInSuccessfullyStreamController = StreamController<String>();
  var loginObject = LoginObject("","");

  LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  // inputs
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
    _isAllInputValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  login() async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _loginUseCase.execute(LoginUseCaseInput(loginObject.email, loginObject.password)))
        .fold((failure) => {
    inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message))
    }, (data)  {
          inputState.add(ContentState());
          isUserLoggedInSuccessfullyStreamController.add(data.data?.token);
    });
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    loginObject = loginObject.copyWith(
        email: email
    );
    _validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
      password: password
    );
    _validate();
  }

  @override
  Sink get inputAllInputsValid => _isAllInputValidStreamController.sink;

  //---outputs-----

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<bool> get outputIsPasswordValid =>
      _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputAllInputsValid =>
      _isAllInputValidStreamController.stream.map((_) => _isAllInputSValid());

  //--------private----------

  _validate(){
    inputAllInputsValid.add(null);
  }

  _isPasswordValid(String password){
    return password.isNotEmpty;
  }

  bool _isAllInputSValid(){
    return _isPasswordValid(loginObject.password) &&
        isEmailValid(loginObject.email);
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
  Sink get inputAllInputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputAllInputsValid;
}