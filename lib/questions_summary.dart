import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Card(
          margin: const EdgeInsets.only(bottom: 20), // Space between each card
          elevation: 5, // Slight elevation for shadow effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          color: Colors.grey[200], // Softer background color for the card
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Padding inside the card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display the question text
                Text(
                  data['question'] as String,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Black color for the question text
                  ),
                ),
                const SizedBox(height: 10),
                // Display user's answer
                Text(
                  'Your Answer: ${data['user_answer'] as String}',
                  style: TextStyle(
                      fontSize: 16, color: Colors.black), // Black text
                ),
                const SizedBox(height: 5),
                // Display correct answer
                Text(
                  'Correct Answer: ${data['correct_answer'] as String}',
                  style: TextStyle(
                      fontSize: 16, color: Colors.black), // Black text
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
