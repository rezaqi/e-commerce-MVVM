import 'package:e_commerce/features/data/model/cart/cart_model.dart';

abstract class GetCartDs {
  Future<ModelCart> getCart();
}
