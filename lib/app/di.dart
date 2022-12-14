import 'package:air_shop/app/app_prefs.dart';
import 'package:air_shop/data/data_source/remote_data_source.dart';
import 'package:air_shop/data/network/app_api.dart';
import 'package:air_shop/data/network/dio_factory.dart';
import 'package:air_shop/data/network/natwork_info.dart';
import 'package:air_shop/data/repository/repository_impl.dart';
import 'package:air_shop/domain/repository/repository.dart';
import 'package:air_shop/domain/usecase/cart_usecase.dart';
import 'package:air_shop/domain/usecase/categories_usecase.dart';
import 'package:air_shop/domain/usecase/change_favorites_usecase.dart';
import 'package:air_shop/domain/usecase/home_usecase.dart';
import 'package:air_shop/domain/usecase/login_usecase.dart';
import 'package:air_shop/presentation/login/login_viewmodel.dart';
import 'package:air_shop/presentation/main/cart/cart_vm.dart';
import 'package:air_shop/presentation/main/categories/categoriesVM.dart';
import 'package:air_shop/presentation/main/favorites/favorites_viewmodel.dart';
import 'package:air_shop/presentation/main/home/home_viewmodel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/usecase/change_carts.dart';
import '../domain/usecase/fav_usecase.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(DataConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImplementer(instance()));

  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(),instance()));
}

initLoginModule(){
  if(!GetIt.I.isRegistered<LoginUseCase>()){
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initHomeModule(){
  if(!GetIt.I.isRegistered<HomeUseCase>()){
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance(),instance(),instance(),instance()));
  }
}

initCategoriesModule(){
  if(!GetIt.I.isRegistered<CategoriesUseCase>()){
    instance.registerFactory<CategoriesUseCase>(() => CategoriesUseCase(instance()));
    instance.registerFactory<CategoriesVM>(() => CategoriesVM(instance()));
  }
}

initFavoritesModule(){
  if(!GetIt.I.isRegistered<FavUseCase>()){
    instance.registerFactory<FavUseCase>(() => FavUseCase(instance()));
    instance.registerFactory<FavoritesViewModel>(() => FavoritesViewModel(instance()));
  }
}

initChangeFavoritesModule(){
  if(!GetIt.I.isRegistered<ChaneFavoritesUseCase>()){
    instance.registerFactory<ChaneFavoritesUseCase>(() => ChaneFavoritesUseCase(instance()));
  }
}

initCartsModule(){
  if(!GetIt.I.isRegistered<CartUseCase>()){
    instance.registerFactory<CartUseCase>(() => CartUseCase(instance()));
    instance.registerFactory<CartsViewModel>(() => CartsViewModel(instance()));
  }
}

initChangeCartsModule(){
  if(!GetIt.I.isRegistered<ChaneCartsUseCase>()){
    instance.registerFactory<ChaneCartsUseCase>(() => ChaneCartsUseCase(instance()));
  }
}

resetAllModules(){
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initHomeModule();
  initCategoriesModule();
  initFavoritesModule();
  initChangeFavoritesModule();
  initCartsModule();
  initChangeCartsModule();
}