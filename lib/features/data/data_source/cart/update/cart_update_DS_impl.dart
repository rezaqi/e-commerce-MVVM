import 'package:dio/dio.dart';
import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/core/class/cache/cache_helper.dart';
import 'package:e_commerce/features/data/data_source/cart/update/cart_update_DS.dart';
import 'package:e_commerce/features/data/model/cart/update_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartUpdateDs)
class CartUpdateDSImpl implements CartUpdateDs {
  ApiManager apiManager;
  CartUpdateDSImpl({required this.apiManager});
  @override
  Future<ModelCartUpdate> updateCart(String cartId, String count) async {
    try {
      var res = await apiManager.putData(
          url: AppLinks.updatecart(cartId),
          token: CacheHelper.getToken(),
          body: {"count": count});
      return ModelCartUpdate.fromJson(res.data);
    } catch (e) {
      if (e is DioException) {
        final errorMessage = e.response?.data['message'];
        print("❌ API Error Message: $errorMessage");
      } else {
        print("❌ Unexpected error: $e");
      }
      print("---- error update cart -- $e");

      throw Exception(e);
    }
  }
}
