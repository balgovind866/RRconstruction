
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../signpage/phoneverficationpage.dart';
import 'homepage.dart';


class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage( image: AssetImage('image/48767803158_840238786f_c.jpeg'),
         fit: BoxFit.cover,
          ),


      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 90.h),
          Container(
            width: 149.w,
            height: 138.h,

            decoration: BoxDecoration(
              image: DecorationImage( image: AssetImage('image/1666267752454.ico'),
              ),

          ),
          ),
          Text('RAJA RAM',

            style: TextStyle(
              decoration: TextDecoration.none,
            fontSize: 40.sp,
              color: Color(0xff48D1EF),
              fontWeight: FontWeight.w400,
          ),),
          Text('CONSTRACTION APPLICATION',style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 20.sp,
            color: Color(0xffF5F5F5),
          ),),
          SizedBox(height: 190.h),
          Padding(padding: EdgeInsets.symmetric(horizontal:31.w,),
              child: ElevatedButton(onPressed: () {


              }, child:
              
                 Row(
                   children: [
                     Container(
                       width: 56.w,
                       height: 53.h,

                       decoration: BoxDecoration(
                 image: DecorationImage( image: AssetImage('image/phone.png'),
              ),
                       ),
                     ),
                     SizedBox(width: 25.w,),
                     Text('Enter the number',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        )
                ),
                   ],
              ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff48D1EF),
                    minimumSize: Size(333.w, 62.h),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                  ),

                ),
              ),
            ),
          SizedBox(height: 30.h,),
          Padding(padding: EdgeInsets.symmetric(horizontal:31.w,),
            child: ElevatedButton(onPressed: () async{
               
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()));

            },
              child:


            Row(
              children: [
                Container(
                  width: 56.w,
                  height: 53.h,

                  decoration: BoxDecoration(
                    image: DecorationImage( image: AssetImage('image/pngegg.png'),
                    ),
                  ),
                ),
                SizedBox(width: 25.w,),
                Text('Sign with Google',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    )
                ),
              ],
            ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff48D1EF),
                minimumSize: Size(333.w, 62.h),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}


