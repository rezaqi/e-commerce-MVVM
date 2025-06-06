import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/cart/delete_model.dart';

abstract class CartDeleteRepo {
  Future<Either<Failure, ModelDeleteCart>> deleteCart(String cartId);
}
