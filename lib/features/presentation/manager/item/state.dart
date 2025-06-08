import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/data/model/cart/details_add_to_cart.dart';
import 'package:e_commerce/features/data/model/p_details_model.dart';

class StateItem {
  RequestState? requestState;
  Failure? failure;
  RequestState? requestStatePage;
  ModelProductDetails? model;
  int count = 1;
  ModelDetailsAddToCart? modelCart;
  RequestState? requestStateCart;
  Failure? failureCart;

  StateItem(
      {this.failure,
      this.model,
      this.requestStatePage,
      this.requestState,
      this.count = 1,
      this.modelCart,
      this.failureCart,
      this.requestStateCart});

  StateItem copyWith({
    RequestState? requestState,
    RequestState? requestStatePage,
    Failure? failure,
    ModelProductDetails? model,
    int? count,
    ModelDetailsAddToCart? modelCart,
    RequestState? requestStateCart,
    Failure? failureCart,
  }) {
    return StateItem(
        requestStatePage: requestStatePage ?? this.requestStatePage,
        failure: failure ?? this.failure,
        model: model ?? this.model,
        count: count ?? this.count,
        requestState: requestState ?? this.requestState,
        failureCart: failureCart ?? this.failureCart,
        modelCart: modelCart ?? this.modelCart,
        requestStateCart: requestStateCart ?? this.requestStateCart);
  }
}

class StateInitItem extends StateItem {}
