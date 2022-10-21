import 'dart:ffi';

import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/usecase/cart_usecase.dart';
import 'package:air_shop/presentation/base/base_viewmodel.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';

import '../../common/state_renderer/state_renderer.dart';

class CartsViewModel extends BaseViewModel {
  final CartUseCase _cartUseCase;
  List<CartItem>? carts =[];

  CartsViewModel(this._cartUseCase);


  @override
  void start() {
    _getCarts();
  }

  _getCarts() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _cartUseCase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (favoritesObject) {
      inputState.add(ContentState());
      carts = favoritesObject.data.cartItems;
    });
  }

}

