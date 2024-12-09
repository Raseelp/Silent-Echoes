import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:silent_echoes/Pages/messageFeedPage.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  final Color categoryColor;
  const CategoryPage(
      {super.key, required this.category, required this.categoryColor});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController _messageController = TextEditingController();

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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message saved successfully!')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MessageFeedPage(
            category: widget.category,
          ),
        ),
      );
    } catch (e) {
      print(e);
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving message: $e'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.categoryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your message...',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveMessage,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'Let The Worries Go...',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
