import 'package:air_shop/data/network/failure.dart';
import 'package:air_shop/data/request/request.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/repository/repository.dart';
import 'package:air_shop/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ChaneFavoritesUseCase extends BaseUseCase<ChangeFavoritesUseCaseInput, ChangeFavoritesObject> {
  Repository _repository;

  ChaneFavoritesUseCase(this._repository);

  @override
  Future<Either<Failure, ChangeFavoritesObject>> execute(ChangeFavoritesUseCaseInput input) async {
    return await _repository.changeFavorites(ChangeFavRequest(
      input.productId
    ));
  }
}

class ChangeFavoritesUseCaseInput {
  int productId;

  ChangeFavoritesUseCaseInput(this.productId);
}