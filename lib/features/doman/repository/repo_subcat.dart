import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/category_model.dart';
import 'package:e_commerce/features/data/model/sub_cat_model.dart';

abstract class SubCategoriesRepo {
  Future<Either<Failure, CategoryModel>> getSubCat();
  Future<Either<Failure, SubCategoriesModel>> getItems(String id);
}
