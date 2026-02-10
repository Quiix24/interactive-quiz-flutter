import 'package:flutter/material.dart';
import 'package:flutter_application_2/questions_summary.dart/questions_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.itemdata, super.key});

  final Map<String, Object> itemdata;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemdata['user_answer'] == itemdata['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: QuestionsIdentifier(
              isCorrectAnswer: isCorrectAnswer,
              index: itemdata['question_index'] as int),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemdata['question'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  itemdata['user_answer'] as String,
                  style: const TextStyle(color: Color.fromARGB(255, 202, 171, 252)),
                ),
                Text(
                  itemdata['correct_answer'] as String,
                  style: const TextStyle(color: Color.fromARGB(255, 181, 254, 246)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
