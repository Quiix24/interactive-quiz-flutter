import 'package:flutter/material.dart';
import 'package:flutter_application_2/quistions.dart';
import 'package:flutter_application_2/start_screen.dart';
import './colors.dart';
import './data/quistions.dart';
import './results_scren.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  Widget? activeScreen;

  void chooseanswer(String answer) {
    selectedAnswer.add(answer);

    if(selectedAnswer.length == questions.length){
      setState(() {
        activeScreen = ResultsScren(chooseanswer: selectedAnswer, onRestart: restartQuiz);
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = Quistions(onSelectAnswer: chooseanswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 47, 12, 107),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colors.deeppurple,
                Color.fromARGB(255, 33, 27, 146),
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
