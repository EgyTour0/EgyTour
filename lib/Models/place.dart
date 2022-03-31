import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  late String name;
  late LatLng coords;

  Place({required this.name,required this.coords});

  Place fromJson(){

    return Place(
    name:"",
    coords:LatLng(11,22),
    );
  }

  Place fromDoc(Object object){

    return fromJson();
  }


}