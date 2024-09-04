import 'package:chat_fatec/controllers/gemini.controller.dart';
import 'package:chat_fatec/controllers/message.controller.dart';
import 'package:chat_fatec/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final String senderOriginal = 'Henrique';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: false,
              itemCount: MessageController.messages.length,
              itemBuilder: (context, index) {
                // int length = MessageController.messages.length - 1;
                return senderOriginal !=
                        MessageController.messages[index].sender
                    ? ReceivedMessage(
                        text: MessageController.messages[index].text,
                        senderName: MessageController.messages[index].sender,
                        avatarUrl: 'https://picsum.photos/200',
                        timestamp: MessageController.messages[index].timestamp,
                      )
                    : SentMessage(
                        text: MessageController.messages[index].text,
                      );
              },
            ),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}

class MessageInput extends StatefulWidget {
  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  TextEditingController txtMessage = TextEditingController();

  bool enableMic = true;

  void sendMessage() async {
    var sentMessage = Message(
      messageType: MessageType.TEXT,
      sender: 'Henrique',
      text: txtMessage.text,
      timestamp: DateTime.now(),
    );

    MessageController.messages.add(sentMessage);

    String? response = await GeminiController().chat(txtMessage.text);

    var receivedMessage = Message(
      messageType: MessageType.TEXT,
      sender: 'Teacher',
      text: response ?? 'No message',
      timestamp: DateTime.now(),
    );

    MessageController.messages.add(receivedMessage);

    setState(() => txtMessage.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.attach_file_outlined,
                        color: Colors.grey),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: txtMessage,
                      decoration: const InputDecoration(
                        hintText: 'Type a message',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          enableMic = value.isEmpty;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          enableMic
              ? Container(
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.mic, color: Colors.white),
                    onPressed: () {},
                  ),
                )
              : Container(
                  decoration: const BoxDecoration(
                    // color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.teal),
                    onPressed: sendMessage,
                  ),
                ),
        ],
      ),
    );
  }
}

class ReceivedMessage extends StatelessWidget {
  final String text;
  final String senderName;
  final String avatarUrl;
  final DateTime? timestamp;

  ReceivedMessage({
    required this.text,
    required this.senderName,
    required this.avatarUrl,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
      // padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      senderName,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '13:00',
                      // DateFormat('HH:mm').format(timestamp),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Markdown(
                      selectable: true,
                      data: text,
                    )
                    // child: Text(text, style: const TextStyle(fontSize: 16)),
                    ),
              ],
            ),
          ),
          const SizedBox(width: 32), // Add some space on the right side
        ],
      ),
    );
  }
}

class SentMessage extends StatelessWidget {
  final String text;

  SentMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
