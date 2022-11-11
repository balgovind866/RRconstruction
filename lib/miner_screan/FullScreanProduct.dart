
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreanProduct extends StatefulWidget {
   final List<dynamic> imageList;
   FullScreanProduct({Key? key, required this.imageList}) : super(key: key);

  @override
  State<FullScreanProduct> createState() => _FullScreanProductState();
}

class _FullScreanProductState extends State<FullScreanProduct> {
  PageController _controller=PageController();
  ScrollController _scrollController = ScrollController();
  int index=0;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),),
      ),
      body: Column(

        children: [
          Text('${index+1} / ${widget.imageList.length}',style: TextStyle(
            fontSize: 20,
          ),),
          SizedBox(
            height: size.height*0.5,
            child: imageView(),
          ),
          SizedBox(height: 14,),
          SizedBox(
            height: size.height*0.2,
            child: imageListVeiw(),

          )
        ],
      ),
    );
  }
 Widget imageView(){

    return PageView(
      controller: _controller,
      onPageChanged: (value){
        setState(() {
          index=value;
        });
      },


      physics: PageScrollPhysics(),
      scrollDirection: Axis.horizontal,


      children:List.generate(widget.imageList.length, (index){
        return InteractiveViewer(
            transformationController: TransformationController(),
            child: Image.network(widget.imageList[index]));
      }),

    );
  }

 Widget imageListVeiw(){
    return ListView.builder(
        itemCount: widget.imageList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index)
        {
          return GestureDetector(
            onTap: (){
              _controller.jumpToPage(index);
            },
            child: Container(
              margin: EdgeInsets.all(8),
              width: 120,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(1),
                  border: Border.all(width: 4,color: Colors.yellow)

              ),
              child: Image.network(widget.imageList[index],
                fit: BoxFit.cover,
              ),
            ),
          );

        }
        );

}


}


