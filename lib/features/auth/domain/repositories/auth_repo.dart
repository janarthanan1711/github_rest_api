import 'package:github_repo/features/auth/domain/models/user_token.dart';

abstract class AuthRepository {
  Future<UserToken> loginWithGitHub(String code);
  Future<UserToken?> getLoggedInUser();
  Future<void> logout();
}