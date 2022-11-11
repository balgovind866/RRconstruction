import 'package:chat_apps3/page_display/title_search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../catagories/TileSetter.dart';
List<ItemData> item = [
  ItemData(label: 'Tile_setter'),
  ItemData(label: 'Brick_mason'),
  ItemData(label: 'carpenter'),
  ItemData(label: 'Plumber'),
  ItemData(label: 'Painter'),
  ItemData(label: 'Electrician'),
  ItemData(label: 'Pipefitter'),
  ItemData(label: 'Pipefitter'),
  ItemData(label: 'Safety'),
  ItemData(label: 'Construction'),
  ItemData(label: 'civil engineer'),
  ItemData(label: 'welding work'),
];

class SearchCategary extends StatefulWidget {
  const SearchCategary({Key? key}) : super(key: key);

  @override
  State<SearchCategary> createState() => _SearchCategaryState();
}

class _SearchCategaryState extends State<SearchCategary> {
  final PageController _controller=PageController();
  void initState(){

    for (var element in item) {
      element.isSelected = false;
    }
    setState(() {
      item[0].isSelected = true;
    });
  }





  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: searchbar(
            text: 'what you looking for ?',
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: sideNavigatio(Size),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: catagView(Size),
            ),
          ],
        ),
      ),
    );
  }

  Widget sideNavigatio(Size Size) {
    return SizedBox(
      height: Size.height * 0.73,
      width: Size.width * 0.22,
      child: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(index,  duration: Duration(milliseconds: 200), curve:Curves.easeInCirc);
               // _controller.jumpToPage(index);
                /*for (var element in item) {
                  element.isSelected = false;
                }

                setState(() {
                  item[index].isSelected = true;
                });*/
              },
              child: Container(
                color: item[index].isSelected == true
                    ? Colors.white
                    : Colors.grey.shade400,
                height: 100,
                child: Center(
                  child: Text(
                    item[index].label!,
                    maxLines: 1,
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget catagView(Size Size) {
    return Container(
      height: Size.height * 0.8,
      width: Size.width * 0.78,
      color: Colors.white,
      child: PageView(
        controller: _controller,
        onPageChanged: (value) {
          for (var element in item) {
            element.isSelected = false;
          }
          setState(() {
            item[value].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: [
          TileSitterCategory() ,
          Center(child: Text('Brick_mason')),
          Center(child: Text('carpenter')),
          Center(child: Text('Plumber')),
          Center(child: Text('Tile_setter')),
          Center(child: Text('Tile_setter')),
          Center(child: Text('Tile_setter')),
          Center(child: Text('Tile_setter')),
          Center(child: Text('Tile_setter')),
          Center(child: Text('Tile_setter')),
          Center(child: Text('Tile_setter')),
          Center(child: Text('Tile_setter')),
        ],
      ),
    );
  }
}

class ItemData {
  String? label;
  bool? isSelected;
  ItemData({@required this.label, this.isSelected = false});
}
