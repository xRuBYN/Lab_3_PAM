class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Who is the owner of Flutter?",
    [
      Answer("A. Nokia", false),
      Answer("B. Samsung", false),
      Answer("C. Google", true),
      Answer("D. Apple", false),
    ],
  ));

  list.add(Question(
    "Who owns Iphone?",
    [
      Answer("A. Apple", true),
      Answer("B. Microsoft", false),
      Answer("C. Google", false),
      Answer("D. Nokia", false),
    ],
  ));

  list.add(Question(
    "Youtube is _________  platform?",
    [
      Answer("A. Music Sharing", false),
      Answer("B. Video Sharing", false),
      Answer("C. Live Streaming", false),
      Answer("D. All of the above", true),
    ],
  ));

  list.add(Question(
    "Flutter user dart as a language?",
    [
      Answer("A. True", true),
      Answer("B. False", false),
    ],
  ));

  return list;
}