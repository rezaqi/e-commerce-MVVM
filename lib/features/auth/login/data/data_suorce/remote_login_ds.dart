import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/features/auth/login/data/data_suorce/login_ds.dart';
import 'package:e_commerce/features/auth/login/data/model/login_model.dart';

class RemoteLoginDSImpl implements LoginDS {
  ApiManager apiManager;
  RemoteLoginDSImpl(this.apiManager);
  @override
  Future<ModelLogin> login(String email, String pass) async {
    var res = await apiManager.postData(
        url: AppLinks.login, body: {"email": email, "password": pass});
    ModelLogin model = ModelLogin.fromJson(res.data);
    return model;
  }
}
