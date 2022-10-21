import 'package:air_shop/data/network/failure.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/repository/repository.dart';
import 'package:air_shop/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class CartUseCase extends BaseUseCase<void, CartObject> {
  Repository _repository;

  CartUseCase(this._repository);

  @override
  Future<Either<Failure, CartObject>> execute(void input) async {
    return await _repository.getCarts();
  }
}