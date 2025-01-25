import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_flutter_task/providers/quiz_data_provider.dart';

class OptionsTile extends StatelessWidget {
  const OptionsTile({
    super.key,
    required this.data,
    required this.isSelected,
    required this.index,
  });
  final bool isSelected;
  final String data;
  final int index;

  @override
  Widget build(BuildContext context) {
    final quizDataProvider = Provider.of<QuizDataProvider>(context);
    return InkWell(
      onTap: () {
        quizDataProvider.selectOption(index);
      },
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          spacing: 10,
          children: [
            Checkbox(
                value: isSelected,
                onChanged: (_) {
                  quizDataProvider.selectOption(index);
                }),
            // Divider()
            Flexible(
              child: Text(
                data,
                textAlign: TextAlign.justify,
                style: isSelected
                    ? Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
