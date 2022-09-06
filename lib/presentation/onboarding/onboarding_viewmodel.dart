import 'dart:async';

import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/presentation/base/base_viewmodel.dart';
import 'package:air_shop/presentation/resources/assets_manager.dart';
import 'package:air_shop/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs,OnBoardingViewModelOutputs{

  final StreamController _streamController = StreamController<SlideViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;
  bool isLast = false;


  // inputs

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderDate();
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // outputs
  
  @override
  Stream<SlideViewObject> get outputSliderViewObject => _streamController.stream.map((slideViewObject) => slideViewObject);

  // private func
  List<SliderObject> _getSliderDate() => [
    SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
    SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
    SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
  ];

  _postDataToView(){
    inputSliderViewObject.add(SlideViewObject(_list[_currentIndex],_list.length,_currentIndex));
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
    if(index == _list.length - 1)
    {
        isLast == true;
    }else
    {
        isLast == false;
    }
  }

}

abstract class OnBoardingViewModelInputs{
  void onPageChanged(int index);
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs{
  Stream<SlideViewObject> get outputSliderViewObject;
}

class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SlideViewObject(this.sliderObject,this.numOfSlides,this.currentIndex);
}