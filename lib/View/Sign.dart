import 'package:firestore/View/Home.dart';
import 'package:firestore/View/Login.dart';
import 'package:firestore/View/MobileAuth.dart';
import 'package:firestore/View/Profile.dart';
import 'package:firestore/View/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:firestore/Controller/GoogleAuth.dart';

class Sign extends StatelessWidget {
  Sign({Key? key}) : super(key: key);
  Auth google = Auth();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => LogIn()));
              },
              child: Container(
                margin:const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                height: 60,
                width: double.infinity,
                child: const Center(
                    child: Text(
                  'Login With Email And Password',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            GestureDetector(
              onTap: () async {
                google.googleSignIn(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Proflie(),
                ));
              },
              child: Container(
                margin: const EdgeInsets.only(
                    right: 20, left: 20, bottom: 20, top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                height: 60,
                width: double.infinity,
                child: const Center(
                    child: Text(
                  'Sign in with Google',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SignUp()));
              },
              child: Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                height: 60,
                width: double.infinity,
                child: const Center(
                    child: Text(
                  'SignUp',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
