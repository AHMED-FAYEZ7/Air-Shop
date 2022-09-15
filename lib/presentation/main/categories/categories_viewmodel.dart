import 'dart:async';
import 'dart:ffi';

import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/usecase/categories_usecase.dart';
import 'package:air_shop/presentation/base/base_viewmodel.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/subjects.dart';

class CategoriesViewModel extends BaseViewModel
    with CategoriesViewModelInputs,CategoriesViewModelOutputs{

  final CategoriesUseCase _categoriesUseCase;
  final StreamController _CatecoriesStreamController = BehaviorSubject<List<CatData>>();

  CategoriesViewModel(this._categoriesUseCase);

  @override
  void start() {
    _getCategories();
  }

  _getCategories() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));

    (await _categoriesUseCase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }, (categoriesObject) {
      inputState.add(ContentState());
      _CatecoriesStreamController.add(categoriesObject.data.catData);
    });
  }

  @override
  void dispose() {
    _CatecoriesStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputCategories => _CatecoriesStreamController.sink;

  @override
  Stream<List<CatData>> get outputCategories => _CatecoriesStreamController
      .stream.map((categories) => categories);
}

abstract class CategoriesViewModelInputs{
  Sink get inputCategories;
}

abstract class CategoriesViewModelOutputs{
  Stream<List<CatData>> get outputCategories;
}