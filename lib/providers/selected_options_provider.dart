import 'package:flutter/material.dart';
import 'package:quiz_app_flutter_task/models/quiz_topic_model.dart';
import 'package:quiz_app_flutter_task/providers/que_num_provider.dart';

class SelectedOptionsProvider extends ChangeNotifier {
  SelectedOptionsProvider({
    required this.queNumProvider,
    this.quizData,
  });

  final QueNumProvider queNumProvider;

  QuizTopicModel? quizData;

  void selectOption(int optionsIndex) {
    if (quizData == null) return;

    final question = quizData!.questions[queNumProvider.queNum - 1];
    for (int i = 0; i < question.options.length; i++) {
      var option = question.options[i];
      option.unanswered = (i == optionsIndex) ? !option.unanswered : false;
    }
    notifyListeners();
  }
}
