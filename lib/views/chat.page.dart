// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final txtMessage = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  final firestore = FirebaseFirestore.instance;

  Future<void> sendMessage() async {

    var doc = {
      "uid": user.uid,
      "displayName": user.displayName,
      "timestamp": FieldValue.serverTimestamp(),
      "type": "text",
      "message": txtMessage.text
    };

    await firestore.collection('messages').add(doc);

    txtMessage.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7FC),
      appBar: AppBar(
        title: Text("Fulano"),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              reverse: true,
              children: [
                ReceivedMessage(),
                SentMessage(),
                SentAudioMessage(),
                ReceivedMessage(),
                SentMessage()
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,

            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.add, color: Color(0xFFADB5BD)),),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFFF7F7FC),
                      ),
                      child: TextField(
                        controller: txtMessage,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type your message...",
                          hintStyle: TextStyle(fontSize: 14, color: Color(0xFF0F1828),)
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => sendMessage(),
                    icon: Icon(CupertinoIcons.paperplane_fill, color: Color(0xFF002DE3),)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 12, left: 16, right: 60),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.lightGreen[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good morning, did you sleep well? Good morning, did you sleep well?"), 
            SizedBox(height: 4,),
            Text("09:45")
          ],
        ),
      ),
    );
  }
}

class SentMessage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(bottom: 12, left: 60, right: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFF002DE3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("K, I'm on my way", style: TextStyle(color: Colors.white),),
            
            SizedBox(height: 4,),
            Text("09:45", style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}

class SentAudioMessage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        // width: 160,
        margin: EdgeInsets.only(bottom: 12, left: 60, right: 16),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Color(0xFF002DE3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 6, 4),
              padding: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: Color(0xFF375FFF),
                borderRadius: BorderRadius.circular(8)
              ),
              width: 150,
              child: Row(
                children: [
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      Icons.pause,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: LinearProgressIndicator(
                      minHeight: 5,
                      value: 0.25,
                      color: Colors.red,
                      valueColor:  AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            Text("09:45", style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}