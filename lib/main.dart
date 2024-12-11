import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:silent_echoes/Pages/homePage.dart';
import 'package:silent_echoes/Pages/splashScreen.dart';
import 'package:silent_echoes/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SilentEchoes());
}

class SilentEchoes extends StatelessWidget {
  const SilentEchoes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'poppins'),
      home: SplashScreen(),
    );
  }
}
