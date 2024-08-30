// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TextField(),
            SizedBox(height: 12),
            TextField(),
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
                onPressed: () {},
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Don't have a account? Create one."),
            )
          ],
        ),
      ),
    );
  }
}
