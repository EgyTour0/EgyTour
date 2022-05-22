import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'Utils.dart';
import 'destinationstosearch.dart';

class PlacesDetails extends StatefulWidget {
  const PlacesDetails({Key? key}) : super(key: key);

  @override
  _PlacesDetailsState createState() => _PlacesDetailsState();
}

class _PlacesDetailsState extends State<PlacesDetails> {
  late Position _currentPosition;
  late int _currentindex;
  List<Destination> destinationlist = <Destination>[];
  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  int dist = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              child: destinationlist.isNotEmpty
                  ? PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration:
                                        destinationlist[index].decoration,
                                    height: 250,
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Expanded(
                                                child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Colors.amberAccent,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: IconButton(
                                                        icon: const Icon(
                                                          Icons.arrow_back,
                                                          color: Colors.black,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.white,
                                                          size: 35,
                                                        )),
                                                  ],
                                                )
                                              ],
                                            )),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const Icon(
                                                Icons.location_on,
                                                color: Colors.amberAccent,
                                                size: 30.0,
                                              ),
                                              Text(
                                                destinationlist[index]
                                                    .distance
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      destinationlist[index].name,
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Text(
                                        destinationlist[index].description,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.call,
                                            size: 30,
                                            color: Colors.amberAccent),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          destinationlist[index]
                                              .phonenumber
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.access_time,
                                            size: 30,
                                            color: Colors.amberAccent),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "opens at " +
                                              destinationlist[index]
                                                  .timeopens
                                                  .toString() +
                                              " am",
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "closes at " +
                                              destinationlist[index]
                                                  .timecloses
                                                  .toString() +
                                              " pm",
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                            Icons.directions_car_outlined,
                                            size: 30,
                                            color: Colors.amberAccent),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          destinationlist[index]
                                              .distance
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.directions,
                                            size: 30,
                                            color: Colors.amberAccent),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            AwesomeDialog(
                                                    context: context,
                                                    dialogType:
                                                        DialogType.NO_HEADER,
                                                    animType:
                                                        AnimType.BOTTOMSLIDE,
                                                    title: 'Directions',
                                                    desc:
                                                        'Click on the button below to get directions to the selected location',
                                                    btnOkOnPress: () {})
                                                .show();
                                            // _launchURL(destinationlist[index]
                                            //     .googlemapsurl);
                                          },
                                          child: const Text(
                                            'Get Direction',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                          color: Colors.amberAccent,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Photos : ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration:
                                              destinationlist[index].decoration,
                                          // child: PhotoView(
                                          //   tightMode: true,
                                          //   imageProvider:
                                          //       destinationlist[index]
                                          //           .imageProvider,
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Positioned(
                                    child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.amberAccent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {},
                                  ),
                                )),
                              ),
                            ],
                          ),
                        );
                      })
                  : const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.amberAccent,
                        color: Colors.white,
                      ),
                    )),
        ],
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
