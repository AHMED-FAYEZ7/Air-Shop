import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
}

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
  @JsonKey(name: "points")
  int? points;
  @JsonKey(name: "credit")
  int? credit;
  @JsonKey(name: "token")
  String? token;

  UserDataResponse(this.id,this.name,this.email,this.phone,this.image,this.points,this.credit,this.token);

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