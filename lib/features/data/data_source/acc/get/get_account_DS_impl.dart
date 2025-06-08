import 'dart:async';

import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/core/class/cache/cache_helper.dart';
import 'package:e_commerce/features/data/data_source/acc/get/get_account_DS.dart';
import 'package:e_commerce/features/data/model/get_account_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAccountDs)
class GetAccountDsImpl implements GetAccountDs {
  ApiManager apiManager;
  GetAccountDsImpl({required this.apiManager});
  @override
  Future<ModelGetAccount> getAccount() async {
    try {
      var res = await apiManager.getData(
          url: AppLinks.accountGet, token: CacheHelper.getToken());
      return ModelGetAccount.fromJson(res.data);
    } catch (e) {
      print("--- error get account : $e");
      throw Exception(e);
    }
  }
}
