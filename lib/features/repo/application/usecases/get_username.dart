import 'package:github_repo/features/repo/domain/repositories/repos_support.dart';

class GetUsername {
  final GithubRepository repository;

  GetUsername(this.repository);

  Future<String> call() async {
    return await repository.getUsername();
  }
}