import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fulano"),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView(),
          ),
          Container(
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.add),),
                Expanded(
                  child: TextField(),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.send),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}