

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:cloud_firestore/cloud_firestore.dart';


Future<void> handleSendPressed(
  types.PartialText message,
    types.User user,
  List<types.Message> messages,
  Function setState,
) async {
  final textMessage = types.TextMessage(
    author: user,
    createdAt: DateTime.now().millisecondsSinceEpoch,
    id: 'id',
    text: message.text,
  );
  addMessage(textMessage, messages, setState);
  await sendMessageToFirestore(message.text, user);
}



void addMessage(types.Message message, List<types.Message> messages, Function setState) {
  setState(() {
    messages.insert(0, message);
  });
}


Future<void> sendMessageToFirestore(String text, types.User user) async {
  try {
    await FirebaseFirestore.instance.collection('messages').add({
      'message': text,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
      'userId': user.id,
    });
  } catch (error) {
    
    print("Error sending message: $error");
  }
}