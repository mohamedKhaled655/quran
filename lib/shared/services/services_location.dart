import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ServicesLocation{
 
   Future getPostion(BuildContext context)async{
    bool services=false;
    LocationPermission permission;
    services=await Geolocator.isLocationServiceEnabled();

    print("ser= $services");
    if(services==false){
      AwesomeDialog(
        context: context,
        title: "Services",
        body: Container(
          padding: EdgeInsets.all(20),
          child: Text("Services Not Enabled !"),
        ),
      )..show();
    }

    permission=await Geolocator.checkPermission();
    print(permission);
    if(permission==LocationPermission.denied){

      permission=await Geolocator.requestPermission();
      if(permission==LocationPermission.always){
        getLatAndLang();

      }
    }
  }

  

 Future<Position> getLatAndLang()async {

  return await Geolocator.getCurrentPosition().then((value){
    return value;
  });
  
}



}



