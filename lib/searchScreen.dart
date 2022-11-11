
import 'package:chat_apps3/page_display/title_search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScrean extends StatefulWidget {
  const SearchScrean({Key? key}) : super(key: key);

  @override
  State<SearchScrean> createState() => _SearchScreanState();
}

class _SearchScreanState extends State<SearchScrean> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         automaticallyImplyLeading: false,
         title:searchbar(text: 'search hear',

         ) ,
         actions: [
           IconButton(onPressed: (){
             Navigator.pop(context);
           }, icon: Icon(Icons.cancel,color: Colors.black,))
         ],


       ),
    ));
  }
}
