import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/cart/details_add_to_cart.dart';
import 'package:e_commerce/features/doman/repository/cart/add_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UseCaseAddToCart {
  RepoAddToCart repo;
  UseCaseAddToCart({required this.repo});

  Future<Either<Failure, ModelDetailsAddToCart>> call(String productId) =>
      repo.addToCart(productId);
}
