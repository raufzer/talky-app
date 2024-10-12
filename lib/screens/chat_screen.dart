// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static String id = '/ChatScreen';
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  _loadMessages() async {
    FirebaseFirestore.instance
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {
      try {
        setState(() {
          _messages.clear();
          for (var doc in snapshot.docs) {
            final data = doc.data();
            final message = types.TextMessage(
              id: doc.id,
              text: data['message'],
              author: types.User(id: data['userId']),
              createdAt: data['createdAt'],
            );
            _messages.insert(0, message);
          }
        });
      } catch (error) {
        print("Error fetching messages: $error");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chat(
        messages: _messages.reversed.toList(),
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'id',
      text: message.text,
    );
    _addMessage(textMessage);
    await _sendMessageToFirestore(message.text);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  Future<void> _sendMessageToFirestore(String text) async {
    try {
      await FirebaseFirestore.instance.collection('messages').add({
        'message': text,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
        'userId': _user.id,
      });
    } catch (error) {
      // Handle error, e.g., show a snackbar to the user
      print("Error sending message: $error");
    }
  }
}
