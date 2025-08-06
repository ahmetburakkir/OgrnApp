class Question {
  final int id;
  final String type;
  final String question;
  final List<String> options;

  Question({
    required this.id,
    required this.type,
    required this.question,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      type: json['type'],
      question: json['question'],
      options: List<String>.from(json['options']),
    );
  }
}
