import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/data/model/fav/get_model.dart';

class StateFav {
  RequestState? requestState;
  bool? isAdd;
  RequestState? requestStateGet;
  ModelGetFav? model;
  Failure? failure;

  StateFav(
      {this.isAdd,
      this.requestState,
      this.failure,
      this.model,
      this.requestStateGet});

  StateFav copyWith({
    RequestState? requestState,
    bool? isAdd,
    RequestState? requestStateGet,
    ModelGetFav? model,
    Failure? failure,
  }) {
    return StateFav(
        requestStateGet: requestStateGet ?? this.requestStateGet,
        model: model ?? this.model,
        failure: failure ?? this.failure,
        requestState: requestState ?? this.requestState,
        isAdd: isAdd ?? this.isAdd);
  }
}

class StateInitFav extends StateFav {
  StateInitFav() : super(requestState: RequestState.init);
}
