
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../SubCategory_pages/SubCategory_product.dart';
class TileSitterCategory extends StatelessWidget {
   TileSitterCategory({Key? key}) : super(key: key);
  List<String> imagetry=
  [
    'BV-Acharya-13.jpeg',
    'image/catagar/0205090001-3-Tiles-Installation-Work-Workmanship-shutterstock_411857641.jpeg',
    'images.jpeg',
    'hqdefault.jpeg',
    'download.jpeg',
  ];
  List<String> labelry=[
    'Labor',
    'mistari',
    'Thikedar',
    'machine_work',
    'others'

  ];

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Padding(
             padding: EdgeInsets.only(top: 70),
             child: Text('Tile_setter category',style: TextStyle(
               fontSize: 24.sp,fontWeight: FontWeight.bold,
             ),
             ),
           ),
          
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: SizedBox(
              height:MediaQuery.of(context).size.height*0.62 ,
              width: MediaQuery.of(context).size.width*0.70,

              child:
              GridView.builder(
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 24,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (contex)=> SubCategory(  subCategory: labelry[index])));
                        },
                        child: Column(
                          children: [


                            SizedBox(
                                child: Image( image:
                                AssetImage(imagetry[index]),
                                ),
                    ),

                            Text(labelry[index],style: TextStyle(
                              fontSize: 30,
                            ),),
                          ],
                        ),
                      );

                  }),


              ),
          ),


        ],
      );
  }
}
