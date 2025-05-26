import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repo/features/auth/application/usecases/get_user.dart';
import 'package:github_repo/features/auth/application/usecases/login_github.dart';
import 'package:github_repo/features/auth/application/usecases/logout_user.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithGitHub loginUseCase = GetIt.I<LoginWithGitHub>();
  final GetLoggedInUser getUserUseCase = GetIt.I<GetLoggedInUser>();
  final LogoutUser logoutUseCase = GetIt.I<LogoutUser>();

  AuthBloc() : super(AuthInitialState()) {
    on<AppStarted>(_onAppStarted);
    on<GitHubLoggedIn>(_onGitHubLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  /// Called when app starts — check if token is present.
  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    try {
      final user = await getUserUseCase();
      if (user != null && user.token.isNotEmpty) {
       
        emit(AuthAuthenticated(user.token));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError('Failed to check login status'));
    }
  }

  /// Called when GitHub login completes with a code.
  Future<void> _onGitHubLoggedIn(
    GitHubLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await loginUseCase(event.code);
      emit(AuthAuthenticated(user.token));
    } catch (e) {
      emit(AuthError('Login failed: ${e.toString()}'));
    }
  }

  /// Called when user logs out.
  Future<void> _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    await logoutUseCase();
    emit(AuthUnauthenticated());
  }
}
