import 'package:e_commerce/features/doman/repository/fav/remove_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFavUseCase {
  RemoveFavRepo repo;
  RemoveFavUseCase({required this.repo});

  Future<bool> call(String itemId) => repo.removeFavItem(itemId);
}
