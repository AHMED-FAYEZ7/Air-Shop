class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(
      this.title,
      this.subTitle,
      this.image,
      );
}

// ------ user -------------
class UserData{
  int id;
  String name;
  String email;
  String phone;
  String image;
  String token;

  UserData(this.id,this.name,this.email,this.phone,this.image,this.token);
}

class Authentication{
  UserData? data;
  Authentication(this.data);
}

// ------ DeviceInfo -------------
class DeviceInfo{
  String name;
  String identifier;
  String version;

  DeviceInfo(this.name,this.identifier,this.version);
}
// ------ home -------------
class Banners{
  int id;
  String image;

  Banners(this.id,this.image,);
}

class Products{
  int id;
  double price;
  double oldPrice;
  double discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  Products(
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
}

class HomeData{
  List<Banners> banners;
  List<Products> products;

  HomeData(this.banners,this.products,);
}

class HomeObject{
  HomeData data;

  HomeObject(this.data);
}

// ------ Categories -------------
class CatData{
  int id;
  String name;
  String image;

  CatData(this.id,this.name,this.image,);
}

class CategoriesData{
  int currentPage;
  List<CatData> catData;

  CategoriesData(this.currentPage,this.catData,);
}

class CategoriesObject{
  CategoriesData data;

  CategoriesObject(this.data);
}