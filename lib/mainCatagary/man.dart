import 'package:chat_apps3/mainCatagary/product_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Man_page extends StatefulWidget {
  const Man_page({Key? key}) : super(key: key);

  @override
  State<Man_page> createState() => _Man_pageState();
}

class _Man_pageState extends State<Man_page> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('products')
      .where('maincatag', isEqualTo: 'men')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.data!.docs.isEmpty) {
          return Center(
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
              itemCount: snapshot.data!.docs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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

        /*ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              leading: Image(image: NetworkImage(data['proimages'][0]),),
              title: Text(data['price'].toString()),
              subtitle: Text(data['prodesc'].toString()),
            );
          }).toList(),
        );*/
      },
    );
  }
}


