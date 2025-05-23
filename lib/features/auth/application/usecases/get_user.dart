import 'package:github_repo/features/auth/domain/models/user_token.dart';
import 'package:github_repo/features/auth/domain/repositories/auth_repo.dart';

class GetLoggedInUser {
  final AuthRepository repository;

  GetLoggedInUser(this.repository);

  Future<UserToken?> call() async {
    return await repository.getLoggedInUser();
  }
}