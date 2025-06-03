import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/features/data/data_source/data_source_DS.dart';
import 'package:e_commerce/features/data/model/brand_model.dart';
import 'package:e_commerce/features/data/model/category_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesDS)
class CatRemoteImplDS implements CategoriesDS {
  ApiManager apiManager;

  CatRemoteImplDS({required this.apiManager});

  @override
  Future<CategoryModel> getCategory() async {
    try {
      var res = await apiManager.getData(url: AppLinks.getCat);
      return CategoryModel.fromJson(res.data);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Future<BrandModel> getBrand() async {
    try {
      var res = await apiManager.getData(url: AppLinks.getBrands);
      return BrandModel.fromJson(res.data);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
