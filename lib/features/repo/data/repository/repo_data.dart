abstract class RepoRemoteDataSource {
  Future<List<dynamic>> fetchUserRepos();
  Future<String> getAuthenticatedUsername();
}
