import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repo/common/app_arguments.dart';
import 'package:github_repo/common/app_colors.dart';
import 'package:github_repo/core/utils/custom_appbar.dart';
import 'package:github_repo/core/utils/custom_text.dart';
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
        appBar: CustomAppBar(
          title: "Branches & Commits",
          automaticallyImplyLeading: true,
          centerTitle: false,
          backgroundColor: Theme.of(context).primaryColor,
        ),
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
                    title: MyText(
                      text: branch.name,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    children:
                        branch.commits
                            .map(
                              (commit) => ListTile(
                                title: MyText(
                                  text: commit.message,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: MyText(
                                  text: "${commit.author} • ${commit.date}",
                                  textStyle: TextStyle(color: AppColors.blue),
                                ),
                              ),
                            )
                            .toList(),
                  );
                },
              );
            } else if (state is BranchError) {
              return Center(child: MyText(text: state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
