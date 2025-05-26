import 'package:github_repo/core/network/dio_provider_impl.dart';
import 'package:github_repo/db/local_db.dart';
import 'package:github_repo/features/branch/domain/models/branch_model.dart';

abstract class RepoDetailRemoteDataSource {
  Future<List<BranchModel>> fetchBranches(String repoName, String userName);
  Future<List<CommitModel>> fetchCommits(
    String repoName,
    String branchName,
    String userName,
  );
}

class RepoDetailRemoteDataSourceImpl implements RepoDetailRemoteDataSource {
  @override
  Future<List<BranchModel>> fetchBranches(
    String repoName,
    String userName,
  ) async {
    final token = await AppSharedPreference.getToken();
    final response = await DioProviderImpl().get(
      'https://api.github.com/repos/$userName/$repoName/branches',
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );
    print(
      "Getting branche details ----------->${response.data} ${response.statusCode} ${repoName}",
    );
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => BranchModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to fetch branches');
    }
  }

  @override
  Future<List<CommitModel>> fetchCommits(
    String repoName,
    String branchName,
    String userName,
  ) async {
    final token = await AppSharedPreference.getToken();
    final response = await DioProviderImpl().get(
      'https://api.github.com/repos/$userName/$repoName/commits?sha=$branchName&per_page=5',
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    print(
      "Getting commit details ----------->${response.data} ${response.statusCode} ${repoName} ${branchName}",
    );

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => CommitModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to fetch commits');
    }
  }
}
