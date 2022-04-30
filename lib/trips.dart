import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'Utils.dart';
import 'destinationstosearch.dart';

class trips extends StatefulWidget {
  @override
  _tripsState createState() => _tripsState();
}

class _tripsState extends State<trips> {
  late Position _currentPosition;
  List<Destination> destinationlist = <Destination>[];
  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff2a5885),
        title: const Text("Near By Trips"),
      ),
      body: Container(
          child: destinationlist.isNotEmpty
              ? ListView.builder(
                  itemCount: destinationlist.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(20.0),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 60,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text(destinationlist[index].name),
                              Text(
                                  "${destinationlist[index].distance!.toStringAsFixed(2)} km"),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : const Center(
                  child: CircularProgressIndicator(),
                )),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 70.0,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      size: 30.0,
                    ),
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.list,
                      size: 30.0,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>  fvconst LastTrips(),
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Add to favorites'),
                  Text('view favourites'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // get Current Location
  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      distanceCalculation(position);
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }

  distanceCalculation(Position position) {
    for (var d in destinations) {
      var km = getDistanceFromLatLonInKm(
          position.latitude, position.longitude, d.lat, d.lng);
      // var m = Geolocator.distanceBetween(position.latitude,position.longitude, d.lat,d.lng);
      // d.distance = m/1000;
      d.distance = km;
      destinationlist.add(d);
      // print(getDistanceFromLatLonInKm(position.latitude,position.longitude, d.lat,d.lng));
    }
    setState(() {
      destinationlist.sort((a, b) {
        return a.distance!.compareTo(b.distance!);
      });
    });
  }
}
