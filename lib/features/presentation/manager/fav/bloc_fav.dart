import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/doman/usecase/fav/add_usecase.dart';
import 'package:e_commerce/features/doman/usecase/fav/get_usecase.dart';
import 'package:e_commerce/features/doman/usecase/fav/remove_usecase.dart';
import 'package:e_commerce/features/presentation/manager/fav/event_fav.dart';
import 'package:e_commerce/features/presentation/manager/fav/state_fav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BlocFav extends Bloc<EventFav, StateFav> {
  AddFavUseCase usecaseAdd;
  RemoveFavUseCase usecaseRemove;
  GetFavUseCase usecaseGet;
  List<String> listFav = [];

  static BlocFav get(context) => BlocProvider.of(context);
  BlocFav({
    required this.usecaseRemove,
    required this.usecaseGet,
    required this.usecaseAdd,
  }) : super(StateInitFav()) {
    on<OnEventAddFav>((event, emit) async {
      try {
        emit(state.copyWith(requestState: RequestState.loading));
        var res = await usecaseAdd.call(event.itemId);
        if (res) {
          emit(state.copyWith(
            requestState: RequestState.success,
          ));
          await Future.microtask(() => add(OnEventGetFav()));
          emit(state.copyWith(isAdd: true));
        } else {
          emit(state.copyWith(requestState: RequestState.error, isAdd: res));
        }
      } catch (e) {
        print("----- $e");
        emit(state.copyWith(requestState: RequestState.error, isAdd: false));
      }
    });

    on<OnEventRemoveFav>((event, emit) async {
      try {
        emit(state.copyWith(requestStateRmove: RequestState.loading));
        var res = await usecaseRemove.call(event.itemId);
        if (res) {
          emit(state.copyWith(
              requestStateRmove: RequestState.success, isRemove: res));

          Future.microtask(() => add(OnEventGetFav()));
        } else {
          emit(state.copyWith(
              requestStateRmove: RequestState.error, isRemove: res));
        }
      } catch (e) {
        print("----- $e");
        emit(state.copyWith(
            requestStateRmove: RequestState.error, isRemove: false));
      }
    });

    on<OnEventGetFav>((event, emit) async {
      try {
        emit(state.copyWith(requestStateGet: RequestState.loading));
        var res = await usecaseGet.call();
        res.fold((error) {
          emit(state.copyWith(
              requestStateGet: RequestState.error, failure: error));
        }, (data) {
          emit(state.copyWith(model: data));
          listFav.clear();
          for (var i = 0; i < state.model!.data!.length; i++) {
            listFav.add("${state.model!.data![i].id}");
          }
          emit(state.copyWith(
            requestStateGet: RequestState.success,
          ));
        });
      } catch (e) {
        print("----- $e");
        emit(state.copyWith(
            requestStateGet: RequestState.error,
            failure: Failure(e.toString())));
      }
    });
  }
}
