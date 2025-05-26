import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repo/db/local_db.dart';
import 'package:github_repo/features/branch/application/usecases/branch_usecases.dart';
import 'package:github_repo/features/branch/domain/repositories/branch_entities.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final GetBranchesWithCommits getBranchesWithCommits =
      GetIt.I<GetBranchesWithCommits>();

  BranchBloc() : super(BranchInitialState()) {
    on<FetchBranchesWithCommitsEvent>(_onFetchBranches);
  }

  Future<void> _onFetchBranches(
    FetchBranchesWithCommitsEvent event,
    Emitter<BranchState> emit,
  ) async {
    emit(BranchLoading());
    try {
      final userName = await AppSharedPreference.getUsername();
      final branches = await getBranchesWithCommits(event.repoName, userName);
      emit(BranchLoaded(branches));
    } catch (e) {
      emit(BranchError("Failed to load branches: ${e.toString()}"));
    }
  }
}
