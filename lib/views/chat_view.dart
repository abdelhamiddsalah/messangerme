import 'package:flutter/material.dart';
import 'package:messangerme/views/widgets/textfield_item.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange,
              backgroundImage: AssetImage('assets/images/logo (1).png'),
            ),
            SizedBox(width: 10),
            Text('MessangerMe'),
          ],
        ),
      ),
      body: TextfieldItem(text: 'Chat',),
    );
  }
}