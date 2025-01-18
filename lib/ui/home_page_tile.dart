import 'package:flutter/material.dart';

class HomePageTile extends StatelessWidget {
  const HomePageTile({
    super.key,
    required this.routeName,
    required this.icon,
    required this.iconText,
    required this.foregroundColor,
    required this.backgroundColor,
  });

  final String routeName;
  final IconData icon;
  final String iconText;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 250,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 34,
              color: foregroundColor,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              iconText,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: foregroundColor),
            ),
          ],
        ),
      ),
    );
  }
}
