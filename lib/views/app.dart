// ignore_for_file: prefer_const_constructors

import 'package:chat_fatec/views/chats.page.dart';
import 'package:flutter/material.dart';
import 'login.page.dart';
import 'newaccount.page.dart';

class ChatFatecApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        "/login": (context) => LoginPage(),
        "/new-account": (context) => NewAccountPage(),
        "/chats":(context) => ChatsPage(),
      },
      initialRoute: "/login",
    );
  }
}