import 'package:e_commerce/features/data/data_source/fav/add_DS.dart';
import 'package:e_commerce/features/doman/repository/fav/add_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddFavRepo)
class AddFavRepoImpl implements AddFavRepo {
  AddFavDS ds;
  AddFavRepoImpl({required this.ds});

  @override
  Future<bool> addFavItem(String itemId) async {
    try {
      var res = await ds.addFave(itemId);
      return res;
    } catch (e) {
      return false;
    }
  }
}
