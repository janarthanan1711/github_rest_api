part of 'branch_bloc.dart';

abstract class BranchState {}

class BranchInitialState extends BranchState {}

class BranchLoading extends BranchState {}

class BranchLoaded extends BranchState {
  final List<Branch> branches;

  BranchLoaded(this.branches);
}

class BranchError extends BranchState {
  final String message;

  BranchError(this.message);
}
