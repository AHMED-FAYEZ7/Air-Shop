import 'package:air_shop/data/network/failure.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/repository/repository.dart';
import 'package:air_shop/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class CategoriesUseCase implements BaseUseCase<void, CategoriesObject> {
  Repository _repository;

  CategoriesUseCase(this._repository);

  @override
  Future<Either<Failure, CategoriesObject>> execute(void input) async {
    // DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.getCategories();
  }
}