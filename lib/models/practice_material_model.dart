class PracticeMaterial {
  List<String> content;
  List<String> keywords;

  PracticeMaterial({
    required this.content,
    required this.keywords,
  });

  factory PracticeMaterial.fromJson(Map<String, dynamic> json) =>
      PracticeMaterial(
        content: List<String>.from(json["content"].map((x) => x)),
        keywords: List<String>.from(json["keywords"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x)),
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
      };
}
