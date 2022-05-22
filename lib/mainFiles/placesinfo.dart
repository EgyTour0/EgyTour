import 'dart:ui';

import 'package:flutter/material.dart';

import '../shared/components/components.dart';

class placesinfo extends StatefulWidget {
  _placesinfoState createState() => _placesinfoState();
}

_placesinfoState createState() => _placesinfoState();

class _placesinfoState extends State<placesinfo> {
  var images = {
    "aswan.jpg": "aswan",
    "assiut.jpg": "assiut",
    "cairotower.jpg": "aswan",
    "giza.jpg": "aswan",
    "luxor.jpg": "aswan",
    "qena.jpg": "aswan",
    "sohag.jpg": "aswan",
    "pyra.jpg": "pyramids",
  };

  var imagesSwiper1 = {
    "aswan.jpg": "aswan",
    "aswan.jpg": "aswan",
    "aswan.jpg": "aswan",
    "aswan.jpg": "aswan",
    "aswan.jpg": "aswan",
    "aswan.jpg": "aswan",
    "aswan.jpg": "aswan",
    "aswan.jpg": "aswan",
  };
  var imagesSwiper2 = {
    "assiut.jpg": "assiut",
    "assiut.jpg": "assiut",
    "assiut.jpg": "assiut",
    "assiut.jpg": "assiut",
    "assiut.jpg": "assiut",
    "assiut.jpg": "assiut",
    "assiut.jpg": "assiut",
    "assiut.jpg": "assiut",
  };
  var imagesSwiper3 = {
    "cairotower.jpg": "cairo",
    "cairotower.jpg": "cairo",
    "cairotower.jpg": "cairo",
    "cairotower.jpg": "cairo",
    "cairotower.jpg": "cairo",
    "cairotower.jpg": "cairo",
    "cairotower.jpg": "cairo",
    "cairotower.jpg": "cairo",
  };
  var imagesSwiper4 = {
    "giza.jpg": "giza",
    "giza.jpg": "giza",
    "giza.jpg": "giza",
    "giza.jpg": "giza",
    "giza.jpg": "giza",
    "giza.jpg": "giza",
    "giza.jpg": "giza",
    "giza.jpg": "giza",
  };
  var imagesSwiper5 = {
    "luxor.jpg": "luxor",
    "luxor.jpg": "luxor",
    "luxor.jpg": "luxor",
    "luxor.jpg": "luxor",
    "luxor.jpg": "luxor",
    "luxor.jpg": "luxor",
    "luxor.jpg": "luxor",
    "luxor.jpg": "luxor",
  };
  var imagesSwiper6 = {
    "qena.jpg": "qena",
    "qena.jpg": "qena",
    "qena.jpg": "qena",
    "qena.jpg": "qena",
    "qena.jpg": "qena",
    "qena.jpg": "qena",
    "qena.jpg": "qena",
    "qena.jpg": "qena",
  };
  var imagesSwiper7 = {
    "sohag.jpg": "sohag",
    "sohag.jpg": "sohag",
    "sohag.jpg": "sohag",
    "sohag.jpg": "sohag",
    "sohag.jpg": "sohag",
    "sohag.jpg": "sohag",
    "sohag.jpg": "sohag",
    "sohag.jpg": "sohag",
  };
  var imagesSwiper8 = {
    "pyra.jpg": "pyramids",
    "pyra.jpg": "pyramids",
    "pyra.jpg": "pyramids",
    "pyra.jpg": "pyramids",
    "pyra.jpg": "pyramids",
    "pyra.jpg": "pyramids",
    "pyra.jpg": "pyramids",
    "pyra.jpg": "pyramids",
  };

  List textOnPhoto = [
    "Aswan",
    "Assiut",
    "Cairo",
    "Giza",
    "Luxor",
    "Qena",
    "Sohag",
    "Pyramids",
  ];

  List textOnPhoto2 = [
    "10 places to visit",
    "8 places to visit",
    "7 places to visit",
    "4 places to visit",
    "3 places to visit",
    "5 places to visit",
    "7 places to visit",
    "9 places to visit",
  ];

