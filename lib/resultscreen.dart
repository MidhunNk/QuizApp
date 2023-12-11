import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/questionsummary.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenanswer,required this.onRestart});
 final void Function() onRestart;
  final List<String> chosenanswer;


  List<Map<String, Object>> getsummarydata() {
    final List<Map<String, Object>> summarydata = [];
    for (var i = 0; i < chosenanswer.length; i++) {
      summarydata.add({
        'question_index': i,
        'question': questionslist[i].text,
        'correct_answer': questionslist[i].answers[0],
        'user_answer': chosenanswer[i],
      });
    }
    return summarydata;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getsummarydata();
    final numTotalQuestions = questionslist.length;
    final numcorrectQuestion =summarydata.where((data){
      return data['user_answer']==data['correct_answer'];
    }).length;



    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(70),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                   Text("Your answered $numcorrectQuestion out of $numTotalQuestions questions correctly", style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ), textAlign: TextAlign.center,),
                  const SizedBox(
                    height: 30,
                  ),
                  QuestionsSummary(summarydata),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(onPressed: onRestart,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 84, 4, 98),
                  ), label: const Text("Restart Quiz")
                  ,icon: const Icon(Icons.refresh),)
                ])));
  }
}
