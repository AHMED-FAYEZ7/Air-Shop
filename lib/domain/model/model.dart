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

class UserData{
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  UserData(this.id,this.name,this.email,this.phone,this.image,this.points,this.credit,this.token);
}

class Authentication{
  UserData? data;
  Authentication(this.data);
}

class DeviceInfo{
  String name;
  String identifier;
  String version;

  DeviceInfo(this.name,this.identifier,this.version);
}