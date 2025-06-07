import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/features/data/data_source/fav/get/get_DS.dart';
import 'package:e_commerce/features/data/model/fav/get_model.dart';
import 'package:e_commerce/features/doman/repository/fav/get_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetFavRepo)
class GetFavRepoImpl implements GetFavRepo {
  GetFavDS ds;
  GetFavRepoImpl({required this.ds});

  @override
  Future<Either<Failure, ModelGetFav>> getFav() async {
    try {
      var res = await ds.getFav();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
