import 'package:github_repo/features/repo/data/repository/repo_data.dart';
import 'package:github_repo/features/repo/domain/models/repo_datas.dart';
import 'package:github_repo/features/repo/domain/repositories/repos_support.dart';

class RepoRepositoryImpl implements GithubRepository {
  final RepoRemoteDataSource remoteDataSource;

  RepoRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Repository>> getUserRepositories() async {
    final repoListJson = await remoteDataSource.fetchUserRepos();

    return repoListJson.map<Repository>((json) {
      return Repository(
        name: json['name'],
        isPrivate: json['private'],
        defaultBranch: json['default_branch'],
      );
    }).toList();
  }

  @override
    @override
  Future<String> getUsername() async {
    return await remoteDataSource.getAuthenticatedUsername(); // <-- Here
  }
}

