import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/auth/sign_up/data/model/signup_model.dart';

class SignUpState {
  SignUpModel? model;
  RequestState? requestState;
  Failure? failure;
  SignUpState({this.model, this.failure, this.requestState});

  SignUpState copyWith(
      {SignUpModel? model, RequestState? requestState, Failure? failure}) {
    return SignUpState(
        model: model ?? this.model,
        requestState: requestState ?? this.requestState,
        failure: failure ?? this.failure);
  }
}

final class SignUpInitial extends SignUpState {
  SignUpInitial() : super(requestState: RequestState.init);
}
