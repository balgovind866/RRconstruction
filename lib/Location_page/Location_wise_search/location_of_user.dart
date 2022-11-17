
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../page_display/title_search_page.dart';

class LocationSearch extends StatefulWidget {
  const LocationSearch({Key? key}) : super(key: key);

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
   late GoogleMapController newgoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title:searchbar(text: 'search hear',

        ) ,
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.cancel,color: Colors.black,))
        ],


      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller)
            {
              _controllerGoogleMap.complete(controller);
              newgoogleMapController=controller;

            }
          ),
        ],
      ),
    ));
  }
}

