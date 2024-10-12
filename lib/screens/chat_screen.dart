import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:talky_app/utils/chat_utils.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static String id = '/ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String messageDocumentID = dotenv.env['MESSAGES_DOCUMENT_ID']!;
  final List<types.Message> _messages = [];
  late final _user = types.User(id: messageDocumentID);
  CollectionReference messagesCollectionReference =
      FirebaseFirestore.instance.collection('messages');

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  _loadMessages() {
    messagesCollectionReference
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {
      try {
        List<types.Message> newMessages = snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return types.TextMessage(
            id: doc.id,
            text: data['message'],
            author: types.User(id: data['userId']),
            createdAt: data['createdAt'],
          );
        }).toList();

        setState(() {
          _messages.clear();
          _messages.addAll(newMessages);
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
        messages: _messages,
        onSendPressed: (message) =>
            handleSendPressed(message, _user, _messages, setState),
        user: _user,
      ),
    );
  }
}
