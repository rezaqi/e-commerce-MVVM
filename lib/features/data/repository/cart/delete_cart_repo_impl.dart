import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/data_source/cart/delete/delete_cart_DS.dart';
import 'package:e_commerce/features/data/model/cart/delete_model.dart';
import 'package:e_commerce/features/doman/repository/cart/delete_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartDeleteRepo)
class DeleteCartRepoImpl implements CartDeleteRepo {
  DeleteCartDS dataSource;
  DeleteCartRepoImpl({required this.dataSource});
  @override
  Future<Either<Failure, ModelDeleteCart>> deleteCart(String cartId) async {
    try {
      var res = await dataSource.deleteCart(cartId);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
