import 'package:flutter/material.dart';
import 'package:flutter_application_2/questions_summary.dart/questions_item.dart';

class QuistionsSummary extends StatelessWidget {
  const QuistionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(itemdata: data);
          }).toList(),
        ),
      ),
    );
  }
}
