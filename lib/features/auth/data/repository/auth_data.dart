import 'package:github_repo/core/network/dio_provider_impl.dart';

class AuthRemoteDataSource {
  Future<String> exchangeCodeForToken(String code) async {
    final response = await DioProviderImpl().post(
      'https://github.com/login/oauth/access_token',
      body: {
        'client_id': 'Ov23liCNMiykNLqADnFL',
        'client_secret': '30e6d64cb55c51c0878816764276cdb4cc8e8d0f',
        'code': code,
      },
      headers: {'Accept': 'application/json'},
    );
    return response.data['access_token'];
  }
}
