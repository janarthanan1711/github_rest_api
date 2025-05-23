import 'package:github_repo/features/auth/domain/repositories/auth_repo.dart';

class LogoutUser {
  final AuthRepository repository;

  LogoutUser(this.repository);

  Future<void> call() async {
    await repository.logout();
  }
}