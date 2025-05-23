import 'package:github_repo/features/repo/domain/models/repo_datas.dart';
import 'package:github_repo/features/repo/domain/repositories/repos_support.dart';

class GetRepositories {
  final GithubRepository repository;

  GetRepositories(this.repository);

  Future<List<Repository>> call() async {
    return await repository.getUserRepositories();
  }
}

