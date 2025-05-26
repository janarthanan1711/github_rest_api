import 'package:github_repo/common/common.dart';
import 'package:github_repo/core/network/dio_provider_impl.dart';

class AuthRemoteDataSource {
  Future<String> exchangeCodeForToken(String code) async {
    final response = await DioProviderImpl().post(
      'https://github.com/login/oauth/access_token',
      body: {
        'client_id': AppConstants.clientId,
        'client_secret': AppConstants.clientSecret,
        'code': code,
      },
      headers: {'Accept': 'application/json'},
    );

    return response.data['access_token'];
  }
}
