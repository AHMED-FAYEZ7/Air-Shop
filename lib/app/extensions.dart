// extension on string

import 'package:air_shop/data/response/responses.dart';
import 'package:air_shop/domain/model/model.dart';

const String EMPTY = "";
extension NonNullString on String?{
  String orEmpty(){
    if(this == null){
      return EMPTY;
    }else {
      return this!;
    }
  }
}

// extension on int
int ZERO = 0;
extension NonNullInt on int?{
  int orZero(){
    if(this == null){
      return ZERO;
    }else {
      return this!;
    }
  }
}

// extension on double
double doubleZERO = 0;
extension NonNullDouble on double?{
  double orDoubleZero(){
    if(this == null){
      return doubleZERO;
    }else {
      return this!;
    }
  }
}

// extension on bool
bool FALSE = false;
extension NonNullBool on bool?{
  bool orFALSE(){
    if(this == null){
      return FALSE;
    }else {
      return this!;
    }
  }
}

// extension on STRING list
List<String> EMPTY_LIST = [];
extension NonNullList on List<String>?{
  List<String> orEmptyList(){
    if(this == null){
      return EMPTY_LIST;
    }else {
      return this!;
    }
  }
}

// extension on DYNAMIC
extension NonNullDynamic on dynamic{
  dynamic orEmptyDynamic(){
    if(this == null){
      return EMPTY;
    }else {
      return this!;
    }
  }
}

// extension on PRODUCT
emptyFavProduct(){
  return FavProduct(ZERO, doubleZERO, doubleZERO, doubleZERO, EMPTY, EMPTY, EMPTY);
}

// extension on PRODUCTCart
emptyCartProduct(){
  return CartProduct(ZERO, doubleZERO, doubleZERO, doubleZERO, EMPTY, EMPTY, EMPTY);
}


// extension on Change PRODUCT
emptyChangeFavProduct(){
  return ChangeFavoritesProduct(ZERO, doubleZERO, doubleZERO, doubleZERO, EMPTY);
}

// extension on Change PRODUCT data
emptyChangeFavProductData(){
  return ChangeFavoritesData(ZERO, emptyChangeFavProduct());
}

// extension on Change PRODUCT
emptyChangeCartProduct(){
  return ChangeCartsProduct(ZERO, doubleZERO, doubleZERO, doubleZERO, EMPTY);
}

// extension on Change PRODUCT data
emptyChangeCartProductData(){
  return ChangeCartsData(ZERO,ZERO, emptyChangeCartProduct());
}

// extension on Change PRODUCT data
emptySettingsData(){
  return SettingsData(EMPTY,EMPTY);
}
