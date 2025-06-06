import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/cart/cart_model.dart';

abstract class GetCartRepo {
  Future<Either<Failure, ModelCart>> getCart();
}
