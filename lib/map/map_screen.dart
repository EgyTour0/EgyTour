import 'dart:collection';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:egytour/map/placesdetails.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../shared/components/components.dart';
import 'destinationstosearch.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
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
  GoogleMapController? _controller;
  Position? position;

  ///collection
  var myMarkers = HashSet<Marker>();

  ///permissions
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

  CameraPosition _kGooglePlex =
      const CameraPosition(target: LatLng(27.0, 31.0), zoom: 6.9);

  Future<void> getLatAndLong() async {
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl.latitude;
    long = cl.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
    );
  }

  /// A queue of markers to keep the stream flowing.

  List<Marker> list = createMarkers(destinations);
  late Position _currentPosition;
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
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              setState(() {
                createMarkers(destinations);
              });
            },
          ),
          Positioned(
            top: 80,
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
                    hintText: 'Enter Address',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1.6),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    contentPadding: const EdgeInsets.only(left: 15, top: 15),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search, color: ButtonAndIconsColor()),
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
            right: 50,
            left: 50,
            child: Center(
              child: Container(
                width: 80,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: MaterialButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlacesDetails()));
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                        cl.latitude, cl.longitude);
                    if (kDebugMode) {
                      print(placemarks[0].street);
                    }
                  },
                  height: 40,
                  color: ButtonAndIconsColor(),
                  child: const FittedBox(
                    child: Text(
                      'GO',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  searchandNavigate() {
    locationFromAddress(searchadder).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(result[0].latitude, result[0].longitude),
        zoom: 10.0,
      )));
    });
  }
}
