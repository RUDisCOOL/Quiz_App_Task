import 'package:flutter/material.dart';

class OptionsTile extends StatelessWidget {
  const OptionsTile({super.key, required this.data, required this.isSelected});
  final bool isSelected;
  final String data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
            Checkbox(value: isSelected, onChanged: (_) {}),
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
