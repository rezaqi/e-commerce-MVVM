import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/get_account_model.dart';
import 'package:e_commerce/features/doman/repository/account/get_account_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAccountUsecase {
  GetAccountRepo getAccountRepo;
  GetAccountUsecase({required this.getAccountRepo});

  Future<Either<Failure, ModelGetAccount>> call() =>
      getAccountRepo.getAccount();
}
