import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silent_echoes/Pages/categoryPage.dart';
import 'package:silent_echoes/Pages/fullScreeenImage.dart';
import 'package:silent_echoes/Widgets/category_cards.dart';
import 'package:silent_echoes/util/appColors.dart';
import 'dart:convert'; // For json decoding
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _quote = '"Loading inspirational quote..."';
  String _author = '-Fetching Author-';
  String _imagePath = 'assets/images/img1.jpeg';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _fetchQuote();
    _timer = Timer.periodic(const Duration(seconds: 8), (Timer t) {
      _fetchQuote();
      _imagePath = _getRandomImage();
    });
  }

  Future<void> _fetchQuote() async {
    try {
      final quoteData = await getQuote();
      setState(() {
        _quote = quoteData['quote']!;
        _author = quoteData['author']!;
      });
    } catch (e) {
      setState(() {
        _quote = 'Could not fetch quote at this moment.';
        _author = '';
      });
    }
  }

  Future<Map<String, String>> getQuote() async {
    final url = Uri.parse('https://zenquotes.io/api/random');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final quote = data[0]['q'];
        final author = data[0]['a'];
        return {'quote': quote, 'author': author};
      } else {
        throw Exception('Failed to load quote');
      }
    } catch (e) {
      throw Exception('Error fetching quote: $e');
    }
  }

  String _getRandomImage() {
    // You can modify this list of images based on your preference
    List<String> images = [
      'assets/images/img2.jpg',
      'assets/images/img3.jpg',
      'assets/images/img4.jpg',
      'assets/images/img5.jpg',
      'assets/images/img6.jpg',
      'assets/images/img7.jpg',
      'assets/images/img8.jpg',
    ];

    // Return a random image from the list
    images.shuffle();
    return images.first;
  }

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
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenPage(
                          initialQuote: _quote,
                          initialAuthor: _author,
                          initialImageUrl: _imagePath),
                    ));
              },
              child: Container(
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
                    image: DecorationImage(
                      image: AssetImage(_imagePath),
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              '"$_quote"',
                              style: const TextStyle(
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
                          const SizedBox(height: 4),
                          Text(
                            '-$_author-',
                            style: const TextStyle(
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
                    Positioned(
                      right: 10,
                      bottom: 10,
                      width: screenWidth * 0.1,
                      height: screenHeight * 0.05,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/images/expand.svg',
                            color: Colors.white.withOpacity(0.5),
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
