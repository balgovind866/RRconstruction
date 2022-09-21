import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore=FirebaseFirestore.instance;

  String? masseg;
  User? loginguser;

  @override
  void initState() {
    super.initState();
    checkloging();
    getstreamdata();

  }

  Future<void> checkloging() async {
    var user = await _auth.currentUser;
    if (user != null) {
      loginguser = user;
      print(loginguser?.email);
    }
  }
  void getstreamdata()  async {
    await for (var stream in _firestore.collection('messages').snapshots()) {
      for (var message in stream.docs) {
        print(message.data());
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff70A7FF),
        title: Text('chat hear'),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(1),
              child: Row(children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Write the massege hear',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      masseg = value;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () async {
                   await
                        _firestore.collection('messages')
                        .add({
                          'message': masseg,
                     'userid':loginguser?.email,// John Doe
                           // Stokes and Sons
                        })
                        .then((value) => print("User Added"))
                        .catchError(
                            (error) => print("Failed to add user: $error"));
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    foregroundColor: Color(0xff70A7FF),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
