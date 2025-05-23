part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitialState extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String token;

  AuthAuthenticated(this.token);
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
