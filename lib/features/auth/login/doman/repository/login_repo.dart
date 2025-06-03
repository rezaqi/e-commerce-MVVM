import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure_remote.dart';
import 'package:e_commerce/features/auth/login/data/model/login_model.dart';

abstract class RepositoryLogin {
  Future<Either<FailureRemote, ModelLogin>> login(String email, String pass);
}
