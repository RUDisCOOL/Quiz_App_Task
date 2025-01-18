class Option {
  int id;
  String description;
  int questionId;
  bool isCorrect;
  DateTime createdAt;
  DateTime updatedAt;
  bool unanswered;
  dynamic photoUrl;

  Option({
    required this.id,
    required this.description,
    required this.questionId,
    required this.isCorrect,
    required this.createdAt,
    required this.updatedAt,
    required this.unanswered,
    required this.photoUrl,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        description: json["description"],
        questionId: json["question_id"],
        isCorrect: json["is_correct"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        unanswered: json["unanswered"],
        photoUrl: json["photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "question_id": questionId,
        "is_correct": isCorrect,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "unanswered": unanswered,
        "photo_url": photoUrl,
      };
}
