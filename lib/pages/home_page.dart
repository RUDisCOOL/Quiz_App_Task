import 'package:flutter/material.dart';
import 'package:quiz_app_flutter_task/ui/home_page_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'QUIZ APP',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Expanded(child: SizedBox()),
              const StartQuizButton(),
              const InstructionsButton(),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

class InstructionsButton extends StatelessWidget {
  const InstructionsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomePageTile(
      routeName: '/Instructions',
      icon: Icons.menu_book_rounded,
      iconText: 'Instructions',
      foregroundColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
    );
  }
}

class StartQuizButton extends StatelessWidget {
  const StartQuizButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomePageTile(
      routeName: '/Quiz',
      icon: Icons.play_circle_outline_rounded,
      iconText: 'Start',
      foregroundColor: Theme.of(context).colorScheme.onSecondary,
      backgroundColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
