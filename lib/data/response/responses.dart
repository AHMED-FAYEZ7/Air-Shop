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
  dynamic price;
  @JsonKey(name: "old_price")
  dynamic oldPrice;
  @JsonKey(name: "discount")
  dynamic discount;
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