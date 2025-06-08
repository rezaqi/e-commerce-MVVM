abstract class EventProducts {
  String id;
  EventProducts({required this.id});
}

class OnProducts extends EventProducts {
  OnProducts({required super.id});
}

class OnClickFav extends EventProducts {
  OnClickFav({required super.id});
}
