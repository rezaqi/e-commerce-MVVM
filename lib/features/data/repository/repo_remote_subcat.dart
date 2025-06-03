import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/data_source/sub_categories/data_source_DS.dart';
import 'package:e_commerce/features/data/model/category_model.dart';
import 'package:e_commerce/features/data/model/sub_cat_model.dart';
import 'package:e_commerce/features/doman/repository/repo_subcat.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubCategoriesRepo)
class RepoRemoteSubcatImpl implements SubCategoriesRepo {
  final SubCategoriesDS subCategoriesDS;

  RepoRemoteSubcatImpl({required this.subCategoriesDS});

  @override
  Future<Either<Failure, CategoryModel>> getSubCat() async {
    try {
      var res = await subCategoriesDS.getSubCategories();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SubCategoriesModel>> getItems(String id) async {
    try {
      var res = await subCategoriesDS.getItems(id);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
