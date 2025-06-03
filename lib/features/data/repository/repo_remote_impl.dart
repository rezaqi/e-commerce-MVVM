import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/failure/failure_remote.dart';
import 'package:e_commerce/features/data/data_source/data_source_DS.dart';
import 'package:e_commerce/features/data/model/category_model.dart';
import 'package:e_commerce/features/doman/entity/brand_model_en.dart';
import 'package:e_commerce/features/doman/repository/repo_cat.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class RepoCatRemoteImpl implements HomeRepo {
  final CategoriesDS catRemoteImplDS;

  RepoCatRemoteImpl({required this.catRemoteImplDS});

  @override
  Future<Either<Failure, CategoryModel>> getCategories() async {
    try {
      var res = await catRemoteImplDS.getCategory();
      return Right(res);
    } catch (e) {
      return Left(FailureRemote(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BrandModelEntity>> getBrands() async {
    try {
      var res = await catRemoteImplDS.getBrand();
      return Right(res);
    } catch (e) {
      return Left(FailureRemote(e.toString()));
    }
  }
}
