  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget MenuPage(_slideAnimation) {
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
