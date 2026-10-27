import 'package:flutter/material.dart';

import 'questions.dart';
import 'quiz_controller.dart';
import 'score_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizController _controller = QuizController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        if (_controller.isFinished) {
          return ScoreScreen(controller: _controller);
        }
        return _QuestionView(controller: _controller);
      },
    );
  }
}

class _QuestionView extends StatelessWidget {
  const _QuestionView({required this.controller});

  final QuizController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Question question = controller.current;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Whiz'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Question ${controller.index + 1} of ${controller.questions.length}',
                style: theme.textTheme.labelLarge
                    ?.copyWith(color: theme.colorScheme.primary),
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value:
                    (controller.index + (controller.isAnswered ? 1 : 0)) /
                        controller.questions.length,
                minHeight: 8,
                borderRadius: BorderRadius.circular(8),
              ),
              const SizedBox(height: 24),
              Text(
                question.prompt,
                key: const ValueKey('question-text'),
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              for (var i = 0; i < question.options.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _OptionButton(
                    controller: controller,
                    label: question.options[i],
                    optionIndex: i,
                  ),
                ),
              if (controller.isAnswered)
                FilledButton(
                  key: const ValueKey('next-button'),
                  onPressed: controller.next,
                  child: Text(controller.isLast ? 'See results' : 'Next question'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  const _OptionButton({
    required this.controller,
    required this.label,
    required this.optionIndex,
  });

  final QuizController controller;
  final String label;
  final int optionIndex;

  @override
  Widget build(BuildContext context) {
    final int? selected = controller.selectedIndex;
    final bool answered = selected != null;
    final bool isCorrectPick =
        answered && optionIndex == controller.current.correctIndex;
    final bool isWrongPick = answered &&
        optionIndex == selected &&
        optionIndex != controller.current.correctIndex;

    Color? background;
    Color? foreground;
    IconData? trailing;
    if (isCorrectPick) {
      background = Colors.green.shade700;
      foreground = Colors.white;
      trailing = Icons.check_circle_outline;
    } else if (isWrongPick) {
      background = Colors.red.shade700;
      foreground = Colors.white;
      trailing = Icons.cancel_outlined;
    }

    return FilledButton(
      onPressed: answered ? null : () => controller.selectAnswer(optionIndex),
      style: FilledButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foreground,
        disabledBackgroundColor: background,
        disabledForegroundColor: foreground,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          if (trailing != null) Icon(trailing, size: 20),
        ],
      ),
    );
  }
}
