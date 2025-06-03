import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/p_details_model.dart';

abstract class RepoItem {
  Future<Either<Failure, ModelProductDetails>> getItem(String id);
}
