import 'package:air_shop/data/response/responses.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/app/extensions.dart';

extension UserDataMapper on UserDataResponse?{
  UserData toDomain(){
    return UserData(
        this?.id.orZero() ?? ZERO,
        this?.name.orEmpty() ?? EMPTY,
        this?.email.orEmpty() ?? EMPTY,
        this?.phone.orEmpty() ?? EMPTY,
        this?.image.orEmpty() ?? EMPTY,
        this?.points.orZero() ?? ZERO,
        this?.credit.orZero() ?? ZERO,
        this?.token.orEmpty() ?? EMPTY,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse?{
  Authentication toDomain(){
    return Authentication(this?.data?.toDomain());
  }
}