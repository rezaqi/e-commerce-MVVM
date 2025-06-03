import 'package:e_commerce/features/auth/sign_up/data/model/request_model.dart';
import 'package:e_commerce/features/auth/sign_up/data/model/signup_model.dart';

abstract class SignUpDS {
  Future<SignUpModel> signUp(SignUpRequestModel request);
}
