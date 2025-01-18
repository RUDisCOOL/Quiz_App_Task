import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app_flutter_task/pages/home_page.dart';
import 'package:quiz_app_flutter_task/pages/instructions_page.dart';
import 'package:quiz_app_flutter_task/pages/quiz_page.dart';
import 'package:quiz_app_flutter_task/pages/solution_page.dart';
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
    return MaterialApp(
      // home: HomePage(),
      initialRoute: '/Home',
      theme: lightTheme,
      routes: {
        '/Quiz': (context) => const QuizPage(),
        '/Solution': (context) => const SolutionPage(),
        '/Home': (context) => const HomePage(),
        '/Instructions': (context) => const InstructionsPage(),
      },
    );
  }
}

Future<String> fetchData() async {
  const url = "https://api.jsonserve.com/Uw5CrX";
  final response = await http.get(Uri.parse(url));
  return response.body;
}
