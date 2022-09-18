import 'package:air_shop/data/network/app_api.dart';
import 'package:air_shop/data/request/request.dart';
import 'package:air_shop/data/response/responses.dart';

abstract class RemoteDataSource{
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<HomeResponse> getHome();
  Future<CategoriesResponse> getCategories();
  Future<FavResponse> getFavorites();
}

class RemoteDataSourceImplementer implements RemoteDataSource{
  AppServiceClient _appServiceClient;

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

}