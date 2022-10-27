import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
}

// --------- login ----------
@JsonSerializable()
class UserDataResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "token")
  String? token;

  UserDataResponse(this.id,this.name,this.email,this.phone,this.image,this.token);

  factory UserDataResponse.fromJson(Map<String ,dynamic> json) => _$UserDataResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$UserDataResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: "data")
  UserDataResponse? data;

  AuthenticationResponse(this.data);

  factory AuthenticationResponse.fromJson(Map<String ,dynamic> json) => _$AuthenticationResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$AuthenticationResponseToJson(this);
}


// --------- home ----------
@JsonSerializable()
class BannersResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "image")
  String? image;


  BannersResponse(this.id,this.image);

  factory BannersResponse.fromJson(Map<String ,dynamic> json) => _$BannersResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$BannersResponseToJson(this);
}

@JsonSerializable()
class ProductsResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "old_price")
  double? oldPrice;
  @JsonKey(name: "discount")
  double? discount;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "in_favorites")
  bool? inFavorites;
  @JsonKey(name: "in_cart")
  bool? inCart;


  ProductsResponse(
      this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.description,
      this.images,
      this.inFavorites,
      this.inCart,
      );

  factory ProductsResponse.fromJson(Map<String ,dynamic> json) => _$ProductsResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$ProductsResponseToJson(this);
}

@JsonSerializable()
class HomeDataResponse{
  @JsonKey(name: "banners")
  List<BannersResponse>? banners;
  @JsonKey(name: "products")
  List<ProductsResponse>? products;

  HomeDataResponse(this.banners,this.products);

  factory HomeDataResponse.fromJson(Map<String ,dynamic> json) => _$HomeDataResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$HomeDataResponseToJson(this);
}

@JsonSerializable()
class HomeResponse extends BaseResponse{
  @JsonKey(name: "data")
  HomeDataResponse? data;

  HomeResponse(this.data);

  factory HomeResponse.fromJson(Map<String ,dynamic> json) => _$HomeResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$HomeResponseToJson(this);
}

// --------- categories ----------
@JsonSerializable()
class DataResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;

  DataResponse(this.id,this.name,this.image);

  factory DataResponse.fromJson(Map<String ,dynamic> json) => _$DataResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class CategoriesDataResponse{
  @JsonKey(name: "current_page")
  int? currentPage;
  @JsonKey(name: "data")
  List<DataResponse>? catData;

  CategoriesDataResponse(this.currentPage,this.catData);

  factory CategoriesDataResponse.fromJson(Map<String ,dynamic> json) => _$CategoriesDataResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$CategoriesDataResponseToJson(this);
}

@JsonSerializable()
class CategoriesResponse extends BaseResponse{
  @JsonKey(name: "data")
  CategoriesDataResponse? data;

  CategoriesResponse(this.data);

  factory CategoriesResponse.fromJson(Map<String ,dynamic> json) => _$CategoriesResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$CategoriesResponseToJson(this);
}
// ----------- fav -------------
@JsonSerializable()
class FavProductsResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "old_price")
  double? oldPrice;
  @JsonKey(name: "discount")
  double? discount;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;

  FavProductsResponse(
      this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.description,
      );

  factory FavProductsResponse.fromJson(Map<String ,dynamic> json) => _$FavProductsResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$FavProductsResponseToJson(this);
}

@JsonSerializable()
class FavDataListResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "product")
  FavProductsResponse? product;

  FavDataListResponse(
      this.id,
      this.product,
      );

  factory FavDataListResponse.fromJson(Map<String ,dynamic> json) => _$FavDataListResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$FavDataListResponseToJson(this);
}

@JsonSerializable()
class FavDataResponse{
  @JsonKey(name: "current_page")
  int? currentPage;
  @JsonKey(name: "data")
  List<FavDataListResponse>? dataList;
  // @JsonKey(name: "first_page_url")
  // String? firstPageUrl;
  // @JsonKey(name: "from")
  // int? from;
  // @JsonKey(name: "last_page")
  // int? lastPage;
  // @JsonKey(name: "last_page_url")
  // String? lastPageUrl;
  // @JsonKey(name: "next_page_url")
  // String? nextPageUrl;
  // @JsonKey(name: "path")
  // String? path;
  // @JsonKey(name: "per_page")
  // int? perPage;
  // @JsonKey(name: "prev_page_url")
  // String? prevPageUrl;
  // @JsonKey(name: "to")
  // int? to;
  // @JsonKey(name: "total")
  // int? total;

