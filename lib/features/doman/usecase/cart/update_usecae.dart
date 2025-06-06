import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/cart/update_model.dart';
import 'package:e_commerce/features/doman/repository/cart/update_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UseCaseUpdateCart {
  RepoCartUpdate repo;
  UseCaseUpdateCart({required this.repo});

  Future<Either<Failure, ModelCartUpdate>> call(String cartId, String count) =>
      repo.updateCart(cartId, count);
}
