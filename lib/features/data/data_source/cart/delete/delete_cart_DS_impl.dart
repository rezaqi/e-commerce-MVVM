import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/core/class/cache/cache_helper.dart';
import 'package:e_commerce/features/data/data_source/cart/delete/delete_cart_DS.dart';
import 'package:e_commerce/features/data/model/cart/delete_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DeleteCartDS)
class DeleteCartDSImpl implements DeleteCartDS {
  ApiManager api;
  DeleteCartDSImpl({required this.api});
  @override
  Future<ModelDeleteCart> deleteCart(String cartId) async {
    try {
      var res = await api.deleteData(
          url: AppLinks.updatecart(cartId),
          token: CacheHelper.getToken() ?? "");
      return ModelDeleteCart.fromJson(res.data);
    } catch (e) {
      print("---- error delete : $e");

      throw Exception(e);
    }
  }
}
