import 'package:air_shop/data/network/failure.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/repository/repository.dart';
import 'package:air_shop/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class FavUseCase extends BaseUseCase<void, FavObject> {
  Repository _repository;

  FavUseCase(this._repository);

  @override
  Future<Either<Failure, FavObject>> execute(void input) async {
    // DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.getFavorites();
  }
}