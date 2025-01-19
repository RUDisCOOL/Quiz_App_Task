import 'package:quiz_app_flutter_task/models/quiz_topic_model.dart';
import 'package:http/http.dart' as http;

class GetQuiz {
  Future<QuizTopicModel?> getQuizData() async {
    Uri url = Uri.parse('https://api.jsonserve.com/Uw5CrX');
    try {
      var response = await http.get(url).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return quizTopicModelFromJson(response.body);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
