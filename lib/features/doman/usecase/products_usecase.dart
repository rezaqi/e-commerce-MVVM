import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/products_model.dart';
import 'package:e_commerce/features/doman/repository/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UseCaseProducts {
  RepoProducts repo;
  UseCaseProducts({required this.repo});

  Future<Either<Failure, ProductsModel>> call(String idSubCat) =>
      repo.getProducts(idSubCat);
}
