import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure_remote.dart';
import 'package:e_commerce/features/auth/login/data/model/login_model.dart';
import 'package:e_commerce/features/auth/login/doman/repository/login_repo.dart';

class UseCaseLogin {
  RepositoryLogin repoLogin;
  UseCaseLogin(this.repoLogin);
  Future<Either<FailureRemote, ModelLogin>> call(String email, String pass) =>
      repoLogin.login(email, pass);
}
