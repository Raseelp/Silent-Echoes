import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:silent_echoes/Pages/categoryPage.dart';

Widget buildCategoryBox(BuildContext context, String category, Color color,
    double screenWidth, double screenHeight) {
  List<String> getCategoryText(String category) {
    switch (category.trim()) {
      case 'Anxiety':
        return ['Feeling', 'anxious?'];
      case 'Apologies':
        return ['Say', 'you\'re sorry.'];
      case 'Happiness':
        return ['Share', 'your joy.'];
      default:
        return ['Make', 'a wish.'];
    }
  }

  String getSvgPath(String category) {
    String path = '';
    switch (category.trim()) {
      case 'Anxiety':
        path = 'assets/images/anx.svg';
        break;
      case 'Apologies':
        path = 'assets/images/sorry.svg';
        break;
      case 'Happiness':
        path = 'assets/images/joy.svg';
        break;
      default:
        path = 'assets/images/wish.svg';
    }

    return path;
  }

  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => CategoryPage(
            category: category,
            categoryColor: color,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(8.0),
      width: screenWidth * 0.43,
      height: screenHeight * 0.25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10.0,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Stack(children: [
        Center(
          // Add this
          child: Opacity(
            opacity: 0.2,
            child: SvgPicture.asset(
              getSvgPath(category),
              width: screenWidth * 0.35,
              height: screenWidth * 0.35, // Add fixed height
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              placeholderBuilder: (BuildContext context) => Container(
                width: screenWidth * 0.25,
                height: screenWidth * 0.25,
                child: const Center(
                  child: Text('SVG Load Error'),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getCategoryText(category)
                .map(
                  (text) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ]),
    ),
  );
}
