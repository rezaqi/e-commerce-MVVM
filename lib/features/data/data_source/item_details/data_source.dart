import 'package:e_commerce/features/data/model/p_details_model.dart';

abstract class ItemDS {
  Future<ModelProductDetails> getItemDetails(String id);
}