  FavDataResponse(
      this.currentPage,
      this.dataList,
      // this.firstPageUrl,
      // this.from,
      // this.lastPage,
      // this.lastPageUrl,
      // this.nextPageUrl,
      // this.path,
      // this.perPage,
      // this.prevPageUrl,
      // this.to,
      // this.total,
      );

  factory FavDataResponse.fromJson(Map<String ,dynamic> json) => _$FavDataResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$FavDataResponseToJson(this);
}

@JsonSerializable()
class FavResponse extends BaseResponse{
  @JsonKey(name: "data")
  FavDataResponse? data;

  FavResponse(
      this.data,
      );

  factory FavResponse.fromJson(Map<String ,dynamic> json) => _$FavResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$FavResponseToJson(this);
}
// ---------- change favorites ----------
@JsonSerializable()
class ChangeFavoritesProductsResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "old_price")
  double? oldPrice;
  @JsonKey(name: "discount")
  double? discount;
  @JsonKey(name: "image")
  String? image;

  ChangeFavoritesProductsResponse(
      this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      );

  factory ChangeFavoritesProductsResponse.fromJson(Map<String ,dynamic> json) => _$ChangeFavoritesProductsResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$ChangeFavoritesProductsResponseToJson(this);
}

@JsonSerializable()
class ChangeFavoritesDataResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "product")
  ChangeFavoritesProductsResponse? product;

  ChangeFavoritesDataResponse(
      this.id,
      this.product,
      );

  factory ChangeFavoritesDataResponse.fromJson(Map<String ,dynamic> json) => _$ChangeFavoritesDataResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$ChangeFavoritesDataResponseToJson(this);
}

@JsonSerializable()
class ChangeFavoritesResponse extends BaseResponse{
  @JsonKey(name: "data")
  ChangeFavoritesDataResponse? data;

  ChangeFavoritesResponse(
      this.data,
      );

  factory ChangeFavoritesResponse.fromJson(Map<String ,dynamic> json) => _$ChangeFavoritesResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$ChangeFavoritesResponseToJson(this);
}
//------------ carts --------------------
@JsonSerializable()
class CartProductsResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "old_price")
  double? oldPrice;
  @JsonKey(name: "discount")
  double? discount;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;

  CartProductsResponse(
      this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.description,
      );

  factory CartProductsResponse.fromJson(Map<String ,dynamic> json) => _$CartProductsResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$CartProductsResponseToJson(this);
}

@JsonSerializable()
class CartItemResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "product")
  CartProductsResponse? product;

  CartItemResponse(
      this.id,
      this.quantity,
      this.product,
      );

  factory CartItemResponse.fromJson(Map<String ,dynamic> json) => _$CartItemResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$CartItemResponseToJson(this);
}

@JsonSerializable()
class CartDataResponse{
  @JsonKey(name: "cart_items")
  List<CartItemResponse>? cartItems;
  @JsonKey(name: "total")
  double? total;

  CartDataResponse(
      this.cartItems,
      this.total,
      );

  factory CartDataResponse.fromJson(Map<String ,dynamic> json) => _$CartDataResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$CartDataResponseToJson(this);
}

@JsonSerializable()
class CartResponse extends BaseResponse{
  @JsonKey(name: "data")
  CartDataResponse? data;

  CartResponse(
      this.data,
      );

  factory CartResponse.fromJson(Map<String ,dynamic> json) => _$CartResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$CartResponseToJson(this);
}
// ---------- change carts ----------
@JsonSerializable()
class ChangeCartsProductsResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "old_price")
  double? oldPrice;
  @JsonKey(name: "discount")
  double? discount;
  @JsonKey(name: "image")
  String? image;

  ChangeCartsProductsResponse(
      this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      );

  factory ChangeCartsProductsResponse.fromJson(Map<String ,dynamic> json) => _$ChangeCartsProductsResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$ChangeCartsProductsResponseToJson(this);
}

@JsonSerializable()
class ChangeCartsDataResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "product")
  ChangeCartsProductsResponse? product;

  ChangeCartsDataResponse(
      this.id,
      this.quantity,
      this.product,
      );

  factory ChangeCartsDataResponse.fromJson(Map<String ,dynamic> json) => _$ChangeCartsDataResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$ChangeCartsDataResponseToJson(this);
}

@JsonSerializable()
class ChangeCartsResponse extends BaseResponse{
  @JsonKey(name: "data")
  ChangeCartsDataResponse? data;

  ChangeCartsResponse(
      this.data,
      );

  factory ChangeCartsResponse.fromJson(Map<String ,dynamic> json) => _$ChangeCartsResponseFromJson(json);
  Map<String ,dynamic> toJson() => _$ChangeCartsResponseToJson(this);
}


