import 'package:flutter/foundation.dart';

import 'questions.dart';

/// Holds all in-memory quiz state and exposes it to the widgets via
/// [ChangeNotifier] + `ListenableBuilder`.
class QuizController extends ChangeNotifier {
  QuizController({List<Question>? questions})
      : questions = questions ?? kQuizQuestions;

  final List<Question> questions;

  int _index = 0;
  int _score = 0;
  int? _selectedIndex;
  bool _finished = false;

  /// Zero-based index of the question currently on screen.
  int get index => _index;

  /// Number of correctly answered questions so far.
  int get score => _score;

  Question get current => questions[_index];

  /// The option the user picked for the current question, if any.
  int? get selectedIndex => _selectedIndex;

  /// Whether the current question has already been answered.
  bool get isAnswered => _selectedIndex != null;

  bool get isLast => _index == questions.length - 1;

  /// Whether the whole quiz has been completed.
  bool get isFinished => _finished;

  void selectAnswer(int optionIndex) {
    if (isAnswered || _finished) return;
    _selectedIndex = optionIndex;
    if (optionIndex == current.correctIndex) {
      _score++;
    }
    notifyListeners();
  }

  /// Moves to the next question, or finishes the quiz after the last one.
  void next() {
    if (!isAnswered || _finished) return;
    if (isLast) {
      _finished = true;
    } else {
      _index++;
      _selectedIndex = null;
    }
    notifyListeners();
  }

  /// Restarts the quiz from the very beginning.
  void restart() {
    _index = 0;
    _score = 0;
    _selectedIndex = null;
    _finished = false;
    notifyListeners();
  }
}
