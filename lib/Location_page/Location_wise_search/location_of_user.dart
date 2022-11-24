
import 'dart:async';

import 'package:chat_apps3/Location_page/assesitant/AssistantMethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Divider/divider.dart';
import '../../page_display/title_search_page.dart';

class LocationSearch extends StatefulWidget {
  const LocationSearch({Key? key}) : super(key: key);

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch>  {

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
   late GoogleMapController newgoogleMapController;
   GlobalKey<ScaffoldState> scaffoldkey=new GlobalKey<ScaffoldState>();


      late Position currentPosition;
      var geolocator=Geolocator();

  Future<void> locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition=position;
    LatLng latlatPositon=LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition=new CameraPosition(target: latlatPositon,zoom:14);
    newgoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String address= await assistantMethod.searchCoordinateAddress(position);
    print('it is your position $address');
  }
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );




  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: scaffoldkey,
      body: Stack(
        children: [

          GoogleMap(
            mapType: MapType.normal,
              myLocationButtonEnabled: true,
              tiltGesturesEnabled: false,
              initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,

            onMapCreated: (GoogleMapController controller)
            {
              _controllerGoogleMap.complete(controller);
              newgoogleMapController=controller;
              locatePosition();

            }
          ),
          Positioned(

            top: 9,
            left: 9,
            child: GestureDetector(
              onTap: (){


              },
              child: Container(

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                color: Colors.red,
                    boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 8.0,
                    spreadRadius: 0.8,
                    offset: Offset(
                      0.7,0.7
                    )
                  ),

    ]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.menu),
                  radius: 20,
                ),

              ),
            ),
          ),
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 13,),
                      Text("Hi there",style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
                      Text("Where to ?.",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                      SizedBox(height: 13,),
                      searchbar(text: 'Search Drop Off ',) ,
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Icon(Icons.home,color: Colors.grey,size: 40,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add home",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                              Text("Your Living home address",style: TextStyle(fontSize: 10,color: Colors.grey),),

                            ],
                          )
                        ],

                      ),
                      SizedBox(height: 10,),
                      DividerWidget(),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Icon(Icons.work,color: Colors.grey,size: 40,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add work",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                              Text("Your office address",style: TextStyle(fontSize: 10,color: Colors.grey),),

                            ],
                          )
                        ],

                      ),
                      SizedBox(height: 16,),
                      DividerWidget(),


                    ],
                  ),
                ),

              )
          )
        ],

      ),
    ));
  }


}

