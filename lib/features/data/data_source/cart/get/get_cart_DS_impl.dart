import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/core/class/cache/cache_helper.dart';
import 'package:e_commerce/features/data/data_source/cart/get/get_cart_DS.dart';
import 'package:e_commerce/features/data/model/cart/cart_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetCartDs)
class GetCartDsImpl implements GetCartDs {
  ApiManager apiManager;
  GetCartDsImpl({required this.apiManager});
  @override
  Future<ModelCart> getCart() async {
    try {
      var res = await apiManager.getData(
          url: AppLinks.getCart, token: CacheHelper.getToken());
      return ModelCart.fromJson(res.data);
    } catch (e) {
      print("-----error get cart --- $e");
      throw Exception(e);
    }
  }
}
