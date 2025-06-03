import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/data/model/p_details_model.dart';

class StateItem {
  RequestState? requestState;
  Failure? failure;
  ModelProductDetails? model;

  StateItem({this.failure, this.model, this.requestState});

  StateItem copyWith(
      {RequestState? requestState,
      Failure? failure,
      ModelProductDetails? model}) {
    return StateItem(
        failure: failure ?? this.failure,
        model: model ?? this.model,
        requestState: requestState ?? this.requestState);
  }
}

class StateInitItem extends StateItem {}
