import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/doman/usecase/item_usecase.dart';
import 'package:e_commerce/features/presentation/manager/item/event.dart';
import 'package:e_commerce/features/presentation/manager/item/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BlocItem extends Bloc<EventItem, StateItem> {
  UseCaseItem usecase;
  BlocItem({required this.usecase}) : super(StateInitItem()) {
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
  }
}
