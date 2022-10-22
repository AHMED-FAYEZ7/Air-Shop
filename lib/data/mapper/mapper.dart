import 'package:air_shop/data/response/responses.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/app/extensions.dart';

extension UserDataMapper on UserDataResponse?{
  UserData toDomain(){
    return UserData(
        this?.id?.orZero() ?? ZERO,
        this?.name?.orEmpty() ?? EMPTY,
        this?.email?.orEmpty() ?? EMPTY,
        this?.phone?.orEmpty() ?? EMPTY,
        this?.image?.orEmpty() ?? EMPTY,
        this?.token?.orEmpty() ?? EMPTY,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse?{
  Authentication toDomain(){
    return Authentication(this?.data?.toDomain());
  }
}
//-------------------------------------------------
extension BannersResponseMapper on BannersResponse?{
  Banners toDomain(){
    return Banners(
      this?.id?.orZero() ?? ZERO,
      this?.image?.orEmpty() ?? EMPTY,
    );
  }
}

extension ProductsResponseMapper on ProductsResponse?{
  Products toDomain(){
    return Products(
      this?.id?.orZero() ?? ZERO,
      this?.price?.orDoubleZero() ?? doubleZERO,
      this?.oldPrice?.orDoubleZero() ?? doubleZERO,
      this?.discount?.orDoubleZero() ?? doubleZERO,
      this?.image?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.description?.orEmpty() ?? EMPTY,
      this?.images?.orEmptyList() ?? EMPTY_LIST,
      this?.inFavorites?.orFALSE() ?? FALSE,
      this?.inCart?.orFALSE() ?? FALSE,
    );
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Banners> mappedBanners =
    (this?.data?.banners?.map((banners) => banners.toDomain()) ??
        const Iterable.empty())
        .cast<Banners>()
        .toList();

    List<Products> mappedProducts =
    (this?.data?.products?.map((products) => products.toDomain()) ??
        const Iterable.empty())
        .cast<Products>()
        .toList();

    var data = HomeData(mappedBanners ,mappedProducts);
    return HomeObject(data);
  }
}
//---------------
extension DataResponseMapper on DataResponse?{
  CatData toDomain(){
    return CatData(
      this?.id?.orZero() ?? ZERO,
      this?.name?.orEmpty() ?? EMPTY,
      this?.image?.orEmpty() ?? EMPTY,
    );
  }
}

extension CategoriesResponseMapper on CategoriesResponse? {
  CategoriesObject toDomain() {
    List<CatData> mappedCatData =
    (this?.data?.catData?.map((catData) => catData.toDomain()) ??
        const Iterable.empty())
        .cast<CatData>()
        .toList();

    int mappedCurrentPage =
    (this?.data?.currentPage?.orZero() ?? ZERO);

    var data = CategoriesData(mappedCurrentPage ,mappedCatData);
    return CategoriesObject(data);
  }
}
// -------------------------
extension FavProductResponseMapper on FavProductsResponse?{
  FavProduct toDomain(){
    return FavProduct(
      this?.id?.orZero() ?? ZERO,
      this?.price?.orDoubleZero() ?? doubleZERO,
      this?.oldPrice?.orDoubleZero() ?? doubleZERO,
      this?.discount?.orDoubleZero() ?? doubleZERO,
      this?.image?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.description?.orEmpty() ?? EMPTY,
    );
  }
}

extension FavDataListResponseMapper on FavDataListResponse?{
  FavDataList toDomain(){
    return FavDataList(
      this?.id?.orZero() ?? ZERO,
      this?.product?.toDomain() ?? emptyFavProduct(),
    );
  }
}

extension FavResponseMapper on FavResponse? {
  FavObject toDomain() {
    List<FavDataList> mappedFavDataList =
    (this?.data?.dataList?.map((dataList) => dataList.toDomain()) ??
        const Iterable.empty())
        .cast<FavDataList>()
        .toList();

    int mappedCurrentPage =
    (this?.data?.currentPage?.orZero() ?? ZERO);

    var data = FavData(mappedCurrentPage ,mappedFavDataList);
    return FavObject(data);
  }
}
// -------------------------
extension ChangeFavoritesProductsResponseMapper on ChangeFavoritesProductsResponse?{
  ChangeFavoritesProduct toDomain(){
    return ChangeFavoritesProduct(
      this?.id?.orZero() ?? ZERO,
      this?.price?.orDoubleZero() ?? doubleZERO,
      this?.oldPrice?.orDoubleZero() ?? doubleZERO,
      this?.discount?.orDoubleZero() ?? doubleZERO,
      this?.image?.orEmpty() ?? EMPTY,
    );
  }
}

extension ChangeFavoritesDataResponseMapper on ChangeFavoritesDataResponse?{
  ChangeFavoritesData toDomain(){
    return ChangeFavoritesData(
      this?.id?.orZero() ?? ZERO,
      this?.product?.toDomain() ?? emptyChangeFavProduct(),
    );
  }
}

extension ChangeFavoritesResponseMapper on ChangeFavoritesResponse? {
  ChangeFavoritesObject toDomain(){
    return ChangeFavoritesObject(
      this?.data?.toDomain() ?? emptyChangeFavProductData(),
    );
  }
}
// -------------------------
extension CartProductResponseMapper on CartProductsResponse?{
  CartProduct toDomain(){
    return CartProduct(
      this?.id?.orZero() ?? ZERO,
      this?.price?.orDoubleZero() ?? doubleZERO,
      this?.oldPrice?.orDoubleZero() ?? doubleZERO,
      this?.discount?.orDoubleZero() ?? doubleZERO,
      this?.image?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.description?.orEmpty() ?? EMPTY,
    );
  }
}

extension CartItemResponseMapper on CartItemResponse?{
  CartItem toDomain(){
    return CartItem(
      this?.id?.orZero() ?? ZERO,
      this?.quantity?.orZero() ?? ZERO,
      this?.product?.toDomain() ?? emptyCartProduct(),
    );
  }
}

extension CartResponseMapper on CartResponse? {
  CartObject toDomain() {
    List<CartItem> mappedCartDataList =
    (this?.data?.cartItems?.map((cartItem) => cartItem.toDomain()) ??
        const Iterable.empty())
        .cast<CartItem>()
        .toList();

    var data = CartData(mappedCartDataList);
    return CartObject(data);
  }
}

// -------------------------
extension ChangeCartsProductsResponseMapper on ChangeCartsProductsResponse?{
  ChangeCartsProduct toDomain(){
    return ChangeCartsProduct(
      this?.id?.orZero() ?? ZERO,
      this?.price?.orDoubleZero() ?? doubleZERO,
      this?.oldPrice?.orDoubleZero() ?? doubleZERO,
      this?.discount?.orDoubleZero() ?? doubleZERO,
      this?.image?.orEmpty() ?? EMPTY,
    );
  }
}

extension ChangeCartsDataResponseMapper on ChangeCartsDataResponse?{
  ChangeCartsData toDomain(){
    return ChangeCartsData(
      this?.id?.orZero() ?? ZERO,
      this?.quantity?.orZero() ?? ZERO,
      this?.product?.toDomain() ?? emptyChangeCartProduct(),
    );
  }
}

extension ChangeCartsResponseMapper on ChangeCartsResponse? {
  ChangeCartsObject toDomain(){
    return ChangeCartsObject(
      this?.data?.toDomain() ?? emptyChangeCartProductData(),
    );
  }
}


