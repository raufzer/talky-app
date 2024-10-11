import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});
  static String id = '/ChatScreen';

  final CollectionReference messagesFirestore =
      FirebaseFirestore.instance.collection('messages');

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac', // Unique user ID
  );

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }

  // Fetch messages from Firestore
  void _loadMessages() async {
    final snapshot = await widget.messagesFirestore.orderBy('createdAt', descending: true).get();
    final messages = snapshot.docs.map((doc) {
      return types.TextMessage(
        author: _user,
        createdAt: doc['createdAt'],
        id: doc.id,
        text: doc['text'],
      );
    }).toList();

    setState(() {
      _messages = messages;
    });
  }

  // Save message to Firestore when user sends a message
  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'id', // Placeholder, Firestore will generate an ID
      text: message.text,
    );

    await widget.messagesFirestore.add({
      'message': message.text,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
      'userId': _user.id,
    });

    _addMessage(textMessage);
  }

  // Add message to the local message list
  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }
}
