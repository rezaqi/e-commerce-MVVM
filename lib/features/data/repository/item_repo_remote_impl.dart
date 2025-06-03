import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/data_source/item_details/data_source.dart';
import 'package:e_commerce/features/data/model/p_details_model.dart';
import 'package:e_commerce/features/doman/repository/item_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RepoItem)
class RepoItemImpl implements RepoItem {
  ItemDS itemDS;
  RepoItemImpl({required this.itemDS});

  @override
  Future<Either<Failure, ModelProductDetails>> getItem(String id) async {
    try {
      var res = await itemDS.getItemDetails(id);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
