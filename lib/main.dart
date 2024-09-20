import 'package:chat_fatec/firebase_options.dart';
import 'package:flutter/material.dart';
import 'views/app.dart';

import 'package:firebase_core/firebase_core.dart';

// const options = FirebaseOptions(
//   apiKey: "",
//   authDomain: "",
//   projectId: "",
//   storageBucket: "",
//   messagingSenderId: "",
//   appId: ""
// );

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(options: options);
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChatFatecApp());
}
