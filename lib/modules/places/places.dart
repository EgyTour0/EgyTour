import 'dart:ui';

import 'package:egytour/modules/places/qenadetails.dart';
import 'package:egytour/modules/places/sohagdetails.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import 'assiutplaces.dart';
import 'aswandetails.dart';
import 'cairodetails.dart';
import 'gizadetails.dart';
import 'luxordetails.dart';
import 'menyadetails.dart';

class placesinfo extends StatefulWidget {
  _placesinfoState createState() => _placesinfoState();
}

_placesinfoState createState() => _placesinfoState();

class _placesinfoState extends State<placesinfo> {
  var images = {
    "aswan.jpg": "aswan",
    "assiut.jpg": "assiut",
    "cairotower.jpg": "cairo",
    "giza.jpg": "giza",
    "luxor.jpg": "luxor",
    "qena.jpg": "qena",
    "sohag-governorate.jpg": "sohag",
    "minya.jpg": "minya",
  };

  List textOnPhoto = [
    "Aswan",
    "Assiut",
    "Cairo",
    "Giza",
    "Luxor",
    "Qena",
    "Sohag",
    "Minya",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.only(left: 20, top: 20.0),
              child: const Text(
                'Discover ...',
                style: TextStyle(
                    fontSize: 45,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                "top 5 places to visit...",
                style: TextStyle(
                    letterSpacing: 3, fontSize: 25, color: Colors.black),
              )),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 25, left: 20),
              height: 300,
              child: GridView.builder(
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  return Container(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.only(
                        bottom: 20,
                        left: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            navigateto(context, Aswanplaces());
                          }
                          if (index == 1) {
                            navigateto(context, assiutplaces());
                          }
                          if (index == 2) {
                            navigateto(context, cairoplaces());
                          }
                          if (index == 3) {
                            navigateto(context, gizaplaces());
                          }
                          if (index == 4) {
                            navigateto(context, luxorplaces());
                          }
                          if (index == 5) {
                            navigateto(context, qenaplaces());
                          }
                          if (index == 6) {
                            navigateto(context, sohagplaces());
                          }
                          if (index == 7) {
                            navigateto(context, menyaplaces());
                          }
                          print('$index');
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 5.0,
                              child: Row(
                                children: [
                                  Text(
                                    '' + textOnPhoto[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.only(right: 10),
                    width: 330,
                    height: 550,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/" + images.keys.elementAt(index)),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
