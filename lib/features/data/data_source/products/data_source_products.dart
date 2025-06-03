import 'package:e_commerce/features/data/model/products_model.dart';

abstract class DataSourceProducts {
  Future<ProductsModel> getProductes(String idSubCat);
}
