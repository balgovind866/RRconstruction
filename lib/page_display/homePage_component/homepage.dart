import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Location_page/Location_wise_search/location_of_user.dart';
import '../../mainCatagary/Tile_Setter_page.dart';
import '../../mainCatagary/shoes_pages.dart';
import '../../mainCatagary/woman_paga.dart';
import '../../searchScreen.dart';
import '../title_search_page.dart';
import 'MenuPage.dart';

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
    _tabController = TabController(length: 11, vsync: this);

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
          MenuPage(_slideAnimation,context),
          dashbord(context),

        ],
      ),
    );
  }

//for navaget to other page use in the TabBar
  int currentIndex = 0;

  List pages = [
    TileSetter(),
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
            elevation: 4,
            color: Color(0xff514949),
            //it is use for appb
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white54,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title:
                  InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScrean()));
                  },

                  child:
                  searchbar( text: 'search hear',)
                  ),
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
                        label: 'Tile_setter',
                      ),
                      RepeatedTab(
                        label: 'Brick_mason',
                      ),
                      RepeatedTab(
                        label: 'carpenter',
                      ),
                      RepeatedTab(
                        label: 'Plumber',
                      ),
                      RepeatedTab(
                        label: 'Painter',
                      ),
                      RepeatedTab(
                        label: 'Electrician',
                      ),
                      RepeatedTab(
                        label: 'Pipefitter',
                      ),
                      RepeatedTab(
                        label: 'Safety',
                      ),
                      RepeatedTab(
                        label: 'Construction',
                      ),
                      RepeatedTab(
                        label: 'civil engineer',
                      ),
                      RepeatedTab(
                        label: 'welding work',
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
/*'Tile_setter'
'Brick_mason'
'carpenter'
'Plumber'
'Painter'
'Electrician'
'Pipefitter'
'Safety'
'Construction'
'Construction'
'civil engineer'
'welding work'*/
