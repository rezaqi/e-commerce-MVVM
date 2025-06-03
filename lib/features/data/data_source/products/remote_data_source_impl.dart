import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/features/data/data_source/products/data_source_products.dart';
import 'package:e_commerce/features/data/model/products_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DataSourceProducts)
class DateSourceRemoteProductsImpl implements DataSourceProducts {
  ApiManager api;
  DateSourceRemoteProductsImpl({required this.api});

  @override
  Future<ProductsModel> getProductes(String idSubCat) async {
    try {
      print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
      print(AppLinks.products(idSubCat));
      var res = await api.getData(url: AppLinks.products(idSubCat));

      print("_______________________________________-");
      print(res.data);
      return ProductsModel.fromJson(res.data);
    } catch (e) {
      print("++++++ products : $e");
      throw Exception(e);
    }
  }
}
