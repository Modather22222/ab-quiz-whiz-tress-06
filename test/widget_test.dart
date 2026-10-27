import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quiz_whiz/main.dart';

void main() {
  testWidgets('quiz renders the first question and advances on answer',
      (WidgetTester tester) async {
    await tester.pumpWidget(const QuizWhizApp());

    expect(find.text('Quiz Whiz'), findsOneWidget);
    expect(find.byKey(const ValueKey('question-text')), findsOneWidget);
    expect(find.text('Question 1 of 10'), findsOneWidget);

    // Answer the first question and move on to the second one.
    await tester.tap(find.text('Paris'));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('next-button')));
    await tester.pump();

    expect(find.text('Question 2 of 10'), findsOneWidget);
  });
}
