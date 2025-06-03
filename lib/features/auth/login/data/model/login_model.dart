import 'package:e_commerce/features/auth/sign_up/data/model/signup_model.dart';

class ModelLogin extends SignUpModel {
  ModelLogin.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }
}
