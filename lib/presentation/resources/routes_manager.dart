
import 'package:air_shop/app/di.dart';
import 'package:air_shop/presentation/forgot_password/forgot_password.dart';
import 'package:air_shop/presentation/login/login.dart';
import 'package:air_shop/presentation/main/main.dart';
import 'package:air_shop/presentation/onboarding/onboarding.dart';
import 'package:air_shop/presentation/register/register.dart';
import 'package:air_shop/presentation/resources/strings_manager.dart';
import 'package:air_shop/presentation/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes
{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  // static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator
{
  static Route<dynamic> getRoute(RouteSettings routeSettings)
  {
    switch (routeSettings.name)
    {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        // initRegisterModule();
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgotPasswordRoute:
        // initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.mainRoute:
        initHomeModule();
        initCategoriesModule();
        return MaterialPageRoute(builder: (_) => MainView());
      // case Routes.storeDetailsRoute:
      //   initStoreDetailsModule();
      //   return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute()
  {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}