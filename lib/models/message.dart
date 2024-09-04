// ignore: constant_identifier_names
enum MessageType {TEXT, AUDIO, IMAGE}

class Message {
  final MessageType messageType;
  final String sender;
  final String text;
  final DateTime timestamp;

  Message({
    required this.messageType,
    required this.sender,
    required this.text,
    required this.timestamp,
  });
}