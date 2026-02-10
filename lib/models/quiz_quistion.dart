class QuizQuistion {
  const QuizQuistion(this.text,this.answers);

  final String text;
  final List<String> answers;

  getshuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
