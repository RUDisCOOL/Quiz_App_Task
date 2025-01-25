import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_flutter_task/providers/quiz_data_provider.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final quizDataProvider = Provider.of<QuizDataProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () async {
          bool showResultPage = await showSubmitDialog(context) ?? false;
          if (showResultPage && context.mounted) {
            quizDataProvider.evaluateResult();
            Navigator.pushReplacementNamed(context, '/Result');
          }
        },
        borderRadius: BorderRadius.circular(50),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(50),
          ),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(10),
          child: Text(
            textAlign: TextAlign.center,
            'Submit Quiz',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

Future<bool?> showSubmitDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Are you sure you want to submit?\n'
            'Once you submit the quiz no changes can be made?'),
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
