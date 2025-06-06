import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/data/model/cart/cart_model.dart';
import 'package:e_commerce/features/data/model/cart/delete_model.dart';
import 'package:e_commerce/features/data/model/cart/update_model.dart';

class StateCart {
  RequestState? requestState;
  ModelCart? model;
  Failure? failure;
  RequestState? requestStateDelete;
  ModelDeleteCart? modelDelete;
  Failure? failureDelete;
  RequestState? requestStateUpdate;
  ModelCartUpdate? modelUpdate;
  Failure? failureUpdate;
  int? count;

  StateCart(
      {this.requestState,
      this.count = 1,
      this.failure,
      this.model,
      this.failureDelete,
      this.requestStateDelete,
      this.modelDelete,
      this.failureUpdate,
      this.modelUpdate,
      this.requestStateUpdate});

  StateCart copyWith({
    RequestState? requestStateDelete,
    ModelDeleteCart? modelDelete,
    Failure? failureDelete,
    int? count,
    RequestState? requestState,
    ModelCart? model,
    Failure? failure,
    RequestState? requestStateUpdate,
    ModelCartUpdate? modelUpdate,
    Failure? failureUpdate,
  }) {
    return StateCart(
        requestStateDelete: requestStateDelete ?? this.requestStateDelete,
        failureDelete: failureDelete ?? this.failureDelete,
        modelDelete: modelDelete ?? this.modelDelete,
        requestStateUpdate: requestStateUpdate ?? this.requestStateUpdate,
        failureUpdate: failureUpdate ?? this.failureUpdate,
        modelUpdate: modelUpdate ?? this.modelUpdate,
        count: count ?? this.count,
        requestState: requestState ?? this.requestState,
        failure: failure ?? this.failure,
        model: model ?? this.model);
  }
}

class StateCartInit extends StateCart {
  StateCartInit() : super(requestState: RequestState.init);
}
