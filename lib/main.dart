import 'package:flutter/material.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/resultscreen.dart';
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
   List<String> selectedAnswers = [];
  var activeScreen = 'startscreen';

  void switchscreen() {
    setState(() {
      activeScreen = 'question';
    });
  }

  void chooseanswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questionslist.length){
     setState(() {
      
       activeScreen = 'resultscreen';
    
     });
    }
   
  }
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenwidget = StartScreen(switchscreen);

    if (activeScreen == 'question') {
      screenwidget = Question(onselectanswer: chooseanswer);
    }

if (activeScreen == 'resultscreen') {
      screenwidget = ResultScreen(chosenanswer: selectedAnswers, onRestart: restartQuiz);
    }
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 98, 14, 113),
                  Colors.deepPurple
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: screenwidget)),
    );
  }
}
