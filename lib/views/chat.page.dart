// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {

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
            child: ListView(),
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Good morning",
                          hintStyle: TextStyle(fontSize: 14, color: Color(0xFF0F1828),)
                        ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.paperplane_fill, color: Color(0xFF002DE3)),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}