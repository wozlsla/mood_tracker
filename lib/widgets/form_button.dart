import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  FormButton({
    super.key,
    required this.text,
    this.filled = true,
    this.disabled = false,
  });

  final String text;
  final bool filled;
  final bool disabled;

  final Duration _duration = Duration(milliseconds: 200);

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
          color:
              filled
                  ? (disabled ? Colors.grey.shade900 : Colors.grey.shade800)
                  : (disabled ? Colors.grey.shade900 : Colors.transparent),
        ),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          duration: _duration,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color:
                    disabled
                        ? Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.6)
                        : Theme.of(context).colorScheme.primary,
                fontSize: 17.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
