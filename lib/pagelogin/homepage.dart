
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../navigationpages/button_navigation.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _googleSignIn = GoogleSignIn();


  void Logout() async
  {
    await _googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2C2929),
        title: Text("RRconstracion",
          style: TextStyle(
            color: Color(0xff11B3C9),

          ),),
        actions: [

          Row(
            children: [
              IconButton(onPressed: () {
                Logout();
                Navigator.pop(context);
              },
                icon: Icon(Icons.logout),
              ),
              IconButton(onPressed: () {},
                  icon: Icon(Icons.notification_add)),
            ],
          ),
        ],
      ),

    );
  }
}


















