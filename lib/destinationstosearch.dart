import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Destination {
  double lat;
  double lng;
  MarkerId markerId;
  String name;
  double? distance;
  BoxDecoration? decoration;
  Image? image;
  Destination(this.lat, this.lng, this.name, this.markerId,
      {this.distance, this.decoration, this.image});
}

var destinations = [
  Destination(
    30.0444,
    31.2357,
    "Cairo",
    const MarkerId("اسيوط الجديده"),
  ),
  Destination(
    26.5499,
    31.700001,
    "الجيزه",
    const MarkerId("الجيزه"),
  ),
  Destination(
    27.4259071,
    31.1095606,
    "المنصوره",
    const MarkerId("المنصوره"),
  ),
  Destination(
    27.1112121705,
    31.167012924131,
    " الشروق",
    const MarkerId('  الشروق'),
  ),
  Destination(
    27.7586968,
    31.3053474,
    "المتحف القومى",
    const MarkerId("المتحف القومى"),
  ),
  Destination(
    27.4444445,
    30.81666730,
    "الشرقيه",
    const MarkerId("الشرقيه"),
  ),
  Destination(
    27.5206515,
    31.064364,
    "شرم الشيخ",
    const MarkerId("شرم الشيخ"),
  ),
  Destination(
    27.5206515,
    31.064364,
    "شرم الشيخ",
    const MarkerId("شرم الشيخ"),
  ),
  Destination(
    27.5206515,
    31.064364,
    "شرم الشيخ",
    const MarkerId("شرم الشيخ"),
  ),
  Destination(
    27.5206515,
    31.064364,
    "شرم الشيخ",
    const MarkerId("شرم الشيخ"),
  ),
  Destination(
    27.5206515,
    31.064364,
    "شرم الشيخ",
    const MarkerId("شرم الشيخ"),
  ),
  Destination(
    27.5206515,
    31.064364,
    "شرم الشيخ",
    const MarkerId("شرم الشيخ"),
  ),
  Destination(
    27.5206515,
    31.064364,
    "شرم الشيخ",
    const MarkerId("شرم الشيخ"),
  ),
  Destination(
    27.5206515,
    31.064364,
    "شرم الشيخ",
    const MarkerId("شرم الشيخ"),
  ),
  Destination(
    27.5206515,
    31.064364,
    "شرم الشيخ",
    const MarkerId("شرم الشيخ"),
  ),
];

///create list of markers for the tourism places  in the map  to be used in the map
List<Marker> createMarkers(List<Destination> destinations) {
  List<Marker> markers = <Marker>[];
  for (Destination destination in destinations) {
    markers.add(Marker(
      markerId: destination.markerId,
      position: LatLng(destination.lat, destination.lng),
      infoWindow: InfoWindow(
        title: destination.name,
        snippet: destination.distance != null
            ? "المسافه الكليه : ${destination.distance} متر"
            : "",
      ),
    ));
  }
  return markers;
}
