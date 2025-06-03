import 'package:e_commerce/features/auth/sign_up/data/model/request_model.dart';

abstract class SignUpEvent {
  SignUpRequestModel model;
  SignUpEvent(this.model);
}

class SignUpRequestEvent extends SignUpEvent {
  SignUpRequestEvent(super.model);
}
