import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget {
   StartScreen(this.startquiz,{super.key});
final void Function() startquiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Opacity(
            opacity: 0.6,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
            )),
        const SizedBox(
          height: 70,
        ),
        const Text(
          "Learn Flutter With Mike!",
          style: TextStyle(
              color: Color.fromARGB(255, 241, 191, 245), fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
         OutlinedButton.icon(
            onPressed: startquiz,
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            label: const Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white),
            ))
      ]),
    );
  }
}
