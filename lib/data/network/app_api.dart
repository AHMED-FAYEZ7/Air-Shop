import 'package:air_shop/app/constant.dart';
import 'package:air_shop/data/response/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient{
  factory AppServiceClient(Dio dio,{String baseUrl}) = _AppServiceClient;

  @POST("login")
  Future<AuthenticationResponse> login(
      @Field("email") String email,
      @Field("password") String password,
      );

  @GET("home")
  Future<HomeResponse> getHome();

  @GET("categories")
  Future<CategoriesResponse> getCategories();

  @GET("favorites")
  Future<FavResponse> getFavorites();

  @POST("favorites")
  Future<ChangeFavoritesResponse> changeFavorites(
      @Field("product_id") int productId,
      );
}