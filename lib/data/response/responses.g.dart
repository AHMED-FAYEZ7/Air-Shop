// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as bool?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['image'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'token': instance.token,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['data'] == null
          ? null
          : UserDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

BannersResponse _$BannersResponseFromJson(Map<String, dynamic> json) =>
    BannersResponse(
      json['id'] as int?,
      json['image'] as String?,
    );

Map<String, dynamic> _$BannersResponseToJson(BannersResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      json['id'] as int?,
      (json['price'] as num?)?.toDouble(),
      (json['old_price'] as num?)?.toDouble(),
      (json['discount'] as num?)?.toDouble(),
      json['image'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['in_favorites'] as bool?,
      json['in_cart'] as bool?,
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'in_favorites': instance.inFavorites,
      'in_cart': instance.inCart,
    };

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      (json['banners'] as List<dynamic>?)
          ?.map((e) => BannersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'products': instance.products,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      json['data'] == null
          ? null
          : HomeDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

CategoriesDataResponse _$CategoriesDataResponseFromJson(
        Map<String, dynamic> json) =>
    CategoriesDataResponse(
      json['current_page'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => DataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesDataResponseToJson(
        CategoriesDataResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.catData,
    };

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) =>
    CategoriesResponse(
      json['data'] == null
          ? null
          : CategoriesDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CategoriesResponseToJson(CategoriesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

FavProductsResponse _$FavProductsResponseFromJson(Map<String, dynamic> json) =>
    FavProductsResponse(
      json['id'] as int?,
      (json['price'] as num?)?.toDouble(),
      (json['old_price'] as num?)?.toDouble(),
      (json['discount'] as num?)?.toDouble(),
      json['image'] as String?,
      json['name'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$FavProductsResponseToJson(
        FavProductsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
    };

FavDataListResponse _$FavDataListResponseFromJson(Map<String, dynamic> json) =>
    FavDataListResponse(
      json['id'] as int?,
      json['product'] == null
          ? null
          : FavProductsResponse.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavDataListResponseToJson(
        FavDataListResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };

FavDataResponse _$FavDataResponseFromJson(Map<String, dynamic> json) =>
    FavDataResponse(
      json['current_page'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => FavDataListResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavDataResponseToJson(FavDataResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.dataList,
    };

FavResponse _$FavResponseFromJson(Map<String, dynamic> json) => FavResponse(
      json['data'] == null
          ? null
          : FavDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$FavResponseToJson(FavResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ChangeFavoritesProductsResponse _$ChangeFavoritesProductsResponseFromJson(
        Map<String, dynamic> json) =>
    ChangeFavoritesProductsResponse(
      json['id'] as int?,
      (json['price'] as num?)?.toDouble(),
      (json['old_price'] as num?)?.toDouble(),
      (json['discount'] as num?)?.toDouble(),
      json['image'] as String?,
    );

Map<String, dynamic> _$ChangeFavoritesProductsResponseToJson(
        ChangeFavoritesProductsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
    };

ChangeFavoritesDataResponse _$ChangeFavoritesDataResponseFromJson(
        Map<String, dynamic> json) =>
    ChangeFavoritesDataResponse(
      json['id'] as int?,
      json['product'] == null
          ? null
          : ChangeFavoritesProductsResponse.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChangeFavoritesDataResponseToJson(
        ChangeFavoritesDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };

ChangeFavoritesResponse _$ChangeFavoritesResponseFromJson(
        Map<String, dynamic> json) =>
    ChangeFavoritesResponse(
      json['data'] == null
          ? null
          : ChangeFavoritesDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChangeFavoritesResponseToJson(
        ChangeFavoritesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

CartProductsResponse _$CartProductsResponseFromJson(
        Map<String, dynamic> json) =>
    CartProductsResponse(
      json['id'] as int?,
      (json['price'] as num?)?.toDouble(),
      (json['old_price'] as num?)?.toDouble(),
      (json['discount'] as num?)?.toDouble(),
      json['image'] as String?,
      json['name'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$CartProductsResponseToJson(
        CartProductsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
    };

CartItemResponse _$CartItemResponseFromJson(Map<String, dynamic> json) =>
    CartItemResponse(
      json['id'] as int?,
      json['quantity'] as int?,
      json['product'] == null
          ? null
          : CartProductsResponse.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartItemResponseToJson(CartItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
    };

CartDataResponse _$CartDataResponseFromJson(Map<String, dynamic> json) =>
    CartDataResponse(
      (json['cart_items'] as List<dynamic>?)
          ?.map((e) => CartItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CartDataResponseToJson(CartDataResponse instance) =>
    <String, dynamic>{
      'cart_items': instance.cartItems,
      'total': instance.total,
    };

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      json['data'] == null
          ? null
          : CartDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ChangeCartsProductsResponse _$ChangeCartsProductsResponseFromJson(
        Map<String, dynamic> json) =>
    ChangeCartsProductsResponse(
      json['id'] as int?,
      (json['price'] as num?)?.toDouble(),
      (json['old_price'] as num?)?.toDouble(),
      (json['discount'] as num?)?.toDouble(),
      json['image'] as String?,
    );

Map<String, dynamic> _$ChangeCartsProductsResponseToJson(
        ChangeCartsProductsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
    };

ChangeCartsDataResponse _$ChangeCartsDataResponseFromJson(
        Map<String, dynamic> json) =>
    ChangeCartsDataResponse(
      json['id'] as int?,
      json['quantity'] as int?,
      json['product'] == null
          ? null
          : ChangeCartsProductsResponse.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChangeCartsDataResponseToJson(
        ChangeCartsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
    };

ChangeCartsResponse _$ChangeCartsResponseFromJson(Map<String, dynamic> json) =>
    ChangeCartsResponse(
      json['data'] == null
          ? null
          : ChangeCartsDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChangeCartsResponseToJson(
        ChangeCartsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
