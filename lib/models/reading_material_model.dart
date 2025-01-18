import 'package:quiz_app_flutter_task/models/practice_material_model.dart';

class ReadingMaterial {
  int id;
  String keywords;
  dynamic content;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> contentSections;
  PracticeMaterial practiceMaterial;

  ReadingMaterial({
    required this.id,
    required this.keywords,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.contentSections,
    required this.practiceMaterial,
  });

  factory ReadingMaterial.fromJson(Map<String, dynamic> json) =>
      ReadingMaterial(
        id: json["id"],
        keywords: json["keywords"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        contentSections:
            List<String>.from(json["content_sections"].map((x) => x)),
        practiceMaterial: PracticeMaterial.fromJson(json["practice_material"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "keywords": keywords,
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "content_sections": List<dynamic>.from(contentSections.map((x) => x)),
        "practice_material": practiceMaterial.toJson(),
      };
}
