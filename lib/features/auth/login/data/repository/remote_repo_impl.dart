import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure_remote.dart';
import 'package:e_commerce/features/auth/login/data/data_suorce/remote_login_ds.dart';
import 'package:e_commerce/features/auth/login/data/model/login_model.dart';
import 'package:e_commerce/features/auth/login/doman/repository/login_repo.dart';

class RepoRemoteLogin implements RepositoryLogin {
  RemoteLoginDSImpl remoteLoginDSImpl;
  RepoRemoteLogin(this.remoteLoginDSImpl);
  @override
  Future<Either<FailureRemote, ModelLogin>> login(
      String email, String pass) async {
    try {
      var res = await remoteLoginDSImpl.login(email, pass);
      return Right(res);
    } catch (e) {
      return Left(FailureRemote(e.toString()));
    }
  }
}
