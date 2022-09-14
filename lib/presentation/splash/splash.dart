import 'dart:async';

import 'package:air_shop/app/app_prefs.dart';
import 'package:air_shop/app/di.dart';
import 'package:air_shop/presentation/resources/assets_manager.dart';
import 'package:air_shop/presentation/resources/color_manager.dart';
import 'package:air_shop/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  final AppPreferences _appPreferences = instance<AppPreferences>();

  Timer? _timer;
  _startDelay(){
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isIsUserLoggedIn) => {
      if(isIsUserLoggedIn){
        Navigator.pushReplacementNamed(context, Routes.mainRoute)
      }else{
          _appPreferences.isOnBoardingScreenViewed().then((isOnBoardingScreenViewed) => {
            if(isOnBoardingScreenViewed){
              Navigator.pushReplacementNamed(context, Routes.loginRoute)
            }else{
                Navigator.pushReplacementNamed(context, Routes.onBoardingRoute)
            }
          })
        }
      }
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
      child:
        Image.asset(
          ImageAssets.splashLogo,
          height: 200,
          width: 200,
          scale: .1,
        ),
        ),
    );
  }
}
