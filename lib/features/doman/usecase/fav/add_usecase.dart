import 'package:e_commerce/features/doman/repository/fav/add_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddFavUseCase {
  AddFavRepo repo;
  AddFavUseCase({required this.repo});

  Future<bool> call(String itemId) => repo.addFavItem(itemId);
}
