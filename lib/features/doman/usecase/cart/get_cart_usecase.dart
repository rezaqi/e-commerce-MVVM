import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/cart/cart_model.dart';
import 'package:e_commerce/features/doman/repository/cart/get_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UseCaseGetCart {
  GetCartRepo repo;
  UseCaseGetCart({required this.repo});

  Future<Either<Failure, ModelCart>> call() => repo.getCart();
}
