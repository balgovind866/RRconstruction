import 'package:chat_apps3/Location_page/assesitant/requestAssistant.dart';
import 'package:chat_apps3/googleMapKey/googlekey.dart';
import 'package:geolocator/geolocator.dart';

class assistantMethod{
   static Future<String> searchCoordinateAddress(Position position) async {
     print(position);
     String placeAddress='';
     var url='https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&key=AIzaSyBCbZt1oLuKnYjEEvDUgIymaCx9Ut-gWVo';
      var reponse =await RequestAssistant.getrequest(url);
      print(reponse);
      if(reponse!='Failed')
        {
          placeAddress=reponse['results'][0]['formatted_address'];
        }
      return placeAddress;
  }

}
