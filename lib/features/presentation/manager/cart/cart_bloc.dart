import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/doman/usecase/cart/delete_cart_usecase.dart';
import 'package:e_commerce/features/doman/usecase/cart/get_cart_usecase.dart';
import 'package:e_commerce/features/doman/usecase/cart/update_usecae.dart';
import 'package:e_commerce/features/presentation/manager/cart/cart_event.dart';
import 'package:e_commerce/features/presentation/manager/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BlocCart extends Bloc<EventCart, StateCart> {
  UseCaseGetCart usecase;
  UseCaseDeleteCart usecaseDelete;
  UseCaseUpdateCart useCaseUpdateCart;
  static BlocCart get(context) => BlocProvider.of(context);
  BlocCart(
      {required this.usecase,
      required this.useCaseUpdateCart,
      required this.usecaseDelete})
      : super(StateCartInit()) {
    on<OnEventCart>((event, emit) async {
      try {
        emit(state.copyWith(requestState: RequestState.loading));
        var res = await usecase.call();
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

    on<OnEventUpdateCart>((event, emit) async {
      try {
        emit(state.copyWith(requestStateUpdate: RequestState.loading));
        var res = await useCaseUpdateCart.call(event.cartId, event.count);
        res.fold((error) {
          emit(state.copyWith(
              requestStateUpdate: RequestState.error, failureUpdate: error));
        }, (data) {
          emit(state.copyWith(
              requestStateUpdate: RequestState.success, modelUpdate: data));

          Future.microtask(() => add(OnEventCart()));
        });
      } catch (e) {
        emit(state.copyWith(
            requestStateUpdate: RequestState.error,
            failureUpdate: Failure(e.toString())));
      }
    });

    on<OnEventDeleteCart>((event, emit) async {
      try {
        emit(state.copyWith(requestStateDelete: RequestState.loading));
        var res = await usecaseDelete.call(event.cartId);
        res.fold((error) {
          emit(state.copyWith(
              requestStateDelete: RequestState.error, failureDelete: error));
        }, (data) {
          emit(state.copyWith(
              requestStateDelete: RequestState.success, modelDelete: data));

          Future.microtask(() => add(OnEventCart()));
        });
      } catch (e) {
        emit(state.copyWith(
            requestStateDelete: RequestState.error,
            failureDelete: Failure(e.toString())));
      }
    });
  }

  changeCount(bool isMore) {
    if (isMore) {
      print(state.count);
      emit(state.copyWith(count: state.count! + 1));
    } else {
      if (state.count! > 1) {
        print(state.count);
        emit(state.copyWith(count: state.count! - 1));
      }
    }
  }
}
