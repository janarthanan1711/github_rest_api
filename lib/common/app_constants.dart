class AppConstants {
  static const String title = 'Github Repo';
  static const String baseUrl = 'https://api.github.com/';
  // static const String clientId = "";
  // static const String clientSecret = "";
  static const String clientId = String.fromEnvironment('GITHUB_CLIENT_ID');
  static const String clientSecret = String.fromEnvironment(
    'GITHUB_CLIENT_SECRET',
  );
}
