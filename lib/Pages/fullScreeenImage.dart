import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Full-screen page to display the quote and image in full screen
class FullScreenPage extends StatefulWidget {
  final String initialQuote;
  final String initialAuthor;
  final String initialImageUrl;

  const FullScreenPage({
    Key? key,
    required this.initialQuote,
    required this.initialAuthor,
    required this.initialImageUrl,
  }) : super(key: key);

  @override
  State<FullScreenPage> createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage> {
  String quote = '';
  String author = '';
  String imageUrl = '';
  late Timer _timer;

  void initState() {
    super.initState();
    quote = widget.initialQuote;
    author = widget.initialAuthor;
    imageUrl = widget.initialImageUrl;
    _timer = Timer.periodic(const Duration(seconds: 8), (Timer t) {
      _fetchQuote();
      imageUrl = _getRandomImage();
    });
  }

  Future<void> _fetchQuote() async {
    try {
      final quoteData = await getQuote();
      setState(() {
        quote = quoteData['quote']!;
        author = quoteData['author']!;
      });
    } catch (e) {
      setState(() {
        quote = 'Could not fetch quote at this moment.';
        author = '';
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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Dark overlay
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '"$quote"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: const Offset(0, 2),
                            blurRadius: 3.0,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '-$author-',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            width: screenWidth * 0.65,
            height: screenHeight * 0.07,
            child: GestureDetector(
              onTap: () {
                _fetchQuote();
                imageUrl = _getRandomImage();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white.withOpacity(0.5)),
                )),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            width: screenWidth * 0.15,
            height: screenHeight * 0.07,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
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
          ),
        ],
      ),
    );
  }
}
