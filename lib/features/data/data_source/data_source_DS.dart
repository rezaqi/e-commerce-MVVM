import 'package:e_commerce/features/data/model/brand_model.dart';
import 'package:e_commerce/features/data/model/category_model.dart';

abstract class CategoriesDS {
  Future<CategoryModel> getCategory();
  Future<BrandModel> getBrand();
}
