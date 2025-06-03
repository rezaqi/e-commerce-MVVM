import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/doman/usecase/products_usecase.dart';
import 'package:e_commerce/features/presentation/manager/products/event.dart';
import 'package:e_commerce/features/presentation/manager/products/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BlocProducts extends Bloc<EventProducts, StateProducts> {
  UseCaseProducts useCase;
  BlocProducts({required this.useCase}) : super(StateInitProducts()) {
    on<OnProducts>((event, emit) async {
      try {
        emit(state.copyWith(requestState: RequestState.loading));
        var res = await useCase.call(event.id);
        return res.fold((error) {
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
  }
}
