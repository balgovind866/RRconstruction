

import 'package:chat_apps3/pagelogin/fontpage.dart';
import 'package:chat_apps3/signpage/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChatApp());
}
class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      ScreenUtilInit(
        builder: (BuildContext context, Widget? child) =>
            MaterialApp(debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: Colors.indigo,
              ),
              home: FrontPage(),
            ),
        designSize: const Size(390, 844),
      );
  }
}