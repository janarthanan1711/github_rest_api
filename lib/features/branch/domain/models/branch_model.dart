class BranchModel {
  final String name;

  BranchModel({required this.name});

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(name: json['name']);
  }
}

class CommitModel {
  final String message;
  final String author;
  final String date;

  CommitModel({required this.message, required this.author, required this.date});

  factory CommitModel.fromJson(Map<String, dynamic> json) {
    return CommitModel(
      message: json['commit']['message'],
      author: json['commit']['author']['name'],
      date: json['commit']['author']['date'],
    );
  }
}