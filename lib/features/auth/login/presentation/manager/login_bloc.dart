import 'package:e_commerce/core/class/failure/failure_remote.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/auth/login/doman/usecase/login_use_case.dart';
import 'package:e_commerce/features/auth/login/presentation/manager/event_login.dart';
import 'package:e_commerce/features/auth/login/presentation/manager/state_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocLogin extends Bloc<EventLogin, StateLogin> {
  UseCaseLogin useCaseLogin;
  BlocLogin(this.useCaseLogin) : super(StateInitLogin()) {
    on<EventLoginEx>((event, emit) async {
      try {
        emit(state.copyWith(state: RequestState.loading));
        var res =
            await useCaseLogin.call(event.emailC!.text, event.passC!.text);
        res.fold((error) {
          emit(state.copyWith(state: RequestState.error, error: error));
        }, (data) {
          emit(state.copyWith(state: RequestState.success, modelLogin: data));
        });
      } catch (e) {
        emit(state.copyWith(
            state: RequestState.error, error: FailureRemote(e.toString())));
      }
    });
  }
}
