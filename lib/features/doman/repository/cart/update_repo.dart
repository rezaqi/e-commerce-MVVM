import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/cart/update_model.dart';

abstract class RepoCartUpdate {
  Future<Either<Failure, ModelCartUpdate>> updateCart(
      String cartId, String count);
}
