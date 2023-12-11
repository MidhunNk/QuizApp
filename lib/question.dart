import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answerbuttonstyle.dart';
import 'package:quiz_app/data/data.dart';

class Question extends StatefulWidget {
  const Question({super.key,required this.onselectanswer});
 final void Function(String answer) onselectanswer;
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var currentquestionindex = 0;

 void answerquestion(String selectedAnswers){
  widget.onselectanswer(selectedAnswers);
   setState(() {
     currentquestionindex ++;
   });
     
   }


  @override
  Widget build(BuildContext context) {
   final currentquestion = questionslist[currentquestionindex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch
          ,
          children: [
             Text(
              
              currentquestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
              
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentquestion.getshuffleanswers().map((answer){
              return Answserbutton(answsertext: answer, onTap:(){
                answerquestion(answer);
              });
            }),
           
            
          ],
        ),
      ),
    );
  }
}
