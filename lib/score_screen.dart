import 'package:flutter/material.dart';

import 'quiz_controller.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key, required this.controller});

  final QuizController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final int total = controller.questions.length;
    final int score = controller.score;
    final bool didGreat = score >= total * 0.7;

    final String message;
    if (score == total) {
      message = 'Perfect score — you are a true Quiz Whiz!';
    } else if (didGreat) {
      message = 'Great job, well done!';
    } else if (score >= total * 0.4) {
      message = 'Not bad — keep practicing!';
    } else {
      message = 'Better luck next time!';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                didGreat ? Icons.emoji_events : Icons.quiz,
                size: 96,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text('You scored', style: theme.textTheme.titleMedium),
              Text(
                '$score / $total',
                key: const ValueKey('score-text'),
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                key: const ValueKey('restart-button'),
                onPressed: controller.restart,
                icon: const Icon(Icons.refresh),
                label: const Text('Restart quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
