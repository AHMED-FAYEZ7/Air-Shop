import 'dart:async';

import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/usecase/categories_usecase.dart';
import 'package:air_shop/domain/usecase/home_usecase.dart';
import 'package:air_shop/presentation/base/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel{
  HomeUseCase _homeUseCase;
  CategoriesUseCase _categoriesUseCase;

  final StreamController _bannersStreamController = BehaviorSubject<List<Banners>>();
  final StreamController _productsStreamController = BehaviorSubject<List<Products>>();
  final StreamController _categoriesStreamController = BehaviorSubject<List<CatData>>();

  HomeViewModel(this._homeUseCase,this._categoriesUseCase);

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void dispose() {
    _bannersStreamController.close();
    _productsStreamController.close();
    _categoriesStreamController.close();
    super.dispose();
  }

}