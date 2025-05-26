import 'package:github_repo/features/branch/data/repository/branch_api.dart';
import 'package:github_repo/features/branch/domain/repositories/branch_entities.dart';

class RepoDetailRepositoryImpl implements RepoDetailRepository {
  final RepoDetailRemoteDataSource remoteDataSource;

  RepoDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Branch>> getBranchesWithCommits(
    String repoName,
    String userName,
  ) async {
    final branches = await remoteDataSource.fetchBranches(repoName, userName);

    return Future.wait(
      branches.map((branch) async {
        final commits = await remoteDataSource.fetchCommits(
          repoName,
          branch.name,
          userName,
        );
        return Branch(
          name: branch.name,
          commits:
              commits
                  .map(
                    (c) => Commit(
                      message: c.message,
                      author: c.author,
                      date: c.date,
                    ),
                  )
                  .toList(),
        );
      }),
    );
  }
}
