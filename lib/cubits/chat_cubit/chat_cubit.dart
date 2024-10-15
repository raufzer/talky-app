import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:talky_app/cubits/chat_cubit/chat_states.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messagesCollectionReference =
      FirebaseFirestore.instance.collection('messages');
  void addMessage(
      {required types.Message message,
      required List<types.Message> messages,
      required Function setState}) {
    setState(() {
      messages.insert(0, message);
    });
  }
  
  Future<void> handleSendPressed({
    required types.PartialText message,
    required types.User user,
    required List<types.Message> messages,
    required Function setState,
  }) async {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'id',
      text: message.text,
    );
    addMessage(message: textMessage, messages: messages, setState: setState);
    await sendMessageToFirestore(text: message.text, user: user);
  }

  Future<void> sendMessageToFirestore(
      {required String text, required types.User user}) async {
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
}
