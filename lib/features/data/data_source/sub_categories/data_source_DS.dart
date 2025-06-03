import 'package:e_commerce/features/data/model/category_model.dart';
import 'package:e_commerce/features/data/model/sub_cat_model.dart';

abstract class SubCategoriesDS {
  Future<CategoryModel> getSubCategories();
  Future<SubCategoriesModel> getItems(String id);
}
