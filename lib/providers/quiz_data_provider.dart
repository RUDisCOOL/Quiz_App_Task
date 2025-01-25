import 'package:flutter/material.dart';
import 'package:quiz_app_flutter_task/models/quiz_topic_model.dart';
import 'package:quiz_app_flutter_task/providers/que_num_provider.dart';

class QuizDataProvider extends ChangeNotifier {
  QuizDataProvider({
    required this.queNumProvider,
    this.quizData,
  });

  final QueNumProvider queNumProvider;

  QuizTopicModel? quizData;

  void selectOption(int selectedOptionIndex) {
    if (quizData == null) return;
    final question = quizData!.questions[queNumProvider.queNum - 1];
    for (int i = 0; i < question.options.length; i++) {
      var option = question.options[i];
      option.unanswered = (i == selectedOptionIndex) ? !option.unanswered : false;
    }
    notifyListeners();
  }

  int result = 0;

  void evaluateResult() {
    if (quizData == null) return;
    final questions = quizData!.questions;
    for (var question in questions) {
      for (var option in question.options) {
        if (option.unanswered) {
          if (option.isCorrect == true) {
            result += 4;
          } else {
            result--;
          }
        }
      }
    }
    notifyListeners();
  }
}
