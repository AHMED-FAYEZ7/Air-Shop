import 'dart:ffi';

import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/usecase/fav_usecase.dart';
import 'package:air_shop/presentation/base/base_viewmodel.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';

import '../../common/state_renderer/state_renderer.dart';

class FavoritesViewModel extends BaseViewModel {
  final FavUseCase _favUseCase;
  List<FavDataList>? favorites =[];

  FavoritesViewModel(this._favUseCase);


  @override
  void start() {
    _getFavorites();
  }

  _getFavorites() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _favUseCase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (favoritesObject) {
      inputState.add(ContentState());
      favorites = favoritesObject.data.dataList;
      // for (var element in favoritesObject.data.dataList) {
      //   favorites.addAll({
      //     element.product.id : element.product.inFavorites,
      //   });
      // }
    });
  }

}

