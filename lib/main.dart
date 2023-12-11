import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/startscreen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var activeScreen = 'startscreen';

 
 

  void switchscreen() {
    setState(() {
      activeScreen = 'question';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 98, 14, 113),
                  Colors.deepPurple
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: activeScreen == 'startscreen'?  StartScreen(switchscreen): const Question())),
    );
  }
}
