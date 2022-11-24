import 'package:chat_apps3/page_display/homePage_component/SplashScrean_page.dart';
import 'package:chat_apps3/provider_page/card_class.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'provider_page/SignInprovide_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>Cart()),
      ChangeNotifierProvider(create: (_)=>SignInprovide())
    ],
      child: ChatApp()));
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
              home: SplashScrean(),
            ),
        designSize: const Size(390, 844),
      );
  }
}