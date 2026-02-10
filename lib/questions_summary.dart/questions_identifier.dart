import 'package:flutter/material.dart';

class QuestionsIdentifier extends StatelessWidget {
  const QuestionsIdentifier(
      {required this.isCorrectAnswer, required this.index, super.key});
  
  final int index;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = index + 1;


    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(202, 0, 0, 0),
        ),
      ),
    );
  }
}
