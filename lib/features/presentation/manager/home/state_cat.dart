import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/data/model/category_model.dart';
import 'package:e_commerce/features/doman/entity/brand_model_en.dart';

class HomeState {
  RequestState? requestState;
  CategoryModel? categoryModel;
  BrandModelEntity? brandModelEn;
  Failure? failure;

  HomeState(
      {this.categoryModel, this.failure, this.brandModelEn, this.requestState});

  HomeState copyWith(
      {RequestState? requestState,
      CategoryModel? categoryModel,
      BrandModelEntity? brandModelEn,
      Failure? failure}) {
    return HomeState(
        requestState: requestState ?? this.requestState,
        categoryModel: categoryModel ?? this.categoryModel,
        brandModelEn: brandModelEn ?? this.brandModelEn,
        failure: failure ?? this.failure);
  }
}

class CatInitState extends HomeState {
  CatInitState() : super(requestState: RequestState.init);
}

class BrandInitState extends HomeState {
  BrandInitState() : super(requestState: RequestState.init);
}
