import 'package:e_commerce/features/auth/login/data/model/login_model.dart';

abstract class LoginDS {
  Future<ModelLogin> login(String email, String pass);
}
