abstract class SubCatEvent {}

class OnSubCat extends SubCatEvent {}

class OnItems extends SubCatEvent {
  String id;
  OnItems({required this.id});
}
