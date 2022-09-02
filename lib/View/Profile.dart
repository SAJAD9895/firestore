// ignore_for_file: avoid_unnecessary_containers

import 'package:firestore/View/Home.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Proflie extends StatelessWidget {
  Proflie({Key? key}) : super(key: key);
  TextEditingController Name = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Job = TextEditingController();
  void AddDetails() async {
    FirebaseFirestore.instance
        .collection('Userdetail')
        .add({'Name': Name.text, 'job': Job.text, 'PhoneNumber': Phone.text});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: Name,
                decoration: InputDecoration(hintText: 'Enter ur name'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: Phone,
                decoration: InputDecoration(hintText: 'Enter ur phonenumber'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: Job,
                decoration: InputDecoration(hintText: 'Enter ur job'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    AddDetails();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Text('Submite '))
            ],
          ),
        ),
      ),
    );
  }
}
