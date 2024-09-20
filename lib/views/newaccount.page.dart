// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewAccountPage extends StatelessWidget {

  final txtName = TextEditingController();
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();


  Future<void> createUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: txtEmail.text,
          password: txtPassword.text,
        );
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
      appBar: AppBar(
        title: Text("New Account"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(bottom: 32),
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F7FC),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    children: [
                      Center(child: Icon(Icons.person_outline, size: 56)),
                      Positioned(
                        child: Icon(Icons.add_circle, size: 24),
                        bottom: 0,
                        right: 1,
                      ),
                    ],
                  )
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F7FC),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    controller: txtName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 12),
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
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF002DE3)),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => createUser(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
