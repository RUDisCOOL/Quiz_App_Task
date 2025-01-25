import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_flutter_task/pages/home_page.dart';
import 'package:quiz_app_flutter_task/pages/instructions_page.dart';
import 'package:quiz_app_flutter_task/pages/quiz_page.dart';
import 'package:quiz_app_flutter_task/pages/result_page.dart';
import 'package:quiz_app_flutter_task/providers/que_num_provider.dart';
import 'package:quiz_app_flutter_task/providers/quiz_data_provider.dart';
import 'package:quiz_app_flutter_task/themes/dark_theme.dart';
import 'package:quiz_app_flutter_task/themes/light_theme.dart';

void main() {
  runApp(DevicePreview(builder: (context) {
    return const MainApp();
  }));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<QueNumProvider>(
          create: (context) => QueNumProvider(),
        ),
        ChangeNotifierProxyProvider<QueNumProvider, QuizDataProvider>(
          update: (context, queNumProvider, quizDataProvider) {
            return QuizDataProvider(
              queNumProvider: queNumProvider,
              quizData: quizDataProvider?.quizData,
            );
          },
          create: (context) => QuizDataProvider(
            queNumProvider: context.read<QueNumProvider>(),
          ),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/Home',
        themeMode: ThemeMode.system,
        theme: lightTheme,
        darkTheme: darkTheme,
        routes: {
          '/Quiz': (context) => const QuizPage(),
          '/Result': (context) => const ResultPage(),
          '/Home': (context) => const HomePage(),
          '/Instructions': (context) => const InstructionsPage(),
        },
      ),
    );
  }
}
