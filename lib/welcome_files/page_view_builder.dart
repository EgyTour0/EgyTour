import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/components/components.dart';
import 'custom_responsive_button.dart';

class onboarding extends StatefulWidget {
  const onboarding({Key? key}) : super(key: key);

  @override
  _onboardingState createState() => _onboardingState();
}

List images = [
  "welcome-one.jpg",
  "welcome-two.png",
  "social1.png",
];
List TextOnPhoto1 = [
  "Egy Tour",
  "Map",
  "Social Space",
];
List TextOnPhoto2 = [
  "Explore Egypt ♥",
  "Creat trip",
  "Use social space",
];
List TextOnPhoto3 = [
  "Egy-Tour app helps you to explore Egypt in a different way",
  "Use the Map to get a trip for the nearest places depending on your live location",
  "share your photos and posts on your timleine using the social space",
];

class _onboardingState extends State<onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/" + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (indexDots) {
                        return Container(
                          width: index == indexDots ? 20 : 8,
                          margin: const EdgeInsets.only(right: 2),
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? ButtonAndIconsColor()
                                : ButtonAndIconsColor().withOpacity(0.3),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '' + TextOnPhoto1[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 35),
                        ),
                        Text(
                          '' + TextOnPhoto2[index],
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 45,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: Text(
                            '' + TextOnPhoto3[index],
                            style: const TextStyle(
                              color: Color(0xFF878593),
                              fontSize: 19,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        responsivebutton(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
