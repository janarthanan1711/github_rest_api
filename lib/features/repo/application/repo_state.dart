part of 'repo_bloc.dart';

abstract class RepoState {}

final class RepoInitialState extends RepoState {}

class RepoLoading extends RepoState {}

class RepoLoaded extends RepoState {
  final List<Repository> repositories;

  RepoLoaded(this.repositories);
}

class RepoError extends RepoState {
  final String message;

  RepoError(this.message);
}