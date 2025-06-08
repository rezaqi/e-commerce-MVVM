abstract class EventFav {}

class OnEventAddFav extends EventFav {
  String itemId;
  OnEventAddFav({required this.itemId});
}

class OnEventGetFav extends EventFav {}

class OnEventRemoveFav extends EventFav {
  String itemId;
  OnEventRemoveFav({required this.itemId});
}
