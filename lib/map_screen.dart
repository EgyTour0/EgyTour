import 'dart:collection';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:egytour/map/trips.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'destinationstosearch.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  // final int startTime;
  // final int endTime;
  // final int days;
  // final int places;
  //
  // MapScreen(
  //     {required this.startTime,
  //     required this.endTime,
  //     required this.days,
  //     required this.places});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  ///initalizations

  Set<Polygon> polygons = <Polygon>{};
  final Set<Marker> _markers = {};
  late Position cl;
  late bool services;
  late LocationPermission per;
  late GoogleMapController mapController;
  late String searchadder;
  var lat;
  var long;
  // late CameraPosition _kGooglePlex;
  CameraPosition _kGooglePlex = CameraPosition(target: LatLng(0, 0));

  ///collection
  var myMarkers = HashSet<Marker>();

  Future getper() async {
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Location Services',
        desc: 'Please enable location services',
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      ).show();
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per == await Geolocator.requestPermission();
    }
    if (per == LocationPermission.always) {
      getLatAndLong();
    }
  }

  Future<void> getLatAndLong() async {
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl.latitude;
    long = cl.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
    );
  }

  /// A queue of markers to keep the stream flowing.
  Marker marker1 = Marker(
    markerId: const MarkerId('Marker1'),
    position: const LatLng(30.0444, 31.2357),
    infoWindow: const InfoWindow(title: 'Business 1'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  );

  List<Marker> list = createMarkers(destinations);
  @override
  void initState() {
    getper();
    getLatAndLong();
    _kGooglePlex;
    createMarkers(destinations);
    _markers.addAll(list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            GoogleMap(
              markers: Set<Marker>.of(list),
              zoomControlsEnabled: false,
              mapType: MapType.hybrid,
              // onTap: (value) {
              //   _handleTap(value);
              // },
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                setState(() {
                  createMarkers(destinations);
                });
              },
            ),
            Positioned(
              top: 30,
              right: 20,
              left: 20,
              child: Center(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: const Color(0xffffffff),
                      filled: true,
                      hintText: 'Enter Address to start from',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1.6),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      contentPadding: const EdgeInsets.only(left: 15, top: 15),
                      suffixIcon: IconButton(
                        icon:
                            const Icon(Icons.search, color: Color(0xff2a5885)),
                        iconSize: 30,
                        onPressed: () {
                          searchandNavigate();

                          ///i want the search to be done here
                        },
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        searchadder = val;
                      });
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 20,
              left: 20,
              child: Center(
                child: Container(
                  width: 150,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: MaterialButton(
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => trips()));
                      // var distancebetween = Geolocator.distanceBetween(
                      //   cl.latitude,
                      //   cl.longitude,
                      //   27.2158,
                      //   31.3264,
                      // );
                      // print(distancebetween / 1000);
                      // print(cl.latitude);
                      // print(cl.longitude);
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(
                              cl.latitude, cl.longitude);
                      print(placemarks[0].locality);
                      // showModalBottomSheet<void>(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return Column(
                      //       children: [
                      //         ElevatedButton(
                      //           child: const Icon(Icons.close),
                      //           onPressed: () => Navigator.pop(context),
                      //           style: ElevatedButton.styleFrom(
                      //             primary: const Color(0xff2a5885),
                      //           ),
                      //         ),
                      //       ],
                      //     );
                      //   },
                      // );
                    },
                    height: 50,
                    color: const Color(0xff2a5885),
                    child: const FittedBox(
                      child: Text(
                        'Create Trip ♥',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffedeef0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],

          ///gps button
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: const Color(0xff2a5885),
          //   onPressed: () {
          //     // getCurrentLocation();
          //   },
          //   child: const Icon(
          //     Icons.gps_fixed_outlined,
          //     color: Color(0xffedeef0),
          //   ),
          //   // onPressed: () {
          //   //   Navigator.push(
          //   //     context,
          //   //     MaterialPageRoute(builder: (context) => const FilterScreen()),
          //   //   );
          //   // },
          // ),
        ));
  }

  searchandNavigate() {
    locationFromAddress(searchadder).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(result[0].latitude, result[0].longitude),
        zoom: 10.0,
      )));
    });
  }

  ///drop pin on map
  // void _handleTap(LatLng tappedPoint) {
  //   setState(() {
  //     createMarkers(destinations).add(
  //       Marker(
  //         markerId: MarkerId(tappedPoint.toString()),
  //         position: tappedPoint,
  //         draggable: true,
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //         onDragEnd: (dragEndPosition) {
  //           print(dragEndPosition);
  //         },
  //       ),
  //     );
  //   });
  // }
}
