
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class allcategry extends StatefulWidget {
  const allcategry({Key? key}) : super(key: key);

  @override
  State<allcategry> createState() => _allcategryState();
}

class _allcategryState extends State<allcategry> {


  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(left: 16.h, right: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 250.h,
                child: PageView(
                  controller: PageController(viewportFraction: 0.8),
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.redAccent,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.indigoAccent,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.deepPurpleAccent,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Transactions',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 5.h,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ListTile(

                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 16.h,
                    );
                  },
                  itemCount: 10),
            ],
          ),
        ),
      );
  }
}
