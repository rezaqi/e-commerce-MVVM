import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/features/auth/sign_up/data/datasource/sign_up_ds.dart';
import 'package:e_commerce/features/auth/sign_up/data/model/request_model.dart';
import 'package:e_commerce/features/auth/sign_up/data/model/signup_model.dart';

class SignUpImplDS implements SignUpDS {
  ApiManager apiManager;
  SignUpImplDS(this.apiManager);

  @override
  Future<SignUpModel> signUp(SignUpRequestModel request) async {
    try {
      var res = await apiManager.postData(
          url: AppLinks.signUp, body: request.toJson());
      SignUpModel model = SignUpModel.fromJson(res.data);

      return model;
    } catch (e) {
      throw Exception("Failed to sign up");
    }
  }
}
