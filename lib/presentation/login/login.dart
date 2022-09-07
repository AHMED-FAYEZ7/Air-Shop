import 'package:air_shop/app/di.dart';
import 'package:air_shop/presentation/login/login_viewmodel.dart';
import 'package:air_shop/presentation/resources/assets_manager.dart';
import 'package:air_shop/presentation/resources/color_manager.dart';
import 'package:air_shop/presentation/resources/icons_manager.dart';
import 'package:air_shop/presentation/resources/routes_manager.dart';
import 'package:air_shop/presentation/resources/strings_manager.dart';
import 'package:air_shop/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind(){
    _viewModel.start();
    _emailController.addListener(() => _viewModel.setEmail(_emailController.text));
    _passwordController.addListener(() => _viewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget(){
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSize.s100,),
                  Image.asset(
                    ImageAssets.splashLogo,
                    height: 150,
                    width: 150,
                    scale: 1,
                  ),
                  const SizedBox(height: AppSize.s40,),
                  StreamBuilder<bool>(
                    stream: _viewModel.outputIsEmailValid,
                    builder: (context ,snapshot){
                      return TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              IconBroken.User,
                            ),
                            hintText: AppStrings.emailHint,
                            labelText: AppStrings.emailHint,
                            filled: true,
                            fillColor: ColorManager.whiteOpacity70,
                            errorText: (snapshot.data ?? true) ? null : AppStrings.invalidEmail
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: AppSize.s20,),
                  StreamBuilder<bool>(
                    stream: _viewModel.outputIsPasswordValid,
                    builder: (context ,snapshot){
                      return TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              IconBroken.Lock,
                            ),
                            hintText: AppStrings.password,
                            labelText: AppStrings.password,
                            filled: true,
                            fillColor: ColorManager.whiteOpacity70,
                            errorText: (snapshot.data ?? true) ? null : AppStrings.passwordError
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: AppSize.s20,),
                  StreamBuilder<bool>(
                    stream: _viewModel.outputAllInputsValid,
                    builder: (context,snapshot){
                      return SizedBox(
                        height: AppSize.s40,
                        width: AppSize.inf,
                        child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? (){
                            _viewModel.login();
                          } : null,
                          child: const Text(
                              AppStrings.login
                          ),
                        ),
                      );
                    },
                  ),
                  // const SizedBox(height: AppSize.s16,),
                  Row(
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(
                              context, Routes.forgotPasswordRoute);
                        },
                        child: Text(
                          AppStrings.forgetPassword,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(
                              context, Routes.registerRoute);
                        },
                        child: Text(
                          AppStrings.registerText,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}