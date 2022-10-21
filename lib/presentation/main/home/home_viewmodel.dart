import 'dart:ffi';

import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/usecase/categories_usecase.dart';
import 'package:air_shop/domain/usecase/home_usecase.dart';
import 'package:air_shop/presentation/base/base_viewmodel.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';

import '../../../domain/usecase/change_favorites_usecase.dart';

class HomeViewModel extends BaseViewModel{
  final HomeUseCase _homeUseCase;
  final CategoriesUseCase _categoriesUseCase;
  final ChaneFavoritesUseCase _changeFavoritesUseCase;
  List<Banners>? banners =[];
  List<Products>? products =[];
  List<CatData>? categories =[];

  late Map<int , bool>? favorites = {};

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
      banners = homeObject.data.banners;
      products= homeObject.data.products;
      for (var element in homeObject.data.products) {
        favorites!.addAll({
          element.id : element.inFavorites,
        });
      }
      print(favorites.toString());
    });

    (await _categoriesUseCase.execute(Void)).fold((failure) {
    }, (categoriesObject) {
      inputState.add(ContentState());
      categories = categoriesObject.data.catData;
    });

  }

  void changeFavorites(int productId) async{
    favorites![productId] = !favorites![productId]!;
    (await _changeFavoritesUseCase.execute(ChangeFavoritesUseCaseInput(productId)))
        .fold((failure) {
      // favorites![productId] = !favorites![productId]!;
    }, (changeFavoritesObject) {
      // favorites![productId] = !favorites![productId]!;

    });
  }


}
