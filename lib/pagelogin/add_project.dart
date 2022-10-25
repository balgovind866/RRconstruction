
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectAdd extends StatefulWidget {
  const ProjectAdd({Key? key}) : super(key: key);

  @override
  State<ProjectAdd> createState() => _ProjectAddState();
}

class _ProjectAddState extends State<ProjectAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Row(children: [
              Container(
                color: Colors.blueGrey.shade100,
                height: MediaQuery.of(context).size.width *0.5,
                width: MediaQuery.of(context).size.width *0.5,
                child: const Center(child: Text('you have not \n\n picked image yet ! ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),),

              )
            ],),
               Padding(
                 padding:EdgeInsets.all(8),
                 child: SizedBox(
                   height: 30.h,
                   child: Divider(
                      color: Colors.yellow,
                     thickness: 1.5,
                    ),
                 ),
               ),
            Padding(
              padding:EdgeInsets.all(8),

              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: textFormDecoration.copyWith(
                  labelText: 'price',
                  hintText: 'price...\$',
                ),
                ),
              ),
            ),

              Padding(
                padding:EdgeInsets.all(8),

                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: textFormDecoration.copyWith(
                    labelText: 'Quantity',
                    hintText: 'Aad quantity',
                  ),
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.all(8),

                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    maxLength: 100,
                    maxLines: 3,
                    decoration: textFormDecoration.copyWith(
                    labelText: 'product name',
                    hintText: 'Enter product name',
                  ),
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.all(8),

                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    maxLength: 800,
                    maxLines: 6,
                    decoration: textFormDecoration.copyWith(
                    labelText: 'product description',
                    hintText: 'Enter product description',
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:Row (
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: FloatingActionButton(onPressed:(){},
              backgroundColor: Colors.yellow,
              child: Icon(
                Icons.photo_library,
                color: Colors.black,
              ),

            ),
          ),
          FloatingActionButton(onPressed:(){},
            backgroundColor: Colors.yellow,
            child: Icon(
               Icons.upload,
              color: Colors.black,
            ),

          ),
        ],

      ),


    );
  }
}
var textFormDecoration=InputDecoration(
  labelText: 'price',hintText: 'price...\$',
  labelStyle: TextStyle(color: Colors.blue),

  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.yellow,width: 1),
      borderRadius: BorderRadius.circular(10)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.indigoAccent,width: 2),
      borderRadius: BorderRadius.circular(10),

  ),
);


