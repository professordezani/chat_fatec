// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();


  Future<void> signIn(BuildContext context) async {
    try {
      
      // FirebaseAuth.instance.sendPasswordResetEmail(email: txtEmail.text);
      await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: txtEmail.text,
          password: txtPassword.text,
        );

      Navigator.pushReplacementNamed(context, '/chats');
    }
    on FirebaseAuthException catch (ex) {
      var snackBar = SnackBar(
        content: Text(ex.message ?? 'Erro inesperado.'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFFF7F7FC),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  hintStyle: TextStyle(),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              color: Color(0xFFF7F7FC),
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: txtPassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 68),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF002DE3)),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => signIn(context),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/new-account');
              },
              child: Text("Don't have an account? Create one."),
            )
          ],
        ),
      ),
    );
  }
}
