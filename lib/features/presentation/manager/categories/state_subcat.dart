import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/data/model/category_model.dart';
import 'package:e_commerce/features/data/model/sub_cat_model.dart';

class StateSubCat {
  RequestState? requestState;
  RequestState? subRequestState;
  CategoryModel? model;
  SubCategoriesModel? modelItem;
  Failure? failure;
  Failure? subFailure;

  StateSubCat(
      {this.failure,
      this.subFailure,
      this.model,
      this.modelItem,
      this.requestState,
      this.subRequestState});

  StateSubCat copyWith({
    RequestState? requestState,
    RequestState? subRequestState,
    CategoryModel? model,
    SubCategoriesModel? modelItem,
    Failure? failure,
    Failure? subFailure,
  }) {
    return StateSubCat(
        requestState: requestState ?? this.requestState,
        model: model ?? this.model,
        subRequestState: subRequestState ?? this.subRequestState,
        modelItem: modelItem ?? this.modelItem,
        failure: failure ?? this.failure,
        subFailure: subFailure ?? this.subFailure);
  }
}

class StateInitSubcat extends StateSubCat {
  StateInitSubcat() : super(requestState: RequestState.init);
}

class StateInitItem extends StateSubCat {
  StateInitItem() : super(subRequestState: RequestState.init);
}
