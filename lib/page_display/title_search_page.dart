
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class searchbar extends StatelessWidget {
  String? text;
   searchbar({this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow, width: 1.4),
        borderRadius: BorderRadius.circular(25.h),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
      const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Icon(
        Icons.search,
        color: Colors.grey,
      ),
    ),
            Text(text!,
        style: TextStyle(color: Colors.grey, fontSize: 16),
    ),
    Padding(
    padding: const EdgeInsets.all(0),
    child: Container(
    height: MediaQuery.of(context).size.height*0.32,
    width: MediaQuery.of(context).size.width*0.23,
    decoration: BoxDecoration(
    color: Colors.yellow,
    borderRadius: BorderRadius.circular(25),
    ),
    child: const Center(
    child: Text(
    'search',
    style: TextStyle(color: Colors.grey, fontSize: 16),
    ),
    ),
    ),
    ),
    ]
    )
    );

  }
}
