class Message {
  final String message;
  Message(this.message);
  factory Message.fromJson(jsonData) {
    return Message(jsonData['kMessages']);
  }
}
