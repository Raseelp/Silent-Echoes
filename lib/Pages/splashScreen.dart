import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:silent_echoes/Pages/homePage.dart';
import 'package:silent_echoes/util/appColors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Color> _colors = [
    AppColors.purple,
    AppColors.blue,
    AppColors.pink,
    AppColors.teal
  ];
  int _currentColorIndex = 0;
  Timer? _colorChangeTimer;
  late String _splashText;

  @override
  void initState() {
    super.initState();
    _colorChangeTimer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
      });
    });
    Timer(const Duration(seconds: 6), () {
      _colorChangeTimer?.cancel();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });

    _splashText = _getRandomSplashText();
  }

  String _getRandomSplashText() {
    // You can modify this list of images based on your preference
    List<String> splashText = [
      'Share your heart, anonymously.Your privacy, our promise.',
      'Every story deserves a voice.Share it, securely and freely.',
      'Anonymity meets empathy.Your safe space to be heard.',
      'Express yourself without boundaries.Privacy is our foundation.',
      'No names, no judgments—just your story.Feel free to share.',
      'Different lives, different stories.Share yours, with complete privacy.',
      'No names. No logins. Just emotions.',
      'No names. No past.Just stories of the heart.'
    ];

    // Return a random image from the list
    splashText.shuffle();
    return splashText.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.background, AppColors.purple.withOpacity(0.5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.dotsTriangle(
                  color: _colors[_currentColorIndex], size: 100),
              const SizedBox(
                height: 20,
              ),
              Text(
                textAlign: TextAlign.center,
                _splashText,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGray),
              ),
            ],
          )),
    );
  }
}
