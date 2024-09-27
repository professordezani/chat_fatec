// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.page.dart';
import 'newaccount.page.dart';
import 'chats.page.dart';
import 'chat.page.dart';

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
        "/chat":(context) => ChatPage(),
      },
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
           if (snapshot.connectionState == ConnectionState.active) {
             return snapshot.data == null ? LoginPage() : ChatsPage();
           } else {
             return LoginPage();
           }
        },)
      // initialRoute: "/login",
    );
  }
}