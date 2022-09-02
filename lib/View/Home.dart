import 'package:firestore/View/Profile.dart';
import 'package:firestore/View/UserDetails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController AddTodo = TextEditingController();

  void AddTask() {
    FirebaseFirestore.instance.collection('Task').add({'Task': AddTodo.text});
  }

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Details()));
            },
            icon: Icon(Icons.portrait),
          ),
          title: Text("Todo"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                        controller: AddTodo,
                        decoration: InputDecoration(hintText: 'Enter ToDo'))),
                TextButton(
                    onPressed: () {
                      AddTask();
                    },
                    child: Text("Add Todo"))
              ],
            ),
            StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('Task').snapshots(),
                builder: ((
                  context,
                  snapshot,
                ) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    return Expanded(
                      child: ListView(
                        children: snapshot.data!.docs.map((document) {
                          return ListTile(
                            leading: Checkbox(
                              value: _value,
                              onChanged: ((bool? value) {
                                setState(() {
                                  _value = value!;
                                });
                              }),
                            ),
                            title: Text(document['Task']),
                          );
                        }).toList(),
                      ),
                    );
                  }
                }))
          ],
        ));
  }
}
