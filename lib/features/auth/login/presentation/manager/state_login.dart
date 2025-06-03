import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/auth/login/data/model/login_model.dart';

class StateLogin {
  RequestState? state;
  Failure? error;
  ModelLogin? modelLogin;

  StateLogin({this.state, this.error, this.modelLogin});

  StateLogin copyWith(
      {RequestState? state, Failure? error, ModelLogin? modelLogin}) {
    return StateLogin(
        state: state ?? this.state,
        error: error ?? this.error,
        modelLogin: modelLogin ?? this.modelLogin);
  }
}

class StateInitLogin extends StateLogin {
  StateInitLogin() : super(state: RequestState.init);
}
