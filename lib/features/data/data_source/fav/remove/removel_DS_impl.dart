import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/core/class/cache/cache_helper.dart';
import 'package:e_commerce/features/data/data_source/fav/remove/remove_DS.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoveFavDS)
class RemoveFavDSImpl implements RemoveFavDS {
  ApiManager api;
  RemoveFavDSImpl({required this.api});
  @override
  Future<bool> removeFav(String itemId) async {
    try {
      print(itemId);
      var res = await api.deleteData(
          url: AppLinks.favId(itemId), token: CacheHelper.getToken() ?? '');
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
