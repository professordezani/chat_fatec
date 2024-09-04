// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'login.page.dart';
import 'newaccount.page.dart';
import 'chat.page.dart';

class ChatFatecApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      routes: {
        "/login": (context) => LoginPage(),
        "/new-account": (context) => NewAccountPage(),
        "/chat": (context) => ChatPage(),
      },
      initialRoute: "/login",
    );
  }
}