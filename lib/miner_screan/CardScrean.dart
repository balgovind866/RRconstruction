


import 'package:chat_apps3/page_display/search_categary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider_page/card_class.dart';

class CardScrean extends StatefulWidget {
  const CardScrean({Key? key}) : super(key: key);

  @override
  State<CardScrean> createState() => _CardScreanState();
}

class _CardScreanState extends State<CardScrean> {
  var index=0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text('Cart'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:Icon(Icons.delete))
        ],
      ),
      body: Consumer<Cart>(builder: (context,card ,child){
          return ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
            itemCount: card.count?.compareTo(0),

              itemBuilder: (contaxt,index){


                return Card(

                    child:
                    SizedBox(
                      height: 100,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 120,
                              child: Image.network(
                                card.getItems[index].imgagesUrl?.first
                              ),
                            ),
                            Text(
                              card.getItems[index].name.toString(),
                            ),
                          ],
                        ),
                    ),
                );

          });

    }),

    );
  }
}

class YourWidget {


}
