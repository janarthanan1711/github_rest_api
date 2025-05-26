import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repo/common/app_arguments.dart';
import 'package:github_repo/features/branch/application/branch_bloc.dart';

class BranchDetailsPage extends StatelessWidget {
  static const String routeName = '/branchDetailsPage';

  final BranchDetailsPageArguments args;
  const BranchDetailsPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              GetIt.I<BranchBloc>()
                ..add(FetchBranchesWithCommitsEvent(repoName: args.repoName)),
      child: Scaffold(
        appBar: AppBar(title: Text("Branches & Commits")),
        body: BlocBuilder<BranchBloc, BranchState>(
          builder: (context, state) {
            if (state is BranchLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is BranchLoaded) {
              return ListView.builder(
                itemCount: state.branches.length,
                itemBuilder: (context, index) {
                  final branch = state.branches[index];
                  return ExpansionTile(
                    title: Text(branch.name),
                    children:
                        branch.commits
                            .map(
                              (commit) => ListTile(
                                title: Text(commit.message),
                                subtitle: Text(
                                  "${commit.author} • ${commit.date}",
                                ),
                              ),
                            )
                            .toList(),
                  );
                },
              );
            } else if (state is BranchError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
