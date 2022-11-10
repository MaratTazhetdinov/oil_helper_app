class FAQ {
  int id;
  String question;
  String answer;

  FAQ({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(
      id: json['faqID'] ?? 0,
      question: json['question'] ?? 'Empty',
      answer: json['answer'] ?? 'Empty',
    );
  }
}
