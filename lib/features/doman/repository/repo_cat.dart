import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/category_model.dart';
import 'package:e_commerce/features/doman/entity/brand_model_en.dart';

abstract class HomeRepo {
  Future<Either<Failure, CategoryModel>> getCategories();
  Future<Either<Failure, BrandModelEntity>> getBrands();
}
