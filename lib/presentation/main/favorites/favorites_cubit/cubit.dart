import 'dart:ffi';

import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/usecase/fav_usecase.dart';
import 'package:air_shop/presentation/main/favorites/favorites_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesStates>{

  FavoritesCubit(this._favUseCase) : super(FavoritesInitialState());

  static FavoritesCubit get(context) => BlocProvider.of<FavoritesCubit>(context);
  FavUseCase _favUseCase;

  List<FavDataList>? favorites =[];

  getFavorites() async{
    emit(LoadingFavoritesState());
    print('fesdss');
    (await _favUseCase.execute(Void)).fold((failure) {
      emit(ErrorFavoritesState(failure.message));
      print('fesdpppss');
    }, (favoritesObject) {
      favorites = favoritesObject.data.dataList;
      emit(SuccessFavoritesState());
      print('fesdppphgthfrss');
    });
  }
}