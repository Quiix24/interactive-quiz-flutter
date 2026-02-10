import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './data/quistions.dart';
import 'questions_summary.dart/quistions_summary.dart';

class ResultsScren extends StatelessWidget {
  const ResultsScren({super.key, required this.chooseanswer,required this.onRestart});

  final List<String> chooseanswer;
  final void Function() onRestart;


  List<Map<String, Object>> getsummerydata() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseanswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseanswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summatyData = getsummerydata();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summatyData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answerd $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuistionsSummary(summatyData),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
