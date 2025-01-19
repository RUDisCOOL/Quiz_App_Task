import 'package:flutter/material.dart';


class PrevButton extends StatelessWidget {
  const PrevButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(50),
        ),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(5).copyWith(right: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Icon(
              Icons.arrow_back_rounded,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            Text(
              'Prev',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
