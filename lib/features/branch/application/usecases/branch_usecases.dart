import 'package:github_repo/features/branch/domain/repositories/branch_entities.dart';

class GetBranchesWithCommits {
  final RepoDetailRepository repository;

  GetBranchesWithCommits(this.repository);

  Future<List<Branch>> call(String repoName,String userName) {
    return repository.getBranchesWithCommits(repoName,userName);
  }
}