import 'package:github_repo/core/network/dio_provider_impl.dart';
import 'package:github_repo/db/local_db.dart';
import 'package:github_repo/features/repo/data/repository/repo_data.dart';

class RepoRemoteDataSourceImpl extends RepoRemoteDataSource {
  @override
  Future<List<dynamic>> fetchUserRepos() async {
    final token = await AppSharedPreference.getToken();
    final response = await DioProviderImpl().get(
      'user/repos',
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to fetch repositories');
    }
  }

  @override
  Future<String> getAuthenticatedUsername() async {
    final token = await AppSharedPreference.getToken();
    final response = await DioProviderImpl().get(
      'https://api.github.com/user',
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      return response.data['login'];
    } else {
      throw Exception("Failed to fetch authenticated user's login");
    }
  }
}
