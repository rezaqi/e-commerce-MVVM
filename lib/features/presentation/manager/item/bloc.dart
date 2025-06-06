import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/doman/usecase/cart/add_usecase.dart';
import 'package:e_commerce/features/doman/usecase/item_usecase.dart';
import 'package:e_commerce/features/presentation/manager/item/event.dart';
import 'package:e_commerce/features/presentation/manager/item/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BlocItem extends Bloc<EventItem, StateItem> {
  UseCaseItem usecase;
  UseCaseAddToCart useCaseAddToCart;

  static BlocItem get(context) => BlocProvider.of(context);
  BlocItem({required this.usecase, required this.useCaseAddToCart})
      : super(StateInitItem()) {
    on<OnItem>((event, emit) async {
      try {
        emit(state.copyWith(requestState: RequestState.loading));

        var res = await usecase.call(event.id);
        res.fold((error) {
          emit(
              state.copyWith(requestState: RequestState.error, failure: error));
        }, (data) {
          emit(state.copyWith(requestState: RequestState.success, model: data));
        });
      } catch (e) {
        emit(state.copyWith(
            requestState: RequestState.error, failure: Failure(e.toString())));
      }
    });

    on<OnItemAdd>((event, emit) async {
      try {
        emit(state.copyWith(requestStateCart: RequestState.loading));
        var res = await useCaseAddToCart.call("${state.model?.data?.id}");
        return res.fold((error) {
          emit(state.copyWith(
              requestStateCart: RequestState.error, failureCart: error));
        }, (data) {
          emit(state.copyWith(
              requestStateCart: RequestState.success, modelCart: data));
        });
      } catch (e) {
        emit(state.copyWith(
            requestStateCart: RequestState.error,
            failureCart: Failure(e.toString())));
      }
    });
  }

  changeCount(bool isMore) {
    print(isMore);
    if (isMore) {
      print(state.count);
      emit(state.copyWith(count: state.count + 1));
    } else {
      if (state.count > 1) {
        print(state.count);
        emit(state.copyWith(count: state.count - 1));
      }
    }
  }

  num totalPrice(num price) {
    return state.count * price;
  }
}
