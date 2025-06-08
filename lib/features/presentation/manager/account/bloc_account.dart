import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/doman/usecase/account/get_account_usecase.dart';
import 'package:e_commerce/features/presentation/manager/account/event_account.dart';
import 'package:e_commerce/features/presentation/manager/account/state_acount.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BlocAccount extends Bloc<EventAccount, StateAccount> {
  GetAccountUsecase getAccountUsecase;
  BlocAccount({required this.getAccountUsecase}) : super(StateInitAccount()) {
    on<OnEventGetAccount>((event, emit) async {
      try {
        emit(state.copyWith(requestStateGet: RequestState.loading));

        var res = await getAccountUsecase.call();
        res.fold((error) {
          emit(state.copyWith(
              requestStateGet: RequestState.error, failure: error));
        }, (data) {
          emit(state.copyWith(
              requestStateGet: RequestState.success, model: data));
        });
      } catch (e) {
        emit(state.copyWith(
            requestStateGet: RequestState.error,
            failure: Failure(e.toString())));
      }
    });
  }
}
