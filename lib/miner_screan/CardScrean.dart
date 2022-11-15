
import 'package:chat_apps3/page_display/search_categary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigationpages/button_navigation.dart';
import '../provider_page/card_class.dart';
class CardScrean extends StatefulWidget {
  const CardScrean({Key? key}) : super(key: key);

  @override
  State<CardScrean> createState() => _CardScreanState();
}

class _CardScreanState extends State<CardScrean> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,

        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,)),
        title: Text('Cart', style: TextStyle(color: Colors.black),),
        actions: [
          Provider.of<Cart>(context,listen: false).getItems.isEmpty ? const SizedBox():
          IconButton(onPressed: () {
            showDialog<void>(
                  context: context,

                  // false = user must tap button, true = tap outside dialog
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: Text('Card'),
                      content: Text('if you want to delet the selected Card then pressed ok'),
                      actions: <Widget>[
                        TextButton(onPressed: (){
                         Navigator.pop(context);
                        }, child: Text(
                          'Cancel'
                        )),
                        TextButton(
                          child: Text('ok'),
                          onPressed: () {
                            context.read<Cart>().clearCart();
                            Navigator.pop(context);
                            // Dismiss alert dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete, color: Colors.black,))
        ],
      ),
      body: Provider
          .of<Cart>(context, listen: true)
          .getItems
          .isNotEmpty ?
      Consumer<Cart>(builder: (context, card, child) {
        return ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),

            itemCount: card.count,

            itemBuilder: (contaxt, index) {
              return Card(
                margin: EdgeInsets.all(8),

                child:
                SizedBox(
                  height: 150,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 120,
                        child: Image.network(
                          card.getItems[index]?.imgagesUrl?.first ?? [],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              card.getItems[index]?.name.toString() ?? '',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  card.getItems[index].price.toString(),
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.09,),

                                Container(
                                  width: 120, height: 30,
                                  decoration: BoxDecoration
                                    (
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      card.getItems[index].qty == 1
                                          ? IconButton(onPressed: () {
                                        card.removed(card.getItems[index]);
                                      }, icon: Icon(Icons.delete, size: 15,))
                                          : IconButton(onPressed: () {
                                        card.decrement(card.getItems[index]);
                                      },
                                          icon: Icon(
                                            Icons.exposure_minus_1, size: 15,)
                                      ),
                                      Text(card.getItems[index].qty.toString()),
                                      IconButton(onPressed: () {
                                        card.increment(card.getItems[index]);
                                      }, icon: Icon(Icons.plus_one, size: 15,)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }) : Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'YOU ARE NOT ADD PROJECT!', style: TextStyle(color: Colors.black),


            ),
            ElevationButton(text: 'go to add project ', functionApply: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ButtonNavigation()));
            },),
          ],
        ),


      ),
      bottomSheet:
      Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                Text('Totel: \$',
                  style: TextStyle(fontSize: 18),
                ),
                Text('00.0', style: TextStyle(fontSize: 18),),
              ],

            ),

            ElevationButton(text: 'add project', functionApply: () {},),
          ],

        ),

      ),


    );
  }
}



class ElevationButton extends StatelessWidget {
  String text;
  final VoidCallback functionApply;
  
   ElevationButton({Key? key,required this.text,required this.functionApply, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: functionApply,
      child: Text(text),
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

    );;
  }
}


