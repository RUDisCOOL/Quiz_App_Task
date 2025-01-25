import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_flutter_task/providers/quiz_data_provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quizDataProvider = Provider.of<QuizDataProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CloseButton(
                    color: Theme.of(context).colorScheme.primary,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Results',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox.square(
                    dimension: 48,
                  ),
                ],
              ),
              Expanded(
                  child: Center(child: Text('${quizDataProvider.result}'))),
            ],
          ),
        ),
      ),
    );
  }
}
