// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.chat_outlined),
          ),
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              // Navigator.pushReplacementNamed(context, '/login');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFFF7F7FC),
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Color(0xFFADB5BD)),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Color(0xFFADB5BD))),
            ),
          ),
          Flexible(
            child: ListView(
              children: [
                ChatsItem(
                  userName: 'Ciclano',
                  lastMessage: 'Bom dia! Dormiu bem?',
                  date: DateTime.now(),
                  amount: 2,
                 ),
                ChatsItem(
                  userName: 'Beltrano',
                  lastMessage: 'Bom dia! Dormiu bem?',
                  date: DateTime.now(),
                  amount: 5,
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatsItem extends StatelessWidget {
  
  final String userName;
  final String lastMessage;
  final DateTime date;
  final int amount;

  ChatsItem({
    required this.userName, 
    required this.lastMessage,
    required this.date,
    required this.amount
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, '/chat'),
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: NetworkImage('https://picsum.photos/200'))),
      ),
      title: Text(this.userName),
      subtitle: Text(this.lastMessage),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Now"),
          Container(
            child: Text(this.amount.toString()),
            margin: EdgeInsets.only(top: 10),
            padding:
                EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xFFD2D5F9)),
          ),
        ],
      ),
    );
  }
}
