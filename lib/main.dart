import 'package:chat_fatec/firebase_options.dart';
import 'package:flutter/material.dart';
import 'views/app.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChatFatecApp());
}
