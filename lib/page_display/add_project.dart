import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

class ProjectAdd extends StatefulWidget {
  const ProjectAdd({Key? key}) : super(key: key);

  @override
  State<ProjectAdd> createState() => _ProjectAddState();
}

class _ProjectAddState extends State<ProjectAdd> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scafoldkey =
      GlobalKey<ScaffoldMessengerState>();

  double? price = 0.0;
  int? Quantity = 0;
  String? dropdownValue=' ';
  String? product_name = '';
  String? description = '';
  String? produuid;
  bool prograces=false;
  List<String> catag=[
    'catagory',

        'Tile_setter',
        'Brick_mason',
        'carpenter',
        'Plumber',
        'Painter',
        'Electrician',
        'Pipefitter',
        'Safety',
        'Construction',
        'Construction',
        'civil engineer',
        'welding work',
  ];
  List<String> catagTile_setter=[
    'subcategory',
    'Labor',
    'Thikedar',
    'mistari',
    'machine_work',
    'others',

  ];
  List<String> catagWoman=[
    'subcategory',
    'w shrit',
    'w jacket',
    'w jeans',
    'w pant',

  ];
  List<String> catagshoes=[
    'subcategory',
    's shrit',
    's jacket',
    's jeans',
    's pant',

  ];
  List<String> catagbags=[
    'subcategory',
    'b shrit',
    'b jacket',
    'b jeans',
    'b pant',

  ];
  List<String> monthlist=[
    'substing',
    'b shrit',
    'b jacket',
    'b jeans',
    'b pant',

  ];
  String? maincatagValue='catagory';
  String? mainsubvalue='subcategory';
  List<String> subCategList=[];


  Future<void> uploadImage() async {
    try{
      if (_formkey.currentState!.validate()) {

        _formkey.currentState?.save();
        setState(() {
          prograces=true;
        });

          for(var image in imagesFileList!){
            firebase_storage.Reference ref=firebase_storage
                .FirebaseStorage.instance.ref('products/${path.basename(image.path)}');
            await ref.putFile(File(image.path)).whenComplete(()async{
              await ref.getDownloadURL().then((value){
                imagesUrlList?.add(value);
              });

            });

          }

        print('valid all requerment');
        print(price);
        print(Quantity);
        print(product_name);
        print(description);
      } else {
        _scafoldkey.currentState?.showSnackBar(SnackBar(
          content: Text(
            'fill all the requarment ',
            style: TextStyle(color: Colors.black),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.yellow,
        ));
      }
    }catch(e){print(e);}


  }
  Future<void> uploaddata() async {

      produuid= const Uuid().v4();
      CollectionReference productRef=FirebaseFirestore.instance.collection('products');
      await productRef.doc(produuid).set({
          'proimages':imagesUrlList,

          'proId':produuid,
          'maincatag':maincatagValue,
          'subcateg':mainsubvalue,
          'price':price,
          'instock':Quantity,
          'proname': product_name,
          'prodesc':description,
          'sid':FirebaseAuth.instance.currentUser!.uid,

          'proimages':imagesUrlList,
          'discount':0,
      }).whenComplete(() {
        setState(() {
          prograces=false;
          imagesFileList=[];
          maincatagValue='catagory';
          subCategList=[];
          imagesUrlList=[];
        });
        _formkey.currentState?.reset();
        _scafoldkey.currentState?.showSnackBar(SnackBar(
          content: Text(
            'your form is sucessfully submit ',
            style: TextStyle(color: Colors.black),
          ),
          duration: Duration(seconds: 10),
          backgroundColor: Colors.yellow,
        ));
      }

        );



  }



  Future<void> uploadproduct() async {
      await uploadImage().whenComplete(() => uploaddata());

  }

  final ImagePicker _picker = ImagePicker();
  List<XFile>? imagesFileList = [];

  List<String>? imagesUrlList=[

  ];
  dynamic _pickedImageError;

  void pickProductImages() async {
    try {
      final pickedImages = await _picker.pickMultiImage(
          maxHeight: 400, maxWidth: 400, imageQuality: 95);
      setState(() {
        imagesFileList = pickedImages;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      print(_pickedImageError);
    }
  }

  Widget previewImages(){
    if (imagesFileList!.isNotEmpty) {
      return ListView.builder(
          itemCount: imagesFileList!.length,
          itemBuilder: (context, index) {
            return Image.file(File(imagesFileList![index].path));
          });
    } else {

      return const Center(
          child: const Center(
        child: Text(
          ' if you have\n\n post image here!\n\n it is not mandetary ',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return ScaffoldMessenger(
      key: _scafoldkey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Contect here:-8318520053',style: TextStyle(color:
            Colors.black),),
          ),
          body: SingleChildScrollView(
            reverse: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(children: [
                        Container(
                          color: Colors.blueGrey.shade100,
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: imagesFileList != null
                              ? previewImages()
                              : const Center(
                                  child: Text(
                                    'if have image  \n\n picked here image !\n\n it is not mandatary',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                        ),

                      ]),
                      SizedBox(
                        height: size.width * 0.5,
                        width: size.width * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(children: [Text('* select Maincatagory',style: TextStyle(color: Colors.red)),
                              DropdownButton(
                                  iconSize: 50.sp,
                                  iconEnabledColor: Colors.red,

                                  dropdownColor: Colors.yellow,
                                  menuMaxHeight: 500,

                                  value: maincatagValue,
                                  items: catag.map<DropdownMenuItem<String>>((value){
                                    return DropdownMenuItem(child: Text(value),
                                      value: value,
                                    );
                                  }).toList(), onChanged: (String? value){
                                if(value=='Tile_setter')
                                {
                                  subCategList=catagTile_setter;
                                }else if(value=='Brick_mason')
                                {
                                  subCategList=catagWoman;
                                }
                                else if(value=='shoes')
                                {
                                  subCategList=catagshoes;
                                }
                                else if(value=='bags')
                                {
                                  subCategList=catagbags;
                                }
                                print(value);
                                setState(() {
                                  this.maincatagValue=value;
                                  mainsubvalue='subcategory';
                                });

                              }),
                            ]),

                            Column(
                                children:[
                                  Text('* select subcatagory',style: TextStyle(color: Colors.red),),

                                  DropdownButton(
                                      iconSize: 40.sp,
                                      iconEnabledColor: Colors.red,
                                      dropdownColor: Colors.yellow,
                                      menuMaxHeight: 500,
                                      disabledHint: Text('subcategory'),
                                      value:mainsubvalue ,
                                      items:  subCategList.map<DropdownMenuItem<String>>((value){
                                        return DropdownMenuItem(child: Text(value),
                                          value: value,
                                        );
                                      }).toList(), onChanged: (String? Value){
                                    print(Value);
                                    setState(() {
                                      mainsubvalue=Value;
                                    });

                                  }),
                                ]),

                          ],

                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      height: 30.h,
                      child: Divider(
                        color: Colors.yellow,
                        thickness: 1.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter the project cost";
                          } else if (value.isValidQuantity() != true) {
                            return 'not valid quantity';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          price = double.parse(value!);
                        },
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: textFormDecoration.copyWith(
                          labelText: 'projct cost ',
                          hintText: 'price...\$',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " submation of time";
                          } else if (value.isValidQuantity() != true) {
                            return 'not valid time';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          Quantity = int.parse(val!);
                        },
                        keyboardType: TextInputType.number,
                        decoration: textFormDecoration.copyWith(
                          labelText: 'submation date',
                          hintText: 'Aad quantity',
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        onSaved: (value) {
                          product_name = value;
                        },
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
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        onSaved: (value) {
                          description = value;
                        },
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
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: FloatingActionButton(
                  onPressed:  imagesFileList!.isEmpty
                      ? () {
                          pickProductImages();
                        }
                      : () {
                          setState(() {
                            imagesFileList = [];
                          });
                        },
                  backgroundColor: Colors.yellow,

                  child: imagesFileList!.isEmpty
                      ? Icon(
                          Icons.photo_library,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.delete_forever,
                          color: Colors.black,
                        ),
                ),
              ),
              FloatingActionButton(
                onPressed:  uploadproduct,
                backgroundColor: Colors.yellow,
                child:prograces==true? CircularProgressIndicator(
                  color: Colors.black,
                )
                : Icon(
                  Icons.upload,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


var textFormDecoration = InputDecoration(
  labelText: 'price',
  hintText: 'price...\$',
  labelStyle: TextStyle(color: Colors.blue),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.yellow, width: 1),
      borderRadius: BorderRadius.circular(10)),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.indigoAccent, width: 2),
    borderRadius: BorderRadius.circular(10),
  ),
);

extension QuantityValidator on String {
  bool isValidQuantity() {
    return RegExp(r'^((([1-9][0-9]*[\.]*)||([0][\.]*))([0-9]{1,2}))$')
        .hasMatch(this);
  }
}
