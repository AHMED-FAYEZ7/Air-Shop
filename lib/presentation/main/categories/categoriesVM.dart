import 'dart:ffi';

import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/usecase/categories_usecase.dart';
import 'package:air_shop/presentation/base/base_viewmodel.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';

class CategoriesVM extends BaseViewModel {

  final CategoriesUseCase _categoriesUseCase;
  List<CatData>? categories =[];

  CategoriesVM(this._categoriesUseCase);

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
      categories = categoriesObject.data.catData;
    });
  }
}

