class Repository {
  final String name;
  final bool isPrivate;
  final String defaultBranch;

  Repository({
    required this.name,
    required this.isPrivate,
    required this.defaultBranch,
  });
}
