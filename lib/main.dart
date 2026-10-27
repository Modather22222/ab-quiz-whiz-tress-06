import 'package:flutter/material.dart';

import 'quiz_screen.dart';

void main() {
  runApp(const QuizWhizApp());
}

class QuizWhizApp extends StatelessWidget {
  const QuizWhizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Whiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.indigo,
      ),
      themeMode: ThemeMode.system,
      home: const QuizScreen(),
    );
  }
}
