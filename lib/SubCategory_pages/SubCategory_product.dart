
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubCategory extends StatelessWidget {
  final String subCategory;

  SubCategory({Key? key, required this.subCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back,color:  Colors.black,),
        ),
      ),
      body:
      Center(child: Text(subCategory)),
    );
  }
}


