import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repostory.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<User, UserSignUpParam> {
  final AuthRepository authRepository;
  const UserSignUp({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, User>> call(UserSignUpParam params) async {
    return await authRepository.signUpWithEmailPassword(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class UserSignUpParam {
  final String email;
  final String password;
  final String name;

  UserSignUpParam({
    required this.email,
    required this.password,
    required this.name,
  });
}