  List textOnPhoto3 = [
    "Aswan is known for its beautiful Nile Valley scenery significant archaeological sites and its peaceful aura. Its weather is warm all year round which makes it a perfect winter destination. The city provides splendid views and attractions to sail through the Nile"
        "with a felucca (Egyptian sailboat) Apart from Aswan’s historical sites, the city offers a unique cultural experience through the Nubian Village, known as “Gharb Seheyl”. Exploring the colourful village allows you to discover the last vestiges of the Nubian civilization that co-existed with the Ancient Egyptians. Besides the Aswan Souk, Nubia is also a great place to shop for souvenirs, spices and local handmade crafts. The city provides splendid views and attractions to sail through the Nile with a felucca (Egyptian sailboat). The river flows gently from Lake Nasser, through various islands, surrounded by black granite and greenery. Sailing to historical sites, such as Philea, the Elephantine Island, Aswan Museum, Agha Khan Mausoleum, the Monastery of St. Simeon, and the Botanical Island, gives you an opportunity to explore Aswan’s rich history and culture. Other spectacular historical destinations include the Temple of Abu Simbel, the Temple of Kom Ombo, the Nubian Museum and the Aswan High Dam. The magical city of Aswan, formerly known as Swenett, is located in the south of Egypt. The word Aswan is derived from the ancient Egyptian word “Soun”, which means souk or market. Aswan earned its name because it was a strategic gateway to the South. In ancient times, it was the main provider of granite used for obelisks and sculptures.",
    "Aswan is known for its beautiful Nile Valley scenery significant archaeological sites and its peaceful aura. Its weather is warm all year round which makes it a perfect winter destination. The city provides splendid views and attractions to sail through the Nile"
        "with a felucca (Egyptian sailboat) Apart from Aswan’s historical sites, the city offers a unique cultural experience through the Nubian Village, known as “Gharb Seheyl”. Exploring the colourful village allows you to discover the last vestiges of the Nubian civilization that co-existed with the Ancient Egyptians. Besides the Aswan Souk, Nubia is also a great place to shop for souvenirs, spices and local handmade crafts. The city provides splendid views and attractions to sail through the Nile with a felucca (Egyptian sailboat). The river flows gently from Lake Nasser, through various islands, surrounded by black granite and greenery. Sailing to historical sites, such as Philea, the Elephantine Island, Aswan Museum, Agha Khan Mausoleum, the Monastery of St. Simeon, and the Botanical Island, gives you an opportunity to explore Aswan’s rich history and culture. Other spectacular historical destinations include the Temple of Abu Simbel, the Temple of Kom Ombo, the Nubian Museum and the Aswan High Dam. The magical city of Aswan, formerly known as Swenett, is located in the south of Egypt. The word Aswan is derived from the ancient Egyptian word “Soun”, which means souk or market. Aswan earned its name because it was a strategic gateway to the South. In ancient times, it was the main provider of granite used for obelisks and sculptures.",
    "Aswan is known for its beautiful Nile Valley scenery significant archaeological sites and its peaceful aura. Its weather is warm all year round which makes it a perfect winter destination. The city provides splendid views and attractions to sail through the Nile"
        "with a felucca (Egyptian sailboat) Apart from Aswan’s historical sites, the city offers a unique cultural experience through the Nubian Village, known as “Gharb Seheyl”. Exploring the colourful village allows you to discover the last vestiges of the Nubian civilization that co-existed with the Ancient Egyptians. Besides the Aswan Souk, Nubia is also a great place to shop for souvenirs, spices and local handmade crafts. The city provides splendid views and attractions to sail through the Nile with a felucca (Egyptian sailboat). The river flows gently from Lake Nasser, through various islands, surrounded by black granite and greenery. Sailing to historical sites, such as Philea, the Elephantine Island, Aswan Museum, Agha Khan Mausoleum, the Monastery of St. Simeon, and the Botanical Island, gives you an opportunity to explore Aswan’s rich history and culture. Other spectacular historical destinations include the Temple of Abu Simbel, the Temple of Kom Ombo, the Nubian Museum and the Aswan High Dam. The magical city of Aswan, formerly known as Swenett, is located in the south of Egypt. The word Aswan is derived from the ancient Egyptian word “Soun”, which means souk or market. Aswan earned its name because it was a strategic gateway to the South. In ancient times, it was the main provider of granite used for obelisks and sculptures.",
    "Aswan is known for its beautiful Nile Valley scenery significant archaeological sites and its peaceful aura. Its weather is warm all year round which makes it a perfect winter destination. The city provides splendid views and attractions to sail through the Nile"
        "with a felucca (Egyptian sailboat) Apart from Aswan’s historical sites, the city offers a unique cultural experience through the Nubian Village, known as “Gharb Seheyl”. Exploring the colourful village allows you to discover the last vestiges of the Nubian civilization that co-existed with the Ancient Egyptians. Besides the Aswan Souk, Nubia is also a great place to shop for souvenirs, spices and local handmade crafts. The city provides splendid views and attractions to sail through the Nile with a felucca (Egyptian sailboat). The river flows gently from Lake Nasser, through various islands, surrounded by black granite and greenery. Sailing to historical sites, such as Philea, the Elephantine Island, Aswan Museum, Agha Khan Mausoleum, the Monastery of St. Simeon, and the Botanical Island, gives you an opportunity to explore Aswan’s rich history and culture. Other spectacular historical destinations include the Temple of Abu Simbel, the Temple of Kom Ombo, the Nubian Museum and the Aswan High Dam. The magical city of Aswan, formerly known as Swenett, is located in the south of Egypt. The word Aswan is derived from the ancient Egyptian word “Soun”, which means souk or market. Aswan earned its name because it was a strategic gateway to the South. In ancient times, it was the main provider of granite used for obelisks and sculptures.",
    "Aswan is known for its beautiful Nile Valley scenery significant archaeological sites and its peaceful aura. Its weather is warm all year round which makes it a perfect winter destination. The city provides splendid views and attractions to sail through the Nile"
        "with a felucca (Egyptian sailboat) Apart from Aswan’s historical sites, the city offers a unique cultural experience through the Nubian Village, known as “Gharb Seheyl”. Exploring the colourful village allows you to discover the last vestiges of the Nubian civilization that co-existed with the Ancient Egyptians. Besides the Aswan Souk, Nubia is also a great place to shop for souvenirs, spices and local handmade crafts. The city provides splendid views and attractions to sail through the Nile with a felucca (Egyptian sailboat). The river flows gently from Lake Nasser, through various islands, surrounded by black granite and greenery. Sailing to historical sites, such as Philea, the Elephantine Island, Aswan Museum, Agha Khan Mausoleum, the Monastery of St. Simeon, and the Botanical Island, gives you an opportunity to explore Aswan’s rich history and culture. Other spectacular historical destinations include the Temple of Abu Simbel, the Temple of Kom Ombo, the Nubian Museum and the Aswan High Dam. The magical city of Aswan, formerly known as Swenett, is located in the south of Egypt. The word Aswan is derived from the ancient Egyptian word “Soun”, which means souk or market. Aswan earned its name because it was a strategic gateway to the South. In ancient times, it was the main provider of granite used for obelisks and sculptures.",
    "Aswan is known for its beautiful Nile Valley scenery significant archaeological sites and its peaceful aura. Its weather is warm all year round which makes it a perfect winter destination. The city provides splendid views and attractions to sail through the Nile"
        "with a felucca (Egyptian sailboat) Apart from Aswan’s historical sites, the city offers a unique cultural experience through the Nubian Village, known as “Gharb Seheyl”. Exploring the colourful village allows you to discover the last vestiges of the Nubian civilization that co-existed with the Ancient Egyptians. Besides the Aswan Souk, Nubia is also a great place to shop for souvenirs, spices and local handmade crafts. The city provides splendid views and attractions to sail through the Nile with a felucca (Egyptian sailboat). The river flows gently from Lake Nasser, through various islands, surrounded by black granite and greenery. Sailing to historical sites, such as Philea, the Elephantine Island, Aswan Museum, Agha Khan Mausoleum, the Monastery of St. Simeon, and the Botanical Island, gives you an opportunity to explore Aswan’s rich history and culture. Other spectacular historical destinations include the Temple of Abu Simbel, the Temple of Kom Ombo, the Nubian Museum and the Aswan High Dam. The magical city of Aswan, formerly known as Swenett, is located in the south of Egypt. The word Aswan is derived from the ancient Egyptian word “Soun”, which means souk or market. Aswan earned its name because it was a strategic gateway to the South. In ancient times, it was the main provider of granite used for obelisks and sculptures.",
    "Aswan is known for its beautiful Nile Valley scenery significant archaeological sites and its peaceful aura. Its weather is warm all year round which makes it a perfect winter destination. The city provides splendid views and attractions to sail through the Nile"
        "with a felucca (Egyptian sailboat) Apart from Aswan’s historical sites, the city offers a unique cultural experience through the Nubian Village, known as “Gharb Seheyl”. Exploring the colourful village allows you to discover the last vestiges of the Nubian civilization that co-existed with the Ancient Egyptians. Besides the Aswan Souk, Nubia is also a great place to shop for souvenirs, spices and local handmade crafts. The city provides splendid views and attractions to sail through the Nile with a felucca (Egyptian sailboat). The river flows gently from Lake Nasser, through various islands, surrounded by black granite and greenery. Sailing to historical sites, such as Philea, the Elephantine Island, Aswan Museum, Agha Khan Mausoleum, the Monastery of St. Simeon, and the Botanical Island, gives you an opportunity to explore Aswan’s rich history and culture. Other spectacular historical destinations include the Temple of Abu Simbel, the Temple of Kom Ombo, the Nubian Museum and the Aswan High Dam. The magical city of Aswan, formerly known as Swenett, is located in the south of Egypt. The word Aswan is derived from the ancient Egyptian word “Soun”, which means souk or market. Aswan earned its name because it was a strategic gateway to the South. In ancient times, it was the main provider of granite used for obelisks and sculptures.",
    "Aswan is known for its beautiful Nile Valley scenery significant archaeological sites and its peaceful aura. Its weather is warm all year round which makes it a perfect winter destination. The city provides splendid views and attractions to sail through the Nile"
        "with a felucca (Egyptian sailboat) Apart from Aswan’s historical sites, the city offers a unique cultural experience through the Nubian Village, known as “Gharb Seheyl”. Exploring the colourful village allows you to discover the last vestiges of the Nubian civilization that co-existed with the Ancient Egyptians. Besides the Aswan Souk, Nubia is also a great place to shop for souvenirs, spices and local handmade crafts. The city provides splendid views and attractions to sail through the Nile with a felucca (Egyptian sailboat). The river flows gently from Lake Nasser, through various islands, surrounded by black granite and greenery. Sailing to historical sites, such as Philea, the Elephantine Island, Aswan Museum, Agha Khan Mausoleum, the Monastery of St. Simeon, and the Botanical Island, gives you an opportunity to explore Aswan’s rich history and culture. Other spectacular historical destinations include the Temple of Abu Simbel, the Temple of Kom Ombo, the Nubian Museum and the Aswan High Dam. The magical city of Aswan, formerly known as Swenett, is located in the south of Egypt. The word Aswan is derived from the ancient Egyptian word “Soun”, which means souk or market. Aswan earned its name because it was a strategic gateway to the South. In ancient times, it was the main provider of granite used for obelisks and sculptures.",
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
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                'choose your',
                style: TextStyle(fontSize: 35, color: Colors.black),
              )),
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                'DESTINATION',
                style: TextStyle(
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Colors.black),
              )),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 25, left: 20),
              height: 300,
              child: GridView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  return GestureDetector(
                    child: Container(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.only(
                          bottom: 20,
                          left: 10,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 50,
                                top: 50,
                                right: 0,
                                left: 0,
                                child: IconButton(
                                  color: ButtonAndIconsColor(),
                                  iconSize: 100,
                                  icon: const Icon(Icons.map_outlined),
                                  onPressed: () {},
                                )),
                            Positioned(
                              bottom: 20,
                              child: Text(
                                '' + textOnPhoto[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),

                            ///text Container
                            Positioned(
                              bottom: 0,
                              child: Text(
                                '' + textOnPhoto2[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: const EdgeInsets.only(right: 10),
                      width: 330,
                      height: 550,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "images/" + images.keys.elementAt(index)),
                          fit: BoxFit.cover,
                        ),
                        //color: Color(0xFF5d69b3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    ///if u want to use dialog
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
