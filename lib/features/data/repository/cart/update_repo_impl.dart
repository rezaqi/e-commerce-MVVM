import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/data_source/cart/update/cart_update_DS.dart';
import 'package:e_commerce/features/data/model/cart/update_model.dart';
import 'package:e_commerce/features/doman/repository/cart/update_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RepoCartUpdate)
class RepoCartUpdateImpl implements RepoCartUpdate {
  CartUpdateDs dataSource;
  RepoCartUpdateImpl({required this.dataSource});
  @override
  Future<Either<Failure, ModelCartUpdate>> updateCart(
      String cartId, String count) async {
    try {
      var res = await dataSource.updateCart(cartId, count);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
