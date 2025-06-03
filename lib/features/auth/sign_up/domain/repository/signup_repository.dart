import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/failure/failure_remote.dart';
import 'package:e_commerce/features/auth/sign_up/data/model/request_model.dart';
import 'package:e_commerce/features/auth/sign_up/data/model/signup_model.dart';

abstract class SignUpRepository {
  Future<Either<FailureRemote, SignUpModel>> signUp(SignUpRequestModel request);
}
