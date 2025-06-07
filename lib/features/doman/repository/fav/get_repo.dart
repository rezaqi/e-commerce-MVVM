import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/fav/get_model.dart';

abstract class GetFavRepo {
  Future<Either<Failure, ModelGetFav>> getFav();
}
