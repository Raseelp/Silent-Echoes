import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:silent_echoes/Pages/aboutUs.dart';
import 'package:silent_echoes/Pages/messageFeedPage.dart';
import 'package:silent_echoes/Widgets/last_message_card.dart';
import 'package:silent_echoes/util/appColors.dart';
import 'package:silent_echoes/util/snackbars.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  final Color categoryColor;
  const CategoryPage(
      {super.key, required this.category, required this.categoryColor});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Snackbars _snackbars = Snackbars();

  final TextEditingController _messageController = TextEditingController();
  final int _maxCharacters = 300;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> _saveMessage() async {
    if (_messageController.text.isEmpty) return;

    try {
      await _firestore.collection(widget.category).add({
        'message': _messageController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Clear the text field after successful save
      _messageController.clear();

      // Show success message
      _snackbars.showSuccessSnackBar(context, 'Thought Released!',
          'Your voice has joined others in this safe space.');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MessageFeedPage(
            category: widget.category,
            categoryColor: widget.categoryColor,
          ),
        ),
      );
    } catch (e) {
      // Show error message
      _snackbars.showFailSnackBar(context, 'Oops! Try Again!',
          'We couldn\'t send your message. Please try again.');
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    String getTitleText(String category) {
      String titleText = '';
      switch (category.trim()) {
        case 'Anxiety':
          titleText = 'Heavy Mind?';
          break;
        case 'Apologies':
          titleText = 'Feeling Sorry?';
          break;
        case 'Happiness':
          titleText = 'Joy to Share?';
          break;
        default:
          titleText = 'Secret Desire?';
      }
      return titleText;
    }

    String getConfortText(String category) {
      String confortText = '';
      switch (category.trim()) {
        case 'Anxiety':
          confortText =
              'A private corner to share your worries, no names attached.';
          break;
        case 'Apologies':
          confortText =
              'Everyone makes mistakes,Share your apologies, no identity, just sincerity';
          break;
        case 'Happiness':
          confortText =
              'Express your joy and brighten someone’s day, all anonymously.';
          break;
        default:
          confortText =
              'A safe space to whisper your deepest desires, no judgment.';
      }
      return confortText;
    }

    String getLastMsgHeadingText(String category) {
      String LastmsgHeadingText = '';
      switch (category.trim()) {
        case 'Anxiety':
          LastmsgHeadingText = '  Last Person Was Worried About:';
          break;
        case 'Apologies':
          LastmsgHeadingText = '  Last Person Was Sorry For:';
          break;
        case 'Happiness':
          LastmsgHeadingText = '  Last Person Was Happy That:';
          break;
        default:
          LastmsgHeadingText = '  Last Person Wished For:';
      }
      return LastmsgHeadingText;
    }

    String getReadMessageButtonText(String category) {
      String ReadMessageButtonText = '';
      switch (category.trim()) {
        case 'Anxiety':
          ReadMessageButtonText = 'Read Other’s Worries';
          break;
        case 'Apologies':
          ReadMessageButtonText = 'Read Other’s Regrets';
          break;
        case 'Happiness':
          ReadMessageButtonText = 'Read Other’s Smiles';
          break;
        default:
          ReadMessageButtonText = 'Read Other’s Dreams';
      }
      return ReadMessageButtonText;
    }

    String getHintText(String category) {
      String HintText = '';
      switch (category.trim()) {
        case 'Anxiety':
          HintText = '   I\'m worried about...';
          break;
        case 'Apologies':
          HintText = '  I wanna say sorry for...';
          break;
        case 'Happiness':
          HintText = '  Something that made You smile today...';
          break;
        default:
          HintText = '  I wish for...';
      }
      return HintText;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: widget.categoryColor,
        title: Center(
          child: Text(
            getTitleText(
              widget.category,
            ),
            style: const TextStyle(
                color: AppColors.background,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: widget.categoryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      textAlign: TextAlign.center,
                      'You\’re Not                           Alone',
                      style: TextStyle(
                          color: AppColors.background,
                          fontSize: 36,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      getConfortText(widget.category),
                      style: const TextStyle(
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
                        minHeight: screenHeight * 0.1,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getLastMsgHeadingText(widget.category),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          LastMessageCard(category: widget.category),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MessageFeedPage(
                              category: widget.category,
                              categoryColor: widget.categoryColor,
                            ),
                          ));
                    },
                    child: Container(
                      width: screenWidth * 0.35,
                      constraints: BoxConstraints(
                        minHeight: screenHeight * 0.1,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          getReadMessageButtonText(widget.category),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AboutUs(categoryColor: widget.categoryColor),
                          ));
                    },
                    child: Container(
                      width: screenWidth * 0.35,
                      constraints: BoxConstraints(
                        minHeight: screenHeight * 0.1,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'About Us',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.08,
              ),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: screenHeight * 0.1,
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: _messageController,
                        maxLength: _maxCharacters,
                        decoration: InputDecoration(
                          counterStyle: const TextStyle(fontSize: 15),
                          filled: false,
                          hintText: getHintText(widget.category),
                          border: InputBorder.none,
                        ),
                        maxLines: 6,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: _saveMessage,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              backgroundColor: widget.categoryColor,
                            ),
                            child: const Text(
                              'Let It Flow...',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
