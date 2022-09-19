import 'dart:async';
import 'dart:ffi';

import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/usecase/fav_usecase.dart';
import 'package:air_shop/presentation/base/base_viewmodel.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/state_renderer/state_renderer.dart';

class FavoritesViewModel extends BaseViewModel
    with FavoritesViewModelInputs,FavoritesViewModelOutputs{
  final FavUseCase _favUseCase;

  FavoritesViewModel(this._favUseCase);

  final StreamController _favoritesStreamController = BehaviorSubject<List<FavDataList>>();
  final StreamController _changeFavoritesStreamController = BehaviorSubject<void>();

  @override
  void start() {
    getFavorites();
  }

  getFavorites() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));

    (await _favUseCase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (favoritesObject) {
      inputState.add(ContentState());
      _favoritesStreamController.add(favoritesObject.data.dataList);
    });
  }


  @override
  void dispose() {
    _favoritesStreamController.close();
    _changeFavoritesStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputFavorites => _favoritesStreamController.sink;

  @override
  Stream<List<FavDataList>> get outputFavorites => _favoritesStreamController.stream
        .map((favorites) => favorites);


}

abstract class FavoritesViewModelInputs{
  Sink get inputFavorites;
}

abstract class FavoritesViewModelOutputs{
  Stream<List<FavDataList>> get outputFavorites;
}