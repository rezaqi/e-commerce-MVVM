import 'package:e_commerce/features/data/model/cart/delete_model.dart';

abstract class DeleteCartDS {
  Future<ModelDeleteCart> deleteCart(String cartId);
}
