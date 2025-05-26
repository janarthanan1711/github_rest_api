import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo/common/app_arguments.dart';
import 'package:github_repo/common/app_colors.dart';
import 'package:github_repo/core/utils/custom_appbar.dart';
import 'package:github_repo/core/utils/custom_text.dart';
import 'package:github_repo/features/branch/presentation/pages/branch_details.dart';

import '../../application/repo_bloc.dart';

class RepoListPage extends StatelessWidget {
  static const String routeName = '/repoListPage';
  const RepoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepoBloc()..add(FetchRepositoriesEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Repositories",
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: BlocListener<RepoBloc, RepoState>(
          listener: (context, state) {
            if (state is RepoError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: BlocBuilder<RepoBloc, RepoState>(
            builder: (context, state) {
              if (state is RepoLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RepoLoaded) {
                if (state.repositories.isEmpty) {
                  return const Center(child: Text('No repositories found'));
                }
                return ListView.builder(
                  itemCount: state.repositories.length,
                  itemBuilder: (context, index) {
                    final repo = state.repositories[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      color: AppColors.darkGrey,
                      elevation: 2,
                      child: ListTile(
                        title: MyText(
                          text: repo.name,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        subtitle: MyText(
                          text:
                              'Visibility: ${repo.isPrivate ? "Private" : "Public"}\nDefault branch: ${repo.defaultBranch}',
                        ),
                        isThreeLine: true,
                        trailing: const Icon(Icons.chevron_right, size: 35),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => BranchDetailsPage(
                                    args: BranchDetailsPageArguments(
                                      repoName: repo.name,
                                    ),
                                  ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              } else if (state is RepoError) {
                return Center(child: MyText(text: 'Error: ${state.message}'));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
