import 'package:e_commerce/core/class/states/request_state.dart';

class StateFav {
  RequestState? requestState;
  bool? isAdd;

  StateFav({this.isAdd, this.requestState});

  StateFav copyWith({RequestState? requestState, bool? isAdd}) {
    return StateFav(
        requestState: requestState ?? this.requestState,
        isAdd: isAdd ?? this.isAdd);
  }
}

class StateInitFav extends StateFav {
  StateInitFav() : super(requestState: RequestState.init);
}
