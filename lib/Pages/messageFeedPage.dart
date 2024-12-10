import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:silent_echoes/Widgets/message_card.dart';
import 'package:silent_echoes/util/appColors.dart';

class MessageFeedPage extends StatelessWidget {
  final String category;
  final Color categoryColor;

  const MessageFeedPage({
    Key? key,
    required this.category,
    required this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getTitleText(String category) {
      String titleText = '';
      switch (category.trim()) {
        case 'Anxiety':
          titleText = 'Others Worries';
          break;
        case 'Apologies':
          titleText = 'Others Regrets';
          break;
        case 'Happiness':
          titleText = 'Others Smiles';
          break;
        default:
          titleText = 'Others Dreams';
      }
      return titleText;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.background,
        ),
        title: Text(
          getTitleText(category),
          style: const TextStyle(
              color: AppColors.background,
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: categoryColor,
      ),
      backgroundColor: categoryColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(category)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No messages yet'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

              return MessageCard(
                message: data['message'],
                timestamp: data['timestamp'],
              );
            },
          );
        },
      ),
    );
  }
}
