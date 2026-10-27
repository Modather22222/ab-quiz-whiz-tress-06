/// Question model and the built-in general-knowledge question bank.
class Question {
  const Question(this.prompt, this.options, this.correctIndex);

  final String prompt;
  final List<String> options;

  /// Index into [options] of the single correct answer.
  final int correctIndex;
}

const List<Question> kQuizQuestions = [
  Question('What is the capital of France?', ['London', 'Berlin', 'Paris', 'Madrid'], 2),
  Question('How many continents are there on Earth?', ['Five', 'Six', 'Seven', 'Eight'], 2),
  Question('Which planet is known as the Red Planet?', ['Venus', 'Mars', 'Jupiter', 'Mercury'], 1),
  Question('What is the largest ocean on Earth?', ['Atlantic', 'Indian', 'Arctic', 'Pacific'], 3),
  Question('Who wrote the play "Romeo and Juliet"?',
      ['Charles Dickens', 'William Shakespeare', 'Leo Tolstoy', 'Ernest Hemingway'], 1),
  Question('Which gas do plants absorb from the atmosphere?',
      ['Oxygen', 'Nitrogen', 'Carbon dioxide', 'Hydrogen'], 2),
  Question('How many sides does a hexagon have?', ['Five', 'Six', 'Seven', 'Eight'], 1),
  Question('Which is generally considered the longest river in the world?',
      ['Amazon', 'Nile', 'Yangtze', 'Mississippi'], 1),
  Question('What is the chemical symbol for gold?', ['Go', 'Gd', 'Au', 'Ag'], 2),
  Question('In which sport would you perform a slam dunk?',
      ['Tennis', 'Basketball', 'Volleyball', 'Cricket'], 1),
];
