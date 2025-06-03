import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/auth/sign_up/domain/usecase/signup_usecase.dart';
import 'package:e_commerce/features/auth/sign_up/presentation/bloc/event.dart';
import 'package:e_commerce/features/auth/sign_up/presentation/bloc/state.dart';

import '../../../../../core/class/failure/failure_remote.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignupUseCase signupUseCase;
  SignUpBloc(this.signupUseCase) : super(SignUpInitial()) {
    on<SignUpRequestEvent>((event, emit) async {
      try {
        emit(state.copyWith(requestState: RequestState.loading));

        var res = await signupUseCase.call(request: event.model);
        res.fold((error) {
          emit(
              state.copyWith(requestState: RequestState.error, failure: error));
        }, (data) {
          emit(state.copyWith(requestState: RequestState.success, model: data));
        });
      } catch (e) {
        print("Exception: $e");
        emit(state.copyWith(
            requestState: RequestState.error,
            failure: FailureRemote(e.toString())));
      }
    });
  }
}
