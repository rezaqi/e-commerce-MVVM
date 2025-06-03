import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/sub_cat_model.dart';
import 'package:e_commerce/features/doman/repository/repo_subcat.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubcatUsecase {
  SubCategoriesRepo subCategoriesRepo;

  SubcatUsecase({required this.subCategoriesRepo});

  // Future<Either<Failure, CategoryModel>> callSubCat() =>
  //     subCategoriesRepo.getSubCat();

  Future<Either<Failure, SubCategoriesModel>> callItem(String id) =>
      subCategoriesRepo.getItems(id);
}
