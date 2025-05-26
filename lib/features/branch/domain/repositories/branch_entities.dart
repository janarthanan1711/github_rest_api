class Branch {
  final String name;
  final List<Commit> commits;

  Branch({required this.name, required this.commits});
}

class Commit {
  final String message;
  final String author;
  final String date;

  Commit({required this.message, required this.author, required this.date});
}

abstract class RepoDetailRepository {
  Future<List<Branch>> getBranchesWithCommits(String repoName, String userName);
}
