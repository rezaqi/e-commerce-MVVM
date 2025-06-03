import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/category_model.dart';
import 'package:e_commerce/features/doman/entity/brand_model_en.dart';
import 'package:e_commerce/features/doman/repository/repo_cat.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomUseCase {
  HomeRepo homeRepo;
  HomUseCase({required this.homeRepo});

  Future<Either<Failure, CategoryModel>> call() => homeRepo.getCategories();
  Future<Either<Failure, BrandModelEntity>> callBrands() =>
      homeRepo.getBrands();
}
