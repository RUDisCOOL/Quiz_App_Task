// import 'dart:convert';
import 'package:quiz_app_flutter_task/models/questions_model.dart';

// QuizTopicModel quizTopicModelFromJson(String str) =>
//     QuizTopicModel.fromJson(json.decode(str));

// String quizTopicModelToJson(QuizTopicModel data) => json.encode(data.toJson());

class QuizTopicModel {
  int id;
  dynamic name;
  String title;
  String description;
  dynamic difficultyLevel;
  String topic;
  DateTime time;
  bool isPublished;
  DateTime createdAt;
  DateTime updatedAt;
  int duration;
  DateTime endTime;
  String negativeMarks;
  String correctAnswerMarks;
  bool shuffle;
  bool showAnswers;
  bool lockSolutions;
  bool isForm;
  bool showMasteryOption;
  dynamic readingMaterial;
  dynamic quizType;
  bool isCustom;
  dynamic bannerId;
  dynamic examId;
  bool showUnanswered;
  DateTime endsAt;
  dynamic lives;
  String liveCount;
  int coinCount;
  int questionsCount;
  String dailyDate;
  int maxMistakeCount;
  List<dynamic> readingMaterials;
  List<Question> questions;
  int progress;

  QuizTopicModel({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.difficultyLevel,
    required this.topic,
    required this.time,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
    required this.duration,
    required this.endTime,
    required this.negativeMarks,
    required this.correctAnswerMarks,
    required this.shuffle,
    required this.showAnswers,
    required this.lockSolutions,
    required this.isForm,
    required this.showMasteryOption,
    required this.readingMaterial,
    required this.quizType,
    required this.isCustom,
    required this.bannerId,
    required this.examId,
    required this.showUnanswered,
    required this.endsAt,
    required this.lives,
    required this.liveCount,
    required this.coinCount,
    required this.questionsCount,
    required this.dailyDate,
    required this.maxMistakeCount,
    required this.readingMaterials,
    required this.questions,
    required this.progress,
  });

  factory QuizTopicModel.fromJson(Map<String, dynamic> json) => QuizTopicModel(
        id: json["id"],
        name: json["name"],
        title: json["title"],
        description: json["description"],
        difficultyLevel: json["difficulty_level"],
        topic: json["topic"],
        time: DateTime.parse(json["time"]),
        isPublished: json["is_published"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        duration: json["duration"],
        endTime: DateTime.parse(json["end_time"]),
        negativeMarks: json["negative_marks"],
        correctAnswerMarks: json["correct_answer_marks"],
        shuffle: json["shuffle"],
        showAnswers: json["show_answers"],
        lockSolutions: json["lock_solutions"],
        isForm: json["is_form"],
        showMasteryOption: json["show_mastery_option"],
        readingMaterial: json["reading_material"],
        quizType: json["quiz_type"],
        isCustom: json["is_custom"],
        bannerId: json["banner_id"],
        examId: json["exam_id"],
        showUnanswered: json["show_unanswered"],
        endsAt: DateTime.parse(json["ends_at"]),
        lives: json["lives"],
        liveCount: json["live_count"],
        coinCount: json["coin_count"],
        questionsCount: json["questions_count"],
        dailyDate: json["daily_date"],
        maxMistakeCount: json["max_mistake_count"],
        readingMaterials:
            List<dynamic>.from(json["reading_materials"].map((x) => x)),
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
        progress: json["progress"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "title": title,
        "description": description,
        "difficulty_level": difficultyLevel,
        "topic": topic,
        "time": time.toIso8601String(),
        "is_published": isPublished,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "duration": duration,
        "end_time": endTime.toIso8601String(),
        "negative_marks": negativeMarks,
        "correct_answer_marks": correctAnswerMarks,
        "shuffle": shuffle,
        "show_answers": showAnswers,
        "lock_solutions": lockSolutions,
        "is_form": isForm,
        "show_mastery_option": showMasteryOption,
        "reading_material": readingMaterial,
        "quiz_type": quizType,
        "is_custom": isCustom,
        "banner_id": bannerId,
        "exam_id": examId,
        "show_unanswered": showUnanswered,
        "ends_at":
            "${endsAt.year.toString().padLeft(4, '0')}-${endsAt.month.toString().padLeft(2, '0')}-${endsAt.day.toString().padLeft(2, '0')}",
        "lives": lives,
        "live_count": liveCount,
        "coin_count": coinCount,
        "questions_count": questionsCount,
        "daily_date": dailyDate,
        "max_mistake_count": maxMistakeCount,
        "reading_materials": List<dynamic>.from(readingMaterials.map((x) => x)),
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "progress": progress,
      };
}
