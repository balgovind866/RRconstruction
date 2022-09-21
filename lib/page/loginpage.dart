
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chatpage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _auth=FirebaseAuth.instance;
  final _choldstore=FirebaseFirestore.instance;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 150,
                child: Image.asset('image/logo.png'),
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter the gmail',
                  border: OutlineInputBorder(),

                  icon: Icon(Icons.email),
                  contentPadding: EdgeInsets.symmetric( vertical:2,horizontal: 20),

              ),
                onChanged: (value){
                  email=value;
                },

              ),
              SizedBox(height: 10,),

            TextField(
              decoration: InputDecoration(
                labelText: 'Enter the Password',
                border: OutlineInputBorder(),
                icon: Icon(Icons.password),
                contentPadding: EdgeInsets.symmetric( vertical:2,horizontal: 20),

              ),
              onChanged: (value){
                password=value;
              },

            ),
              SizedBox(height: 15,),
              TextButton(onPressed: () async {
                try {
                  final userCreds = await _auth.signInWithEmailAndPassword(
                      email: email!, password: password!);
                  if (userCreds != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatPage()));
                  }
                }catch(e){
                  print(e);
                }

              }, child: Text( 'Login'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(30,8,30,8),
                  backgroundColor: Colors.indigoAccent,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
