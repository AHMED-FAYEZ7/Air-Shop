import 'package:air_shop/data/network/failure.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/domain/repository/repository.dart';
import 'package:air_shop/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class SettingsUseCase extends BaseUseCase<void, SettingsObject> {
  Repository _repository;

  SettingsUseCase(this._repository);

  @override
  Future<Either<Failure, SettingsObject>> execute(void input) async {
    return await _repository.getSettings();
  }
}