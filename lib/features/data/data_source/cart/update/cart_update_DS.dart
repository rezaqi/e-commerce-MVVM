import 'package:e_commerce/features/data/model/cart/update_model.dart';

abstract class CartUpdateDs {
  Future<ModelCartUpdate> updateCart(
    String cartId,
    String count,
  );
}
