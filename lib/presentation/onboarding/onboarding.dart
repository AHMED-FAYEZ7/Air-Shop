import 'package:air_shop/app/app_prefs.dart';
import 'package:air_shop/app/di.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:air_shop/presentation/resources/color_manager.dart';
import 'package:air_shop/presentation/resources/routes_manager.dart';
import 'package:air_shop/presentation/resources/strings_manager.dart';
import 'package:air_shop/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final PageController _pageController = PageController(initialPage: 0);
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();


  _bind(){
    _appPreferences.setOnBoardingScreenViewed();
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SlideViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context ,snapshot){
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SlideViewObject? slideViewObject){
    if(slideViewObject == null){
      return Container();
    }else {
        return Scaffold(
          backgroundColor: ColorManager.white,
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
            elevation: AppSize.s0,
            backgroundColor: ColorManager.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          body:
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: slideViewObject.numOfSlides,
            onPageChanged: (index){
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (context , index){
              return OnBoardingPage(slideViewObject.sliderObject);
            },
          ),
          bottomSheet: Container(
            color: ColorManager.white,
            height: AppSize.s140,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    effect: ExpandingDotsEffect(
                      dotColor: ColorManager.grey,
                      activeDotColor: ColorManager.primary,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                    ),
                    count: slideViewObject.numOfSlides,
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    backgroundColor: ColorManager.primary,
                    onPressed:()
                    {
                      if(_viewModel.isLast)
                      {
                        Navigator.pushReplacementNamed(context, Routes.loginRoute);
                      }else
                      {
                        _pageController.nextPage(
                          duration: const Duration(
                            milliseconds: 800,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: ColorManager.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;
  OnBoardingPage(this._sliderObject,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s20,),
        Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p20,
            right: AppPadding.p20,
            left: AppPadding.p20,
          ),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SvgPicture.asset(_sliderObject.image),
        )),
        const SizedBox(height: AppSize.s100,)
      ],
    );
  }
}

