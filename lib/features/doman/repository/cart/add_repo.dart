import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/cart/details_add_to_cart.dart';

abstract class RepoAddToCart {
  Future<Either<Failure, ModelDetailsAddToCart>> addToCart(String productId);
}
