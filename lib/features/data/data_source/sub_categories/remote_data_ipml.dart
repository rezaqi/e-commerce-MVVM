import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/features/data/data_source/sub_categories/data_source_DS.dart';
import 'package:e_commerce/features/data/model/category_model.dart';
import 'package:e_commerce/features/data/model/sub_cat_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubCategoriesDS)
class SubCategories implements SubCategoriesDS {
  ApiManager apiManager;

  SubCategories({required this.apiManager});

  @override
  Future<CategoryModel> getSubCategories() async {
    try {
      var res = await apiManager.getData(url: AppLinks.getCat);
      return CategoryModel.fromJson(res.data);
    } catch (e) {
      print("Error  : $e");
      throw Exception();
    }
  }

  @override
  Future<SubCategoriesModel> getItems(String id) async {
    try {
      var res = await apiManager.getData(url: AppLinks.subCategories(id));
      print("*******************************************");
      print(res);

      print("*******************************************");

      return SubCategoriesModel.fromJson(res.data);
    } catch (e) {
      print("Error  : $e");
      throw Exception();
    }
  }
}
