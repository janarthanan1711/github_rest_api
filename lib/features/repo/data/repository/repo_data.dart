import 'package:github_repo/core/network/dio_provider_impl.dart';
import 'package:github_repo/db/local_db.dart';

class RepoRemoteDataSource {
  Future<List<dynamic>> fetchUserRepos() async {
    final token = await AppSharedPreference.getToken();
    final response = await DioProviderImpl().get(
      'user/repos',
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );
    print("GitHub Repos API Status: ${response.statusCode}");
    print("GitHub Repos Response: ${response.data}");
    if (response.statusCode == 200) {
      print("Getting repo data----------->${response.data}");
      return response.data;
    } else {
      throw Exception('Failed to fetch repositories');
    }
  }
}
