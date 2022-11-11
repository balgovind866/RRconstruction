
import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';


import '../navigationpages/button_navigation.dart';
import 'homePage_component/fontpage.dart';


class SplashScrean extends StatefulWidget {
  const SplashScrean({Key? key}) : super(key: key);

  @override
  State<SplashScrean> createState() => _SplashScreanState();
}

class _SplashScreanState extends State<SplashScrean> {
  SplashServices splashScrean=SplashServices() ;



  @override
void initState() {
    // TODO: implement initState
    super.initState();
    splashScrean.islogin(context);
  }

  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 250.w,
      child:Lottie.asset('image/125957-nice-loading.json'),
    );

  }
}
class SplashServices{
  void islogin( BuildContext context){
    final _auth= FirebaseAuth.instance;
    final user=_auth.currentUser;
    if(user==null)
      {
    Timer( Duration(
        seconds: 4
    ), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FrontPage()),),);
  }else{
      Timer( Duration(
          seconds: 4
      ), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ButtonNavigation()),),);
    }

    }


}