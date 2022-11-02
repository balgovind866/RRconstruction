import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SearchCategary extends StatefulWidget {
  const SearchCategary({Key? key}) : super(key: key);

  @override
  State<SearchCategary> createState() => _SearchCategaryState();
}

class _SearchCategaryState extends State<SearchCategary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Text('it is search pages') ,
      ),
    );
  }
}
