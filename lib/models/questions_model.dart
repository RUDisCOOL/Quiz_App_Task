import 'package:quiz_app_flutter_task/models/options_model.dart';
import 'package:quiz_app_flutter_task/models/reading_material_model.dart';

class Question {
  int id;
  String description;
  dynamic difficultyLevel;
  String topic;
  bool isPublished;
  DateTime createdAt;
  DateTime updatedAt;
  String detailedSolution;
  String? type;
  bool isMandatory;
  bool showInFeed;
  String? pyqLabel;
  int topicId;
  int readingMaterialId;
  DateTime? fixedAt;
  String? fixSummary;
  dynamic createdBy;
  String? updatedBy;
  dynamic quizLevel;
  String questionFrom;
  dynamic language;
  dynamic photoUrl;
  dynamic photoSolutionUrl;
  bool isSaved;
  String tag;
  List<Option> options;
  ReadingMaterial readingMaterial;

  Question({
    required this.id,
    required this.description,
    required this.difficultyLevel,
    required this.topic,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
    required this.detailedSolution,
    required this.type,
    required this.isMandatory,
    required this.showInFeed,
    required this.pyqLabel,
    required this.topicId,
    required this.readingMaterialId,
    required this.fixedAt,
    required this.fixSummary,
    required this.createdBy,
    required this.updatedBy,
    required this.quizLevel,
    required this.questionFrom,
    required this.language,
    required this.photoUrl,
    required this.photoSolutionUrl,
    required this.isSaved,
    required this.tag,
    required this.options,
    required this.readingMaterial,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        description: json["description"],
        difficultyLevel: json["difficulty_level"],
        topic: json["topic"],
        isPublished: json["is_published"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        detailedSolution: json["detailed_solution"],
        type: json["type"],
        isMandatory: json["is_mandatory"],
        showInFeed: json["show_in_feed"],
        pyqLabel: json["pyq_label"],
        topicId: json["topic_id"],
        readingMaterialId: json["reading_material_id"],
        fixedAt:
            json["fixed_at"] == null ? null : DateTime.parse(json["fixed_at"]),
        fixSummary: json["fix_summary"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        quizLevel: json["quiz_level"],
        questionFrom: json["question_from"],
        language: json["language"],
        photoUrl: json["photo_url"],
        photoSolutionUrl: json["photo_solution_url"],
        isSaved: json["is_saved"],
        tag: json["tag"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        readingMaterial: ReadingMaterial.fromJson(json["reading_material"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "difficulty_level": difficultyLevel,
        "topic": topic,
        "is_published": isPublished,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "detailed_solution": detailedSolution,
        "type": type,
        "is_mandatory": isMandatory,
        "show_in_feed": showInFeed,
        "pyq_label": pyqLabel,
        "topic_id": topicId,
        "reading_material_id": readingMaterialId,
        "fixed_at": fixedAt?.toIso8601String(),
        "fix_summary": fixSummary,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "quiz_level": quizLevel,
        "question_from": questionFrom,
        "language": language,
        "photo_url": photoUrl,
        "photo_solution_url": photoSolutionUrl,
        "is_saved": isSaved,
        "tag": tag,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "reading_material": readingMaterial.toJson(),
      };
}
