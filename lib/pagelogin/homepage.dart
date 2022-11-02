import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../mainCatagary/all_maincatagary.dart';
import '../mainCatagary/man.dart';
import '../mainCatagary/shoes_pages.dart';
import '../mainCatagary/woman_paga.dart';
import 'add_project.dart';
import 'add_skill.dart';
import 'homePage_component/MenuPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  bool iscollapsed = true;
  double? screanWidth, screanHeight;
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  Animation<Offset>? _slideAnimation;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller!);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

//it is use for logout buttom
  final _googleSignIn = GoogleSignIn();

  void Logout() async {
    await _googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screanHeight = size.height;
    screanWidth = size.width;
    return Scaffold(
      backgroundColor: Color(0xff514949),
      body: Stack(
        children: <Widget>[
          MenuPage(_slideAnimation),
          dashbord(context),
        ],
      ),
    );
  }

//for navaget to other page use in the TabBar
  int currentIndex = 0;

  List pages = [
    Man_page(),
    WomanPage(),
    ShowesPage(),
  ];
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget dashbord(context) {
    return AnimatedPositioned(
      duration: Duration(seconds: 1),
      top: 0,
      right: iscollapsed ? 0 : -0.4 * screanWidth!,
      bottom: 0,
      left: iscollapsed ? 0 : 0.6 * screanWidth!,
      child: ScaleTransition(
          scale: _scaleAnimation!,
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            elevation: 8,
            color: Color(0xff514949),
            //it is use for appb
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white54,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: CupertinoSearchTextField(),
                  leading: InkWell(
                    hoverColor: Color(0xff48D1EF),
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onTap: () {
                      setState(() {
                        if (iscollapsed) {
                          _controller?.forward();
                        } else {
                          _controller!.reverse();
                        }
                        iscollapsed = !iscollapsed;
                      });
                    },
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notification_add,
                          color: Colors.black,
                        ))
                  ],
                  bottom: TabBar(
                    onTap: onTap,
                    isScrollable: true,
                    controller: _tabController,
                    tabs: [
                      RepeatedTab(
                        label: 'man',
                      ),
                      RepeatedTab(
                        label: 'woman',
                      ),
                      RepeatedTab(
                        label: 'shoes',
                      ),
                      RepeatedTab(
                        label: 'woman',
                      ),
                      RepeatedTab(
                        label: 'woman',
                      ),
                      RepeatedTab(
                        label: 'woman',
                      ),
                      RepeatedTab(
                        label: 'woman',
                      ),
                      RepeatedTab(
                        label: 'woman',
                      ),
                    ],
                  ),
                ),
                body: pages[currentIndex],
              ),
            ),
          )),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
