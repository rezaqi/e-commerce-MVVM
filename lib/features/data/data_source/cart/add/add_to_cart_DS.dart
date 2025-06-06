import 'package:e_commerce/features/data/model/cart/details_add_to_cart.dart';

abstract class AddToCartDs {
  Future<ModelDetailsAddToCart> addToCart(String productId);
}
