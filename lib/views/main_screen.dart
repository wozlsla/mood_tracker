import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/router_constant.dart';
import 'package:mood_tracker/utils.dart';
import 'dart:async';

import 'package:mood_tracker/widgets/form_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> phrases = ["Write days,", "Embrace your story."];
  int phraseIndex = 0;
  int charIndex = 0;
  String displayText = "";
  bool deleting = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTypingEffect();
  }

  void _startTypingEffect() {
    _timer = Timer.periodic(Duration(milliseconds: 90), (timer) {
      if (!mounted) return;
      setState(() {
        if (!deleting) {
          if (charIndex < phrases[phraseIndex].length) {
            displayText = phrases[phraseIndex].substring(0, charIndex + 1);
            charIndex++;
          } else {
            // 문장이 완성되면 1초 후 삭제 시작
            Future.delayed(Duration(seconds: 1), () {
              deleting = true;
            });
          }
        } else {
          if (charIndex > 0) {
            displayText = phrases[phraseIndex].substring(0, charIndex - 1);
            charIndex--;
          } else {
            // 문장을 모두 지운 후 다음 문장으로 변경
            deleting = false;
            phraseIndex = (phraseIndex + 1) % phrases.length;
          }
        }
      });
    });
  }

  void _onLogInTap() {
    context.pushNamed(RouteName.login);
  }

  void _onSignUpTap() {
    context.pushNamed(RouteName.signup);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: TweenAnimationBuilder(
                duration: Duration(milliseconds: 300),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double opacity, child) {
                  return Opacity(
                    opacity: opacity,
                    child: Text(
                      displayText,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
              decoration: BoxDecoration(
                // color: Color(0xff12140e),
                // color: Color(0xff1a1c16),
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: _onSignUpTap,
                    child: FormButton(text: "Sign up"),
                  ),
                  Gaps.v12,
                  GestureDetector(
                    onTap: _onLogInTap,
                    child: FormButton(text: "Log in", filled: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
