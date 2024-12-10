import 'package:flutter/material.dart';
import 'package:silent_echoes/Pages/categoryPage.dart';
import 'package:silent_echoes/Widgets/category_cards.dart';
import 'package:silent_echoes/util/appColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10.0,
                      offset: const Offset(4, 4),
                    ),
                  ],
                  color: AppColors.darkGray,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/img1.jpeg'),
                    fit: BoxFit.cover,
                  )),
              height: screenHeight * 0.25,
              width: screenWidth * 0.9,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            '"Every little step forward, no matter how small, is progress. Be kind to yourself."',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(150, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '-Anonymous-',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 1),
                                blurRadius: 2.0,
                                color: Color.fromARGB(150, 0, 0, 0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
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
