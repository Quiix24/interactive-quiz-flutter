import 'package:flutter/material.dart';
import 'package:flutter_application_2/answer_button.dart';
import 'package:flutter_application_2/data/quistions.dart';
import 'package:google_fonts/google_fonts.dart';

class Quistions extends StatefulWidget {
  const Quistions({required this.onSelectAnswer,super.key});
  final void Function(String answer) onSelectAnswer;

  @override
  State<Quistions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Quistions> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentquestion.getshuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: (){
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
