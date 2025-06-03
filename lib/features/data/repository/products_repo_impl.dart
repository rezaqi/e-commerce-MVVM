import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/data_source/products/data_source_products.dart';
import 'package:e_commerce/features/data/model/products_model.dart';
import 'package:e_commerce/features/doman/repository/products_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RepoProducts)
class RepoProductsImpl implements RepoProducts {
  DataSourceProducts dataSource;
  RepoProductsImpl({required this.dataSource});
  @override
  Future<Either<Failure, ProductsModel>> getProducts(String idSubCat) async {
    try {
      var res = await dataSource.getProductes(idSubCat);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
