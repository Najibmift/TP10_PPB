import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestFirestore extends StatefulWidget {
  const TestFirestore({super.key});

  @override
  State<TestFirestore> createState() => _TestFirestoreState();
}

class _TestFirestoreState extends State<TestFirestore> {
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: db.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }
          // olah data
          var _data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_data[index].data()["first"].toString()),
                subtitle: Text(_data[index].data()["last"].toString()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Create a new user with a first and last name
          final user = <String, dynamic>{
            "first": "Ada",
            "last": "Lovelace",
            "born": 1825,
          };

// Add a new document with a generated ID
          db.collection("users").add(user).then((DocumentReference doc) =>
              print('DocumentSnapshot added with ID: ${doc.id}'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
