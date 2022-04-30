import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import 'map_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late ConfettiController _controllerBottomCenter;
  TextEditingController starttimeController = TextEditingController();
  TextEditingController endtimeController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  TextEditingController placesnumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 5));
  }

  Path drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);
    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);
    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  double dis = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Filter Your Trip',
          style: TextStyle(color: Color(0xffedeef0), fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff2a5885),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffedeef0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            children: [
              ///section 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Filter',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.filter_alt_outlined,
                    color: Color(0xff2a5885),
                    size: 36.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'choose time : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 400,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          controller: starttimeController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1.4),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1.4,
                                color: Color(0xff4a76a8),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            fillColor: const Color(0xffedeef0).withOpacity(0.5),
                            label: const Text('Start'),
                            hintText: 'start time',
                            labelStyle: const TextStyle(
                              color: Color(0xff2a5885),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          controller: endtimeController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1.4),
                                borderRadius: BorderRadius.circular(15.0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1.4,
                                color: Color(0xff4a76a8),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: const Color(0xffedeef0).withOpacity(0.5),
                            label: const Text('End'),
                            labelStyle: const TextStyle(
                              color: Color(0xff2a5885),
                              fontSize: 18,
                            ),
                            hintText: 'end time',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              ///section 1
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'how many days : ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 400,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 329,
                          child: TextFormField(
                            controller: daysController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1.4),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1.4,
                                  color: Color(0xff4a76a8),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              fillColor:
                                  const Color(0xffedeef0).withOpacity(0.5),
                              label: const Text('days'),
                              hintText: 'number of days maximum 4',
                              labelStyle: const TextStyle(
                                color: Color(0xff2a5885),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              ///section 3
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'number of places : ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 400,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 329,
                          child: TextFormField(
                            controller: placesnumberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1.4),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1.4,
                                  color: Color(0xff4a76a8),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              fillColor:
                                  const Color(0xffedeef0).withOpacity(0.5),
                              label: const Text('Places'),
                              hintText: 'number of Places Maximum 6',
                              labelStyle: const TextStyle(
                                color: Color(0xff2a5885),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Distance to Travel : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              ///section 3 slider
              Slider(
                min: 10,
                max: 200,
                value: dis,
                activeColor: const Color(0xff2a5885),
                onChanged: (value) {
                  setState(() {
                    dis = value;
                  });
                },
              ),
              Center(
                child: Text(
                  "" + dis.toString(),
                  style: const TextStyle(
                    fontSize: 32.0,
                  ),
                ),
              ),

              ///section 4
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: MaterialButton(
                    height: 45,
                    minWidth: 150,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: const Color(0xff4a76a8),
                    onPressed: () {
                      bool ispushed = false;
                      setState(() {
                        _controllerBottomCenter.play();
                        ispushed = true;
                      });

                      if (ispushed == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapScreen(
                                  // startTime:"s",
                                  // endTime: "s",
                                  // days: ,
                                  // places: ,
                                  )),
                        );
                      }
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),
                ),
              ),

              ///Confetti widget builder
              ConfettiWidget(
                colors: const [
                  Colors.red,
                  Colors.cyan,
                  Colors.amber,
                  Colors.deepPurple,
                  Colors.amberAccent,
                  Colors.lightGreenAccent,
                  Colors.blue,
                ],
                confettiController: _controllerBottomCenter,
                blastDirection: -pi / 2,
                shouldLoop: false,
                maxBlastForce: 50, // set a lower max blast force
                minBlastForce: 10, // set a lower min blast force
                emissionFrequency: 0.3,
                numberOfParticles: 20, // a lot of particles at once
                gravity: 0.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
