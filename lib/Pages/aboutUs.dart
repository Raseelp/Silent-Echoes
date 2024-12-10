import 'package:flutter/material.dart';
import 'package:silent_echoes/util/appColors.dart';

class AboutUs extends StatelessWidget {
  final Color categoryColor;
  const AboutUs({super.key, required this.categoryColor});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.background,
            )),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 50),
            child: Text(
              'About',
              style: const TextStyle(
                  color: AppColors.background,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: categoryColor,
      ),
      backgroundColor: categoryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: screenHeight * 0.3,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    textAlign: TextAlign.start,
                    'Silent-Echoes',
                    style: TextStyle(
                        color: AppColors.background,
                        fontSize: 36,
                        fontWeight: FontWeight.w800),
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    'Hello! I\'m Raseel, the creator of "Silent Echoes,"',
                    style: TextStyle(
                        color: AppColors.background,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    'This is a personal project that provides a safe, anonymous space for individuals to share their thoughts, confessions, and emotions. Whether it\'s anxiety, an apology, or gratitude, this platform allows users to connect while ensuring privacy and anonymity.',
                    style: TextStyle(
                        color: AppColors.background,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: screenHeight * 0.3,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    textAlign: TextAlign.start,
                    'Commitment To Privacy',
                    style: TextStyle(
                        color: AppColors.background,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    '1. Complete Anonymity: No personal information is required; your identity is always protected.',
                    style: TextStyle(
                        color: AppColors.background,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    '2. No Tracking: I don\'t use cookies or tracking technologies.',
                    style: TextStyle(
                        color: AppColors.background,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    '3. Ongoing Improvement: As a solo developer, I\'m dedicated to maintaining and enhancing this platform.',
                    style: TextStyle(
                        color: AppColors.background,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: screenHeight * 0.3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          textAlign: TextAlign.start,
                          'If you have any questions, suggestions, or would like to support the project, feel free to reach out to me at ',
                          style: TextStyle(
                              color: AppColors.background,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          textAlign: TextAlign.start,
                          'raseelp321@gmail.com',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        const Text(
                          textAlign: TextAlign.start,
                          'Monetization Policy: Currently, I do not have any monetization strategies in place, and I am committed  to never Storing or selling any user data or information.',
                          style: TextStyle(
                              color: AppColors.background,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
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
    );
  }
}
