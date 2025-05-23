part of 'auth_bloc.dart';

abstract class AuthEvent {}
class AppStarted extends AuthEvent {}

class GitHubLoggedIn extends AuthEvent {
  final String code;

  GitHubLoggedIn(this.code);
}

class LoggedOut extends AuthEvent {}