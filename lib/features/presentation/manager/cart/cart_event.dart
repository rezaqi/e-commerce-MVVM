abstract class EventCart {}

class OnEventCart extends EventCart {}

class OnEventUpdateCart extends EventCart {
  String cartId;
  String count;
  OnEventUpdateCart({required this.cartId, required this.count});
}

class OnEventDeleteCart extends EventCart {
  String cartId;

  OnEventDeleteCart({required this.cartId});
}
