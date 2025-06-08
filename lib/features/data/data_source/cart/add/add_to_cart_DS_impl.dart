import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/core/class/cache/cache_helper.dart';
import 'package:e_commerce/features/data/data_source/cart/add/add_to_cart_DS.dart';
import 'package:e_commerce/features/data/model/cart/details_add_to_cart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartDs)
class AddToCartDsImpl implements AddToCartDs {
  ApiManager? api;

  AddToCartDsImpl({required this.api});

  @override
  Future<ModelDetailsAddToCart> addToCart(String productId) async {
    try {
      print("- $productId");
      var res = await api!.postData(
          url: AppLinks.addTOCart,
          body: {"productId": productId},
          token: CacheHelper.getToken());
      print(res.data);
      return ModelDetailsAddToCart.fromJson(res.data);
    } catch (e) {
      print("------------ cart Error: $e ");
      throw Exception(e);
    }
  }
}
