import 'dart:async';
import 'dart:ffi';

import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/usecase/categories_usecase.dart';
import 'package:air_shop/domain/usecase/home_usecase.dart';
import 'package:air_shop/presentation/base/base_viewmodel.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/usecase/change_favorites_usecase.dart';

class HomeViewModel extends BaseViewModel with HomeViewModelInputs,HomeViewModelOutputs{
  final HomeUseCase _homeUseCase;
  final CategoriesUseCase _categoriesUseCase;
  final ChaneFavoritesUseCase _changeFavoritesUseCase;

  final StreamController _bannersStreamController = BehaviorSubject<List<Banners>>();
  final StreamController _productsStreamController = BehaviorSubject<List<Products>>();
  final StreamController _categoriesStreamController = BehaviorSubject<List<CatData>>();
  Map<int , bool>? favorites = {};

  HomeViewModel(this._homeUseCase,this._categoriesUseCase,this._changeFavoritesUseCase);

  // -------------input------------
  @override
  void start() {
    _getHome();
  }

  _getHome() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));

    (await _homeUseCase.execute(Void)).fold((failure)  {
      inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (homeObject) {
      inputState.add(ContentState());
      inputBanners.add(homeObject.data.banners);
      inputProducts.add(homeObject.data.products);
      for (var element in homeObject.data.products) {
        favorites!.addAll({
          element.id : element.inFavorites,
        });
      }
      print(favorites.toString());
    });

    (await _categoriesUseCase.execute(Void)).fold((failure) {
    }, (categoriesObject) {
      inputCategorise.add(categoriesObject.data.catData);
    });

  }

  @override
  void dispose() {
    _bannersStreamController.close();
    _productsStreamController.close();
    _categoriesStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputBanners => _bannersStreamController.sink;

  @override
  Sink get inputCategorise => _categoriesStreamController.sink;

  @override
  Sink get inputProducts => _productsStreamController.sink;

  // --------output----------------
  @override
  Stream<List<Banners>> get outputBanners => _bannersStreamController.stream.map((banners) => banners);

  @override
  Stream<List<CatData>> get outputCategorise => _categoriesStreamController.stream.map((categories) => categories);

  @override
  Stream<List<Products>> get outputProducts => _productsStreamController.stream.map((products) => products);

  @override
  void changeFavorites(int productId) async{
    favorites![productId] = !favorites![productId]!;
    (await _changeFavoritesUseCase.execute(ChangeFavoritesUseCaseInput(productId)))
        .fold((failure) {
    }, (changeFavoritesObject) {});
  }


}

abstract class HomeViewModelInputs{
  void changeFavorites(int productId);
  Sink get inputBanners;
  Sink get inputProducts;
  Sink get inputCategorise;
}

abstract class HomeViewModelOutputs{
  Stream<List<Banners>> get outputBanners;
  Stream<List<Products>> get outputProducts;
  Stream<List<CatData>> get outputCategorise;
}
