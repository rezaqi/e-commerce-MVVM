abstract class EventFav {}

class OnEventAddFav extends EventFav {
  String itemId;
  OnEventAddFav({required this.itemId});
}

class OnEventGetFav extends EventFav {}
