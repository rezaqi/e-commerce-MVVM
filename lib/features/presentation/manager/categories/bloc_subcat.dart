import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/doman/repository/repo_cat.dart';
import 'package:e_commerce/features/doman/usecase/subcat_usecase.dart';
import 'package:e_commerce/features/presentation/manager/categories/event_subcat.dart';
import 'package:e_commerce/features/presentation/manager/categories/state_subcat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubCatBloc extends Bloc<SubCatEvent, StateSubCat> {
  SubcatUsecase usecase;
  HomeRepo repo;
  int index = 0;

  SubCatBloc({required this.usecase, required this.repo})
      : super(StateInitSubcat()) {
    on<SubCatEvent>(
      (event, emit) async {
        try {
          emit(state.copyWith(requestState: RequestState.loading));
          var res = await repo.getCategories();
          res.fold((error) {
            emit(state.copyWith(
                requestState: RequestState.error, failure: error));
          }, (data) {
            emit(state.copyWith(
                requestState: RequestState.success, model: data));
            // print("🔁 SubCatEvent triggered");

            // final id = data.data?[index].sId;
            // if (id != null) {
            //   add(OnItem(id: id));
            // }
          });
        } catch (e) {
          emit(state.copyWith(
              requestState: RequestState.error,
              failure: Failure(e.toString())));
        }
      },
    );

    on<OnItems>((event, emit) async {
      try {
        emit(state.copyWith(subRequestState: RequestState.loading));
        print("******************hh**********************");
        print(event.id);
        var res = await usecase.callItem(event.id);
        res.fold((error) {
          emit(state.copyWith(
              subRequestState: RequestState.error, subFailure: error));
        }, (data) {
          emit(state.copyWith(
              subRequestState: RequestState.success, modelItem: data));
          print("📦 OnItem triggered for ID: ${event.id}");
        });
      } catch (e) {
        emit(state.copyWith(
            subRequestState: RequestState.error,
            failure: Failure(e.toString())));
      }
    });
  }

  changeCat(int i) {
    index = i;
    print(index);
    add(OnItems(id: "${state.model?.data?[index].sId}"));
    emit(state.copyWith());
  }
}
