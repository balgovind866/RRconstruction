import 'package:chat_apps3/mainCatagary/product_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TileSetter extends StatefulWidget {
  const TileSetter({Key? key}) : super(key: key);

  @override
  State<TileSetter> createState() => _TileSetterState();
}

class _TileSetterState extends State<TileSetter> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('products')
      .where('maincatag', isEqualTo: 'Tile_setter')
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
