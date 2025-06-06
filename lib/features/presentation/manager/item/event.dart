abstract class EventItem {}

class OnItem extends EventItem {
  String id;
  OnItem({required this.id});
}

class OnItemAdd extends EventItem {
  String productId;
  OnItemAdd({required this.productId});
}
