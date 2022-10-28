import 'package:air_shop/data/network/app_api.dart';
import 'package:air_shop/data/request/request.dart';
import 'package:air_shop/data/response/responses.dart';

abstract class RemoteDataSource{
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<HomeResponse> getHome();
  Future<CategoriesResponse> getCategories();
  Future<FavResponse> getFavorites();
  Future<ChangeFavoritesResponse> changeFavorites(ChangeFavRequest changeFavRequest);
  Future<CartResponse> getCarts();
  Future<ChangeCartsResponse> changeCarts(ChangeCartsRequest changeCartsRequest);
  Future<SettingsResponse> getSettings();
}

class RemoteDataSourceImplementer implements RemoteDataSource{
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async{
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }

  @override
  Future<CategoriesResponse> getCategories() async {
    return await _appServiceClient.getCategories();
  }

  @override
  Future<HomeResponse> getHome() async {
    return await _appServiceClient.getHome();
  }


  @override
  Future<FavResponse> getFavorites() async {
    return await _appServiceClient.getFavorites();
  }

  @override
  Future<ChangeFavoritesResponse> changeFavorites(ChangeFavRequest changeFavRequest) async {
    return await _appServiceClient.changeFavorites(
        changeFavRequest.productId,
    );
  }

  @override
  Future<CartResponse> getCarts() async {
    return await _appServiceClient.getCarts();
  }

  @override
  Future<ChangeCartsResponse> changeCarts(ChangeCartsRequest changeCartsRequest) async{
    return await _appServiceClient.changeCarts(
      changeCartsRequest.productId,
    );
  }

  @override
  Future<SettingsResponse> getSettings() async {
    return await _appServiceClient.getSettings();
  }

}