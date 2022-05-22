import 'package:egytour/map/placesdetails.dart';
import 'package:flutter/material.dart';

class TripNotes extends StatefulWidget {
  const TripNotes({Key? key}) : super(key: key);

  @override
  State<TripNotes> createState() => _TripNotesState();
}

class _TripNotesState extends State<TripNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Hello there!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const FittedBox(
              child: Text(
                "the total time for travelling between places is:",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    // width: 150,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(40)),
                    child: MaterialButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PlacesDetails()));
                      },
                      height: 40,
                      color: Colors.black,
                      child: const FittedBox(
                        child: Text(
                          'See Places Details',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Container(
                    // width: 150,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(40)),
                    child: MaterialButton(
                      onPressed: () async {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const placesDetails()));
                      },
                      height: 40,
                      color: Colors.black,
                      child: const FittedBox(
                        child: Text(
                          'Get Directions',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
