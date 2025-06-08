import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/get_account_model.dart';

abstract class GetAccountRepo {
  Future<Either<Failure, ModelGetAccount>> getAccount();
}
