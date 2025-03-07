import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  FormButton({super.key, required this.text, required this.filled});

  final String text;
  final bool filled;

  final Duration _duration = Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: _duration,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border:
              filled
                  ? null
                  : Border.all(color: Colors.grey.shade400, width: 0.5),
          color: filled ? Colors.grey.shade800 : Colors.transparent,
        ),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          duration: _duration,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 17.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
