
import 'package:github_repo/features/auth/domain/models/user_token.dart';
import 'package:github_repo/features/auth/domain/repositories/auth_repo.dart';

class LoginWithGitHub {
  final AuthRepository repository;

  LoginWithGitHub(this.repository);

  Future<UserToken> call(String code) async {
    return await repository.loginWithGitHub(code);
  }
}