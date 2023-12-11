import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startquiz, {super.key});
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
        Text(
          "Learn Flutter With Mike!",
          style: GoogleFonts.lato(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
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
