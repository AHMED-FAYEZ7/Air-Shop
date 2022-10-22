import 'package:air_shop/data/network/failure.dart';
import 'package:air_shop/data/request/request.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/repository/repository.dart';
import 'package:air_shop/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ChaneCartsUseCase extends BaseUseCase<ChangeCartsUseCaseInput, ChangeCartsObject> {
  Repository _repository;

  ChaneCartsUseCase(this._repository);

  @override
  Future<Either<Failure, ChangeCartsObject>> execute(ChangeCartsUseCaseInput input) async {
    return await _repository.changeCarts(ChangeCartsRequest(
        input.productId
    ));
  }
}

class ChangeCartsUseCaseInput {
  int productId;

  ChangeCartsUseCaseInput(this.productId);
}