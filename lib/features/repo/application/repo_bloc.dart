import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repo/features/repo/application/usecases/get_repository.dart';
import 'package:github_repo/features/repo/domain/models/repo_datas.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  final GetRepositories getRepositories = GetIt.I<GetRepositories>();

  RepoBloc() : super(RepoInitialState()) {
    on<FetchRepositoriesEvent>(_onFetchRepositories);
  }

  Future<void> _onFetchRepositories(
    FetchRepositoriesEvent event,
    Emitter<RepoState> emit,
  ) async {
    print("FetchRepositoriesEvent triggered"); // Add this
    emit(RepoLoading());

    try {
      final List<Repository> repos = await _fetchRepositories();
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
