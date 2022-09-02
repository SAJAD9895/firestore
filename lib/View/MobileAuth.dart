import 'package:firestore/View/Home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:country_list_pick/country_list_pick.dart';

class MobileAuth extends StatefulWidget {
  MobileAuth({Key? key}) : super(key: key);

  @override
  State<MobileAuth> createState() => _MobileAuthState();
}

class _MobileAuthState extends State<MobileAuth> {
  TextEditingController PhoneNumber = TextEditingController();

  TextEditingController OTP = TextEditingController();

  

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: PhoneNumber,
                  decoration: InputDecoration(
                    label: Text('Enter Your Phpne Number'),
                    prefix: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('+91'),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Send OTP')),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration:
                      InputDecoration(label: Text('Enter Your Phpne Number')),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Home()));
                    },
                    child: Text('Enter OTP'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
