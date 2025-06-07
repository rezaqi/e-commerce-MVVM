import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/fav/get_model.dart';
import 'package:e_commerce/features/doman/repository/fav/get_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFavUseCase {
  GetFavRepo repo;
  GetFavUseCase({required this.repo});
  Future<Either<Failure, ModelGetFav>> call() => repo.getFav();
}
