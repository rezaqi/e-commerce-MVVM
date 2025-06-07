import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/core/class/cache/cache_helper.dart';
import 'package:e_commerce/features/data/data_source/fav/get/get_DS.dart';
import 'package:e_commerce/features/data/model/fav/get_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetFavDS)
class GetFavDSImpl implements GetFavDS {
  ApiManager api;
  GetFavDSImpl({required this.api});
  @override
  Future<ModelGetFav> getFav() async {
    try {
      var res =
          await api.getData(url: AppLinks.fav, token: CacheHelper.getToken());
      return ModelGetFav.fromJson(res.data);
    } catch (e) {
      print("get fav Error --- $e");
      throw Exception(e);
    }
  }
}
