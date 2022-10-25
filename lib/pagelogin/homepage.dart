import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../navigationpages/button_navigation.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
  bool iscollapsed = true;
  double? screanWidth,screanHeight;
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  Animation<Offset>? _slideAnimation;


  @override
  void initState()
  {
    super.initState();
    _controller=AnimationController(vsync: this,duration:Duration(seconds:1), );
    _scaleAnimation=Tween<double>(begin:1,end:0.6 ).animate(_controller!);
    _slideAnimation=Tween<Offset>(begin:Offset(-1,0),end:Offset(0,0)).animate(_controller!);
  }
  @override
  void dispose(){
    _controller?.dispose();
    super.dispose();
  }


  final _googleSignIn = GoogleSignIn();

  void Logout() async {
    await _googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    screanHeight=size.height;
    screanWidth=size.width;
    return Scaffold(
      backgroundColor: Color(0xff514949),
      body: Stack(
        children: <Widget>[
          MenuPage(context),
          dashbord(context),
        ],
      ),
    );
  }

  Widget MenuPage(context) {
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
              Text(
                'passwor',
                style: TextStyle(color: Colors.white, fontSize: 22.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashbord(context) {
    return AnimatedPositioned(
      duration: Duration(seconds:1),
      top: 0,
      right: iscollapsed? 0:-0.4*screanWidth!,
      bottom: 0,
      left: iscollapsed? 0:0.6*screanWidth!,
      child: ScaleTransition(
        scale: _scaleAnimation!,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          elevation: 8,
          color: Color(0xff514949),
          child:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 48.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        hoverColor: Color(0xff48D1EF),
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onTap: () {
                          setState((){
                          if(iscollapsed) {
                            _controller?.forward();
                          }else{
                            _controller!.reverse();
                          }
                            iscollapsed=!iscollapsed;
                          });
                        },
                      ),
                      Text(
                        "RRconstracion",
                        style: TextStyle(
                          color: Color(0xff11B3C9),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Logout();
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon:
                                  Icon(Icons.notification_add, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    height: 250.h,
                    child: PageView(controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal:8 ),
                          color: Colors.redAccent,


                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal:8 ),
                          color: Colors.indigoAccent,

                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal:8 ),
                          color: Colors.deepPurpleAccent,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:20.h,),
                  Text('Transactions' ,style: TextStyle(color: Colors.white),),
                  SizedBox(height: 5.h,),
                  ListView.separated(
                    shrinkWrap:true ,
                      scrollDirection: Axis.vertical,
                      itemBuilder:(context,index){
                    return ListTile(

                      title:Text('Macbook',style: TextStyle(color: Colors.white),),
                      subtitle: Text("apple",style: TextStyle(color: Colors.white),),
                      trailing: Text('-2900',style: TextStyle(color: Colors.white),),
                    );
                  } ,separatorBuilder: (context,index){
                    return Divider(height: 16.h,);

                  }, itemCount: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
