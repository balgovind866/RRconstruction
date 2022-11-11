import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../mainCatagary/product_item.dart';
import '../miner_screan/FullScreanProduct.dart';

class ProductDetailscrean extends StatefulWidget {
  final dynamic proList;
  const ProductDetailscrean({Key? key,required this.proList}) : super(key: key);


  @override
  State<ProductDetailscrean> createState() => _ProductDetailscreanState();
}

class _ProductDetailscreanState extends State<ProductDetailscrean> {


  late List<dynamic> imageList=widget.proList['proimages'];



  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('products')
        .where('maincatag', isEqualTo: widget.proList['maincatag']).where('subcateg',isEqualTo: widget.proList['subcateg'])
        .snapshots();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,

            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreanProduct( imageList: imageList,)));
                    },
                    child: Stack(
                      children: [

                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Container(
                          color: Colors.grey,
                          child: Swiper(

                            itemCount: imageList.length,
                            pagination:
                                SwiperPagination(builder: SwiperPagination.dots,),
                            itemBuilder: (context, index) {
                              return Image(
                                image:NetworkImage(imageList[index]));

                            },
                          ),
                        ),
                      ),
                        Positioned(
                          left: 10,
                          top: 10,
                          child:  CircleAvatar(
                            backgroundColor: Colors.yellow.shade300,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black,
                                size: 15,
                              ),
                            ),
                          ),

                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child:  CircleAvatar(
                            backgroundColor: Colors.yellow.shade300,
                            child: IconButton(
                              onPressed: () {

                              },
                              icon: Icon(
                                Icons.share,
                                color: Colors.black,
                                size: 15,
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  test(
                    testvalue: widget.proList['maincatag'],
                    colors: Colors.grey,
                    size: 40,
                  ),
                  SizedBox(height: 5.h,),
                  test(
                    testvalue:('yeh work ye log kar sakate hai :--')+ widget.proList['subcateg'],
                    colors: Colors.grey,
                  ),
                  SizedBox(height: 5.h,),
                  test(
                    testvalue:('submit data of project:-')+ widget.proList['instock'].toString()+('  Month'),
                    colors: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      test(
                        testvalue:('lagbhag Price  :--')+ ('\₹')+widget.proList['price'].toStringAsFixed(2) ,
                        colors: Colors.red,
                        size: 19.sp,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          size: 30,
                        ),
                        color: Colors.red,
                      ),
                    ],
                  ),

                  test(
                   testvalue: widget.proList['proname'],

                    colors: Colors.grey,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  divider(
                    Description: 'project Description',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  test(
                      testvalue:
                      widget.proList['prodesc'],
                      colors: Colors.grey),
                  SizedBox(
                    height: 12,
                  ),
                  divider(
                    Description: 'related project',
                  ),
                  SizedBox(child: StreamBuilder<QuerySnapshot>(
                              stream: _usersStream,
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text('Something went wrong');
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }
                            if (snapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text(
                                  'this catagory \n\n as no item yet !',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }
                            return Padding(
                              padding: EdgeInsets.all(12),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),

                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data!.docs.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 24,
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Productitem(
                                      product: snapshot.data!.docs[index],
                                    );
                                  }),
                            );
                          }
                          ),
                  ),
                ],
              ),
            ),

          ),
        ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.countertops)),
            IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
            ElevatedButton(
              onPressed: (){},
                child: Text('add project',),


              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 40,vertical: 8),),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow.shade300),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        
                      ),
                  ),
              ),
            ),
          ],
        ),
      ),

    );
  }
  }

class YellowButtom {

}


class test extends StatelessWidget {
  final String testvalue;
  final Color colors;
  double? size = 16.sp;
  test({Key? key, required this.testvalue, required this.colors, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      testvalue,
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(fontSize: size, color: colors, fontWeight: FontWeight.w600),
    );
  }
}

class divider extends StatelessWidget {
  final String Description;

  const divider({Key? key, required this.Description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 70.w,
          child: Divider(
            color: Colors.yellow.shade900,
            thickness: 1,
          ),
        ),
        test(
          testvalue: Description,
          colors: Colors.yellow.shade900,
          size: 20.sp,
        ),
        SizedBox(
          width: 70.w,
          child: Divider(
            color: Colors.yellow.shade900,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
