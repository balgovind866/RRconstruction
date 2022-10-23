
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pagelogin/add_project.dart';
import '../pagelogin/add_skill.dart';
import '../pagelogin/homepage.dart';

class ButtonNavigation extends StatefulWidget {
   ButtonNavigation({Key? key}) : super(key: key);

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  List pages=[
    Homepage(),
   ProjectAdd(),
    AddSkill(),

  ];
  int currentIndex=0;
  void onTap(int index){
    setState((){
        currentIndex=index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: Color(0xff2C2929),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xff48D1EF),
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.circle,size: 60,),
            label: 'AddProject',


          ),
          BottomNavigationBarItem(icon: Icon(Icons.school),
            label: 'School',
          ),
        ],

      ),
    );
  }
}
