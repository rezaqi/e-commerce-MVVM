import 'package:e_commerce/features/data/data_source/fav/remove/remove_DS.dart';
import 'package:e_commerce/features/doman/repository/fav/remove_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoveFavRepo)
class RemoveFavRepoImpl implements RemoveFavRepo {
  RemoveFavDS ds;
  RemoveFavRepoImpl({required this.ds});

  @override
  Future<bool> removeFavItem(String itemId) async {
    try {
      var res = await ds.removeFav(itemId);
      return res;
    } catch (e) {
      return false;
    }
  }
}
