import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repo/db/local_db.dart';
import 'package:github_repo/features/repo/application/usecases/get_repository.dart';
import 'package:github_repo/features/repo/application/usecases/get_username.dart';
import 'package:github_repo/features/repo/domain/models/repo_datas.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  final GetRepositories getRepositories = GetIt.I<GetRepositories>();
  final GetUsername getUsername = GetIt.I<GetUsername>();

  RepoBloc() : super(RepoInitialState()) {
    on<FetchRepositoriesEvent>(_onFetchRepositories);
  }

  Future<void> _onFetchRepositories(
    FetchRepositoriesEvent event,
    Emitter<RepoState> emit,
  ) async {
    // Add this
    emit(RepoLoading());

    try {
      final List<Repository> repos = await _fetchRepositories();
      final String username = await getUsername();
      await AppSharedPreference.setUserName(username);
      print("Authenticated username: $username");

      emit(RepoLoaded(repos));
    } catch (e) {
      emit(RepoError(_handleError(e)));
    }
  }

  Future<List<Repository>> _fetchRepositories() async {
    return await getRepositories();
  }

  String _handleError(Object error) {
    return error.toString();
  }
}
