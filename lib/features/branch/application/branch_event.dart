part of 'branch_bloc.dart';

abstract class BranchEvent {}

class FetchBranchesWithCommitsEvent extends BranchEvent {
  final String repoName;

  FetchBranchesWithCommitsEvent({required this.repoName});
}

