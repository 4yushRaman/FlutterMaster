import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;
  final VoidCallback restartQuiz; // The callback to restart the quiz

  // Calculate the score and summary data
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i + 1, // Add 1 for question numbers to start from 1
        'question': questions[i].text, // Only display the question text
        'correct_answer':
            questions[i].answers[0], // Assuming first answer is the correct one
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the number of correct answers
    int correctAnswers = 0;
    for (var i = 0; i < chosenAnswers.length; i++) {
      if (chosenAnswers[i] == questions[i].answers[0]) {
        correctAnswers++;
      }
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          // Add SingleChildScrollView to make the content scrollable
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display score dynamically
                Text(
                  'You answered $correctAnswers out of ${questions.length} questions correctly!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                // Display summary of each question inside a single card
                Card(
                  color: Colors.white
                      .withOpacity(0.8), // Slight opacity for a softer card
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12), // Rounded corners for card
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: getSummaryData().map((data) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Display the question number before the question text
                              Text(
                                'Question ${data['question_index']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors
                                      .blueAccent, // Color for question number
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Display the actual question text
                              Text(
                                data['question'] as String,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Your answer: ${(data['user_answer'] as String)}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Correct answer: ${(data['correct_answer'] as String)}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Center the restart button
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ElevatedButton(
                      onPressed: restartQuiz, // Call the restartQuiz function
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blueAccent, // Button background color
                        foregroundColor: Colors.white, // Button text color
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(50), // Rounded corners
                        ),
                        elevation: 5, // Slight shadow for depth
                      ),
                      child: const Text(
                        'Restart Quiz',
                        style: TextStyle(
                          fontSize: 20, // Larger text for better readability
                          fontWeight: FontWeight.bold, // Bold text for emphasis
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
