import 'package:e_commerce/core/class/failure/failure_remote.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/data/model/category_model.dart';
import 'package:e_commerce/features/doman/usecase/cat_usecase.dart';
import 'package:e_commerce/features/presentation/manager/home/event_home.dart';
import 'package:e_commerce/features/presentation/manager/home/state_cat.dart';
import 'package:e_commerce/features/presentation/pages/tabs/category_tab.dart';
import 'package:e_commerce/features/presentation/pages/tabs/fav.dart';
import 'package:e_commerce/features/presentation/pages/tabs/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomUseCase homeUseCase;
  int indexScreen = 0;
  List<Data>? allCategories;

  static HomeBloc get(context) => BlocProvider.of(context);
  HomeBloc({required this.homeUseCase}) : super(CatInitState()) {
    on<OnLoadHomeData>((event, emit) async {
      try {
        emit(state.copyWith(requestState: RequestState.loading));

        var res = await homeUseCase.call();
        var brandRes = await homeUseCase.callBrands();

// category
        res.fold((error) {
          emit(
              state.copyWith(requestState: RequestState.error, failure: error));
        }, (data) {
          allCategories = data.data;
          emit(state.copyWith(
              requestState: RequestState.success, categoryModel: data));
        });

// brand
        brandRes.fold((error) {
          emit(
              state.copyWith(requestState: RequestState.error, failure: error));
        }, (brandData) {
          emit(state.copyWith(
              requestState: RequestState.success, brandModelEn: brandData));
        });
      } catch (e) {
        emit(state.copyWith(
            requestState: RequestState.error,
            failure: FailureRemote(e.toString())));
      }
    });
  }

  changeScreen(int val) {
    print(indexScreen);
    indexScreen = val;
    emit(CatInitState());
    print(indexScreen);
  }

  List tabs = [
    HomeTab(),
    CategoryTab(),
    FavTab(),
    FavTab(),
  ];
}
