import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/data/model/products_model.dart';

class StateProducts {
  RequestState? requestState;
  Failure? failure;
  ProductsModel? model;

  StateProducts({this.failure, this.model, this.requestState});

  StateProducts copyWith(
      {RequestState? requestState, Failure? failure, ProductsModel? model}) {
    return StateProducts(
        failure: failure ?? this.failure,
        model: model ?? this.model,
        requestState: requestState ?? this.requestState);
  }
}

class StateInitProducts extends StateProducts {
  StateInitProducts() : super(requestState: RequestState.init);
}
