import 'package:firestore/View/Home.dart';
import 'package:firestore/View/Profile.dart';
import 'package:firestore/View/Sign.dart';
import 'package:firestore/View/SignUp.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firestore/Controller/AthService.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Sign())),
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 254, 250, 250),
        ),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(35, 25, 0, 15),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(35, 0, 0, 35),
                    child: Text('Log in.....')),
                const Padding(
                    padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                    child: Text(' EMAIL')),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 10, 0, 25),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter yuour email',
                        hintText: 'Enter Your email'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(35, 30, 0, 0),
                  child: Text('password'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 10, 0, 45),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        // border: InputBorder.none,
                        border: OutlineInputBorder(),
                        labelText: 'Enter password',
                        hintText: 'Enter Your passsword'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Proflie(),
                        ));
                        final message = await AuthService().login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        if (message!.contains('Success')) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool("isLoggedIn", true);
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
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
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("didn't have account"),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              "sign up",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ]),
        ));
  }
}
