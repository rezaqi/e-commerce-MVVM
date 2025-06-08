import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/data_source/cart/add/add_to_cart_DS.dart';
import 'package:e_commerce/features/data/model/cart/details_add_to_cart.dart';
import 'package:e_commerce/features/doman/repository/cart/add_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RepoAddToCart)
class RepoAddToCartImpl implements RepoAddToCart {
  AddToCartDs addToCartDs;
  RepoAddToCartImpl({required this.addToCartDs});
  @override
  Future<Either<Failure, ModelDetailsAddToCart>> addToCart(
      String productId) async {
    try {
      print("-----------$productId");
      var res = await addToCartDs.addToCart(productId);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
