import 'package:flutter/material.dart';

class ChatSectionView extends StatelessWidget {
  const ChatSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Column(
          children: [Text('Chat Page')],
        ),
      ),
    );
  }
}
