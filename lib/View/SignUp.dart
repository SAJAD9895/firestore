// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firestore/View/Home.dart';
import 'package:firestore/View/Login.dart';
import 'package:firestore/View/Sign.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firestore/Controller/AthService.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isSignIn = false;
  bool google = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Sign())),
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(35, 25, 0, 15),
                child: Text(
                  'Welcome ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(35, 0, 0, 35),
                  child: Text('Signup.....')),
              Padding(
                  padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                  child: Text('EMAIL')),
              Padding(
                padding: EdgeInsets.fromLTRB(35, 10, 0, 0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      // border: InputBorder.none,
                      border: OutlineInputBorder(),
                      labelText: 'Enter EMAIL',
                      hintText: 'Enter Your EMAIL'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(35, 30, 0, 0),
                child: Text('password'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(35, 10, 0, 35),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      // border: InputBorder.none,
                      border: OutlineInputBorder(),
                      labelText: 'Enter password',
                      hintText: 'Enter Your password'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () async {
                      final message = await AuthService().registration(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      if (message!.contains('Success')) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => LogIn()));
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                    },
                    height: 50,
                    minWidth: 200,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(
                      'sign up',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
