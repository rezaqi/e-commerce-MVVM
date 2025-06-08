import 'package:e_commerce/core/class/failure/failure.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/features/data/model/get_account_model.dart';

class StateAccount {
  RequestState? requestStateGet;
  ModelGetAccount? model;
  Failure? failure;

  StateAccount({this.failure, this.model, this.requestStateGet});

  StateAccount copyWith(
      {RequestState? requestStateGet,
      ModelGetAccount? model,
      Failure? failure}) {
    return StateAccount(
        failure: failure ?? this.failure,
        model: model ?? this.model,
        requestStateGet: requestStateGet ?? this.requestStateGet);
  }
}

class StateInitAccount extends StateAccount {
  StateInitAccount() : super(requestStateGet: RequestState.init);
}
