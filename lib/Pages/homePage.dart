import 'package:flutter/material.dart';
import 'package:silent_echoes/Pages/categoryPage.dart';
import 'package:silent_echoes/Widgets/category_cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildCategoryBox(context, 'Anxiety', Colors.lightBlue,
                  screenWidth, screenHeight),
              buildCategoryBox(context, 'Apologies ', Colors.lightGreen,
                  screenWidth, screenHeight),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildCategoryBox(context, 'Happiness ', Colors.redAccent,
                  screenWidth, screenHeight),
              buildCategoryBox(context, 'Secret Wishes', Colors.pinkAccent,
                  screenWidth, screenHeight),
            ],
          )
        ],
      ),
    );
  }
}
