import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(205, 255, 255, 255),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.white, // Text color
                fontSize: 28, // Font size for the title
                fontWeight: FontWeight.bold, // Bold text for emphasis
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, // Text color for the button
              side: const BorderSide(color: Colors.white, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 14, horizontal: 24), // Adjusted padding for balance
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white, // White color for the icon
              size: 30, // Slightly bigger icon for better balance
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(fontSize: 20), // Larger text for the button
            ),
          ),
        ],
      ),
    );
  }
}
