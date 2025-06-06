import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/cart/delete_model.dart';
import 'package:e_commerce/features/doman/repository/cart/delete_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UseCaseDeleteCart {
  CartDeleteRepo repo;
  UseCaseDeleteCart({required this.repo});
  Future<Either<Failure, ModelDeleteCart>> call(String cartId) =>
      repo.deleteCart(cartId);
}
