import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/model/p_details_model.dart';
import 'package:e_commerce/features/doman/repository/item_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UseCaseItem {
  RepoItem repoItem;
  UseCaseItem({required this.repoItem});

  Future<Either<Failure, ModelProductDetails>> call(String id) =>
      repoItem.getItem(id);
}
