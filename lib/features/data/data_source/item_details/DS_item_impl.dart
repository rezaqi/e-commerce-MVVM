import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/features/data/data_source/item_details/data_source.dart';
import 'package:e_commerce/features/data/model/p_details_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ItemDS)
class ItemDSImpl implements ItemDS {
  ApiManager api;
  ItemDSImpl({required this.api});

  @override
  Future<ModelProductDetails> getItemDetails(String id) async {
    try {
      var res = await api.getData(url: AppLinks.item(id));
      return ModelProductDetails.fromJson(res.data);
    } catch (e) {
      print("--------item : $e");
      throw Exception(e);
    }
  }
}
