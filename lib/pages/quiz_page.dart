import 'package:flutter/material.dart';
import 'package:quiz_app_flutter_task/models/options_model.dart';
import 'package:quiz_app_flutter_task/models/quiz_topic_model.dart';
import 'package:quiz_app_flutter_task/services/get_quiz.dart';
import 'package:quiz_app_flutter_task/ui/next_button.dart';
import 'package:quiz_app_flutter_task/ui/options_tile.dart';
import 'package:quiz_app_flutter_task/ui/prev_button.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool isVisible = false;
  QuizTopicModel? quizData;

  fetchQuizData() async {
    quizData = await GetQuiz().getQuizData();
    if (quizData != null) {
      setState(() {
        isVisible = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchQuizData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) async {
          if (didPop) {
            return;
          }
          final bool shouldPop = await showConfirmDialog(context) ?? false;
          if (context.mounted && shouldPop) {
            Navigator.pop(context);
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: isVisible
                  ? Column(
                      spacing: 20,
                      children: [
                        QuizHeader(quizData: quizData),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [PrevButton(), NextButton()],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: QuizProgressIndicator(quizData: quizData),
                        ),
                        QuestionTile(
                          queNumber: 1,
                          queString: quizData!.questions[0].description,
                        ),
                        Options(
                          options: quizData!.questions[0].options,
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(
                      strokeCap: StrokeCap.round,
                      strokeWidth: 6,
                      // value: 0.5,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizHeader extends StatelessWidget {
  const QuizHeader({
    super.key,
    required this.quizData,
  });

  final QuizTopicModel? quizData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CloseButton(
          color: Theme.of(context).colorScheme.primary,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          onPressed: () async {
            final bool shouldPop = await showConfirmDialog(context) ?? false;
            if (context.mounted && shouldPop) {
              Navigator.pop(context);
            }
          },
        ),
        QuizTitle(
          quizTitle: quizData!.title,
          quizTopic: quizData!.topic,
        ),
      ],
    );
  }
}

class QuizProgressIndicator extends StatelessWidget {
  const QuizProgressIndicator({
    super.key,
    required this.quizData,
  });

  final QuizTopicModel? quizData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: 1 / quizData!.questionsCount,
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
            minHeight: 10,
          ),
        ),
        Text(
          '1/${quizData!.questionsCount}',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

class Options extends StatelessWidget {
  const Options({
    super.key,
    required this.options,
  });

  final List<Option> options;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.hardEdge,
          child: Scrollbar(
            thickness: 5,
            radius: const Radius.circular(10),
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                children: List.generate(options.length, (index) {
                  return OptionsTile(
                    data: options[index].description,
                    isSelected: options[index].isCorrect,
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionTile extends StatelessWidget {
  const QuestionTile({
    super.key,
    required this.queNumber,
    required this.queString,
  });

  final int queNumber;
  final String queString;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Q$queNumber. $queString",
      textAlign: TextAlign.justify,
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(fontWeight: FontWeight.w900),
    );
  }
}

Future<bool?> showConfirmDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Are you sure you want to quit the Quiz?\n'
            'The progress will NOT be stored!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            child: const Text('Yes'),
          )
        ],
      );
    },
  );
}

class QuizTitle extends StatelessWidget {
  const QuizTitle({
    super.key,
    required this.quizTitle,
    required this.quizTopic,
  });
  final String quizTitle;
  final String quizTopic;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            quizTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            quizTopic,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
