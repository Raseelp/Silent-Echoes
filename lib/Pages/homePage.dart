import 'package:flutter/material.dart';
import 'package:silent_echoes/Pages/categoryPage.dart';
import 'package:silent_echoes/Widgets/category_cards.dart';
import 'package:silent_echoes/util/appColors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Silent Echoes.',
            style: TextStyle(
                color: AppColors.darkGray,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.darkGray,
                  borderRadius: BorderRadius.circular(20)),
              height: screenHeight * 0.2,
              width: screenWidth * 0.9,
            ),
            SizedBox(
              height: screenHeight * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCategoryBox(context, 'Anxiety', AppColors.purple,
                    screenWidth, screenHeight),
                buildCategoryBox(context, 'Apologies', AppColors.blue,
                    screenWidth, screenHeight),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCategoryBox(context, 'Happiness', AppColors.pink,
                    screenWidth, screenHeight),
                buildCategoryBox(context, 'Secret Wishes', AppColors.teal,
                    screenWidth, screenHeight),
              ],
            )
          ],
        ),
      ),
    );
  }
}
