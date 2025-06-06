import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/data_source/cart/get/get_cart_DS.dart';
import 'package:e_commerce/features/data/model/cart/cart_model.dart';
import 'package:e_commerce/features/doman/repository/cart/get_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetCartRepo)
class GetCartRepoImpl implements GetCartRepo {
  GetCartDs dataSource;
  GetCartRepoImpl({required this.dataSource});
  @override
  Future<Either<Failure, ModelCart>> getCart() async {
    try {
      var res = await dataSource.getCart();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
