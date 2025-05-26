import 'package:github_repo/features/repo/domain/models/repo_datas.dart';

abstract class GithubRepository {
  Future<List<Repository>> getUserRepositories();
  Future<String> getUsername();
}

