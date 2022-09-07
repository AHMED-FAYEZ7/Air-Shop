import 'package:air_shop/data/network/failure.dart';
import 'package:air_shop/data/request/request.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository{
  Future<Either<Failure , Authentication>> login(LoginRequest loginRequest);
}