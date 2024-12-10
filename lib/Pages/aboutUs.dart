import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  final Color categoryColor;
  const AboutUs({super.key, required this.categoryColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Silent-Echoes'),
        backgroundColor: categoryColor,
      ),
      backgroundColor: categoryColor,
      body: Column(),
    );
  }
}
