import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure_remote.dart';
import 'package:e_commerce/features/auth/sign_up/data/datasource/sign_up_ds.dart';
import 'package:e_commerce/features/auth/sign_up/data/model/request_model.dart';
import 'package:e_commerce/features/auth/sign_up/data/model/signup_model.dart';
import 'package:e_commerce/features/auth/sign_up/domain/repository/signup_repository.dart';

class RepoRemoteSignUp implements SignUpRepository {
  SignUpDS signUpDS;
  RepoRemoteSignUp(this.signUpDS);

  @override
  Future<Either<FailureRemote, SignUpModel>> signUp(
      SignUpRequestModel request) async {
    try {
      var result = await signUpDS.signUp(request);

      return Right(result);
    } catch (e) {
      return Left(FailureRemote(e.toString()));
    }
  }
}
