

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'fontpage.dart';

Widget MenuPage(_slideAnimation,context) {
  final _googleSignIn = GoogleSignIn();

  void Logout() async {
    await _googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>FrontPage()));
  }
  return SlideTransition(
    position: _slideAnimation!,
    child: Padding(
      padding: EdgeInsets.only(left: 16.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Dashboard',
              style: TextStyle(color: Colors.white, fontSize: 22.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Message',
              style: TextStyle(color: Colors.white, fontSize: 22.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'History',
              style: TextStyle(color: Colors.white, fontSize: 22.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'my work',
              style: TextStyle(color: Colors.white, fontSize: 22.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text('passwor',
              style: TextStyle(color: Colors.white, fontSize: 22.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            IconButton(onPressed: (){
              Logout();
            }, icon: Icon(Icons.logout)),
          ],
        ),
      ),
    ),
  );
}
