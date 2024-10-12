import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String id;
  final List<String> participants;
  final Timestamp createdAt;

  Chat({
    required this.id,
    required this.participants,
    required this.createdAt,
  });

  factory Chat.fromJson(Map<String, dynamic> jsonData) {
    return Chat(
      id: jsonData['id'],
      participants: List<String>.from(jsonData['participants']),
      createdAt: jsonData['createdAt'],
    );
  }
}
