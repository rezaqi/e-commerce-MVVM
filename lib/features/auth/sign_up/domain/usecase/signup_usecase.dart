import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure_remote.dart';
import 'package:e_commerce/features/auth/sign_up/data/model/request_model.dart';
import 'package:e_commerce/features/auth/sign_up/data/model/signup_model.dart';
import 'package:e_commerce/features/auth/sign_up/domain/repository/signup_repository.dart';

class SignupUseCase {
  SignUpRepository signUpRepo;
  SignupUseCase(this.signUpRepo);

  Future<Either<FailureRemote, SignUpModel>> call(
          {required SignUpRequestModel request}) =>
      signUpRepo.signUp(request);
}
