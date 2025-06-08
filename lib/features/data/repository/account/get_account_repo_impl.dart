import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/data_source/acc/get/get_account_DS.dart';
import 'package:e_commerce/features/data/model/get_account_model.dart';
import 'package:e_commerce/features/doman/repository/account/get_account_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAccountRepo)
class GetAccountRepoImpl implements GetAccountRepo {
  GetAccountDs getAccountDs;
  GetAccountRepoImpl({required this.getAccountDs});
  @override
  Future<Either<Failure, ModelGetAccount>> getAccount() async {
    try {
      var res = await getAccountDs.getAccount();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
