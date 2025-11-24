class Question {
  final String question;
  final List<String>? options;
  final String? correct;
  final String type;

  final List<String>? matchLeft;
  final List<String>? matchRight;
  final Map<String, String>? correctPairs;

  final String category; 

  Question({
    required this.question,
    this.options,
    this.correct,
    required this.type,
    this.matchLeft,
    this.matchRight,
    this.correctPairs,
    required this.category,
  });
}
