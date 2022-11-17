
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Location_page/Location_wise_search/location_of_user.dart';
import '../page_display/add_project.dart';
import '../page_display/homePage_component/homepage.dart';
import '../page_display/search_categary.dart';


class ButtonNavigation extends StatefulWidget {
   ButtonNavigation({Key? key}) : super(key: key);

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  List pages=[
    Homepage(),
    SearchCategary(),
    ProjectAdd(),
    LocationSearch(),
    LocationSearch(),
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
        type: BottomNavigationBarType.fixed,

        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: Color(0xff2C2929),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xff48D1EF),
        unselectedItemColor: Colors.white,
        selectedFontSize: 16,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
          ),



          BottomNavigationBarItem(icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle,size: 40,),
            label: 'Project',



          ),
          BottomNavigationBarItem(icon: Icon(Icons.location_on,),
              label: 'location',),
              BottomNavigationBarItem(icon: Icon(Icons.person_add_alt,),
            label: 'user',)
        ],

      ),
    );
  }
}
