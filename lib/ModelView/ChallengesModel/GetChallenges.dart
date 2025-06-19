class Getchallenges {
  final List<ChallengeModel> challenges;

  Getchallenges({required this.challenges});

  factory Getchallenges.fromJson(Map<String, dynamic> json) {
    return Getchallenges(
      challenges: List<ChallengeModel>.from(
        json['challenges'].map((x) => ChallengeModel.fromJson(x)),
      ),
    );
  }
}

class ChallengeModel {
  final int id;
  final String title;
  final SolutionModel solution;

  ChallengeModel({
    required this.id,
    required this.title,
    required this.solution,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'],
      title: json['title'],
      solution: SolutionModel.fromJson(json['solution']),
    );
  }
}

class SolutionModel {
  final int id;
  final String contents;
  final String createdAt;
  final String updatedAt;

  SolutionModel({
    required this.id,
    required this.contents,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SolutionModel.fromJson(Map<String, dynamic> json) {
    return SolutionModel(
      id: json['id'],
      contents: json['contents'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
