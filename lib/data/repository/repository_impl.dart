import 'package:air_shop/data/mapper/mapper.dart';
import 'package:air_shop/data/network/error_handler.dart';
import 'package:air_shop/data/network/failure.dart';
import 'package:air_shop/data/network/natwork_info.dart';
import 'package:air_shop/data/request/request.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try{
        // its safe to call the API
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) // success
            {
          // return data (success)
          // return right
          return Right(response.toDomain());
        } else {
          // return biz logic error
          // return left
          return Left(Failure(
              ResponseCode.DEFAULT,
              response.message ?? ResponseMessage.DEFAULT));
        }
      }catch(error){
        return (left(ErrorHandler.handle(error).failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}