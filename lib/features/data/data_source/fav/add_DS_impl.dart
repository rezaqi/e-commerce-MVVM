import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/core/class/cache/cache_helper.dart';
import 'package:e_commerce/features/data/data_source/fav/add_DS.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddFavDS)
class AddFavDSImpl implements AddFavDS {
  ApiManager api;
  AddFavDSImpl({required this.api});
  @override
  Future<bool> addFave(String itemId) async {
    try {
      var res = await api.postData(
          url: AppLinks.fav,
          body: {'productId': itemId},
          token: CacheHelper.getToken());
      if (res.data['status'] == "success") {
        print("done");
        return true;
      }
      print("false");
      return false;
    } catch (e) {
      print("---- error add fav : $e");
      throw Exception(e);
    }
  }
}
