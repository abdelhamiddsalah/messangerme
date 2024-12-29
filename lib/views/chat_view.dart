import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messangerme/controllers/auth_cubit/auth_cubit.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().signout();
              Navigator.pushNamed(context, 'login');
            },
            icon: Icon(Icons.logout, color: Colors.white),
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
            Text('Messengerme', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('messages').orderBy('time', descending: true).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No messages yet.'));
                  }

                  final messages = snapshot.data!.docs;

                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final messageData = messages[index].data() as Map<String, dynamic>;
                      final messageText = messageData['text'] ?? '';
                      final sender = messageData['sender'] ?? 'Unknown Sender';

                      // التحقق إذا كان المستخدم الحالي هو المرسل
                      final isCurrentUser = sender == user?.email;

                      return Column(
                        crossAxisAlignment:
                            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Text(
                            sender,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: isCurrentUser ? Colors.blue : Colors.orange,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: isCurrentUser ? Radius.circular(20) : Radius.zero,
                                bottomRight: isCurrentUser ? Radius.zero : Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              messageText,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.orange, width: 2),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: context.read<AuthCubit>().messageController,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (value) {
                        context.read<AuthCubit>().messagetext = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 0, style: BorderStyle.none),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final authCubit = context.read<AuthCubit>();
                      if (authCubit.messagetext != null &&
                          authCubit.messagetext!.isNotEmpty &&
                          user?.email != null) {
                        // إرسال الرسالة مع user.email كـ sender
                        authCubit.sendmessage(
                          authCubit.messagetext!,
                          user!.email!, // استخدام البريد الإلكتروني للمستخدم
                        );
                        authCubit.messageController.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Cannot send message: Email is null or empty message.')),
                        );
                      }
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(color: Colors.orange),
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
