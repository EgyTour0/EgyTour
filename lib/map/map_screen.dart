import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'FilterScreen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  late String searchadder;

  // Location currentLocation = Location();
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Set <Polygon> polygons = Set<Polygon>();
  Set<Marker> _markers = {};
  Marker marker1 = Marker(
    markerId: MarkerId('Marker1'),
    position: LatLng(30.0444, 31.2357),
    infoWindow: InfoWindow(title: 'Business 1'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  );
  Marker marker2 = Marker(
    markerId: MarkerId('Marker2'),
    position: LatLng(26.5499, 31.700001),
    infoWindow: InfoWindow(title: 'Business 2'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  );
  Marker marker3 = Marker(
    markerId: MarkerId('Marker3'),
    position: LatLng(27.1112121705, 31.167012924131),
    infoWindow: InfoWindow(title: 'Maria'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  );
  Marker marker4 = Marker(
    markerId: MarkerId('Marker4'),
    position: LatLng(27.4444445, 30.81666730),
    infoWindow: InfoWindow(title: 'Maria'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  );

  List<Marker> list = [];
  @override
  void initState() {
    list = [marker1, marker2, marker3, marker4];
    // _markers.addAll(list);
    super.initState();
  }

  ///collection
// var myMarkers =HashSet<Marker>();

  // @override
  // void initState() {
  //   getMarkers();
  // }

  ///live location>>
//   void getLocation() async{
//     var location = await currentLocation.getLocation();
//     currentLocation.onLocationChanged.listen((LocationData loc){
//
//       mapController?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
//         target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
//         zoom: 10,
//       )));
//       print(loc.latitude);
//       print(loc.longitude);
//       setState(() {
//         bool x=false;
//         if(x==false) {
//          _markers.add(Marker(markerId: MarkerId('Home'),
//               position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
//           ));
//         x=true;
//         };
//       }
//
//       );
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: GoogleMap(
              // onTap: _handleTap,
              markers: Set<Marker>.of(list),
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(30.0444, 31.2357),
                zoom: 8,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                // setState(() {
                //   myMarkers.add(
                //       Marker(markerId: MarkerId('1'),position: LatLng(30.0444,31.2357),)
                //   );
                //   myMarkers.add(
                //       Marker(markerId: MarkerId('2'),position: LatLng(26.5499,31.700001),)
                //   );
                // });
              },
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            left: 20,
            child: Center(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xffffffff),
                    filled: true,
                    hintText: 'Enter Address to start from',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1.6),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    contentPadding: EdgeInsets.only(left: 15, top: 15),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search, color: Color(0xff2a5885)),
                      iconSize: 30,
                      onPressed: () {
                        searchandNavigate();
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
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            ElevatedButton(
                              child: Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff2a5885),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  height: 50,
                  color: Color(0xff2a5885),
                  child: Text(
                    'Creat Trip',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffedeef0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff2a5885),
        child: Icon(
          Icons.filter_alt_outlined,
          color: Color(0xffedeef0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FilterScreen()),
          );
        },
      ),
    );
  }

  // getMarkers()async{
  //   QuerySnapshot<Map<String, dynamic>> snap=await FirebaseFirestore.instance.collection('MapPlaces').get();
  //   for(var doc in snap.docs){
  //
  //     myMarker.add(Marker(markerId: MarkerId(doc.id),position: doc.data()["coords"]));
  //
  //   }
  //   setState(() {
  //   });
  //
  // }

  // Widget loadMap(BuildContext context) {
  //   // <1> Use StreamBuilder
  //   return StreamBuilder<QuerySnapshot>(
  //       stream: FirebaseFirestore.instance.collection('MapPlaces').snapshots(),
  //       builder: (context, snapshot) {
  //         if(!snapshot.hasData){return Text('loading....');}
  //
  //         QuerySnapshot<Object?> snap=snapshot.data!;
  //         List<Widget> places=[];
  //         for(var doc in snap.docs){
  //           places.add(Container(padding: EdgeInsets.all(20),child: Text(doc.get("place")),));
  //         }
  //         return Column(children: places,);
  //           });
  // }

  searchandNavigate() {
    locationFromAddress(searchadder).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(result[0].latitude, result[0].longitude),
        zoom: 10.0,
      )));
    });
  }
  // void _handleTap(LatLng tappedPoint) {
  //   setState(() {
  //      myMarker = [];
  //     myMarker.add(
  //       Marker(
  //         markerId: ,
  //         //    markerId: MarkerId(tappedPoint.toString()),
  //         // position: tappedPoint,
  //         // draggable: true,
  //         // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed) ,
  //         //   onDragEnd: (dragEndPosition){
  //         //      print(dragEndPosition);
  //         // },
  //       ),
  //     );
  //   });
  // }
}
