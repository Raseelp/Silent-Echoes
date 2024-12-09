import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:silent_echoes/Pages/categoryPage.dart';

Widget buildCategoryBox(BuildContext context, String category, Color color,
    double screenWidth, double screenHeight) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            category: category,
            categoryColor: color,
          ),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(8.0),
      width: screenWidth * 0.35,
      height: screenHeight * 0.25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          category,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
