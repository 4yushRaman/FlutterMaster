import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.answerText,
    required this.onTap,
    this.backgroundColor =
        const Color.fromARGB(205, 20, 64, 140), // Default blue color
    super.key,
  });

  final String answerText;
  final void Function() onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 1.0), // Reduced vertical space for compactness
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6), // Reduced padding for a more compact button
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          splashFactory: InkRipple.splashFactory,
          elevation: 2, // Slight elevation for depth
        ),
        child: Text(
          answerText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14, // Smaller font size for a more compact look
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
