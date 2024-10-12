import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String id;
  final String senderId;
  final String chatId;
  final String message;
  final Timestamp createdAt;

  Message({
    required this.id,
    required this.senderId,
    required this.chatId,
    required this.message,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> jsonData) {
    return Message(
      id: jsonData['id'],
      senderId: jsonData['senderId'],
      chatId: jsonData['chatId'],
      message: jsonData['message'],
      createdAt: jsonData['createdAt'],
    );
  }
}