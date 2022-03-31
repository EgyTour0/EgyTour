import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:card_swiper/card_swiper.dart';

class Searching extends StatefulWidget {
  _SearchingState createState() => _SearchingState();
}

_SearchingState createState() => _SearchingState();

class _SearchingState extends State<Searching> {
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
      backgroundColor: Color(0xff5181b8),
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
                style: TextStyle(fontSize: 35, color: Color(0xffffffff)),
              )),
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                'DESTINATION',
                style: TextStyle(
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Color(0xffffffff)),
              )),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 25, left: 20),
              height: 300,
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  return GestureDetector(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: FlipCard(
                        front: Container(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.only(
                              bottom: 20,
                              left: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: Text(
                                    '' + textOnPhoto[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                ///text Container
                                Container(
                                  child: Text(
                                    '' + textOnPhoto2[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          margin: EdgeInsets.only(right: 10),
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
                        back: Container(
                          width: 340,
                          decoration: BoxDecoration(
                              //color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Swiper(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      width: 340,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'images/' + images.keys.elementAt(index)),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: 8,
                                  autoplay: true,
                                  scrollDirection: Axis.horizontal,
                                  pagination:  SwiperPagination(),
                                  layout: SwiperLayout.STACK,
                                  itemHeight: 300,
                                  itemWidth: 335,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Container(
                                      height: 2000,
                                      width: 335,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.blue.withOpacity(0.3),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Text(
                                              '' + textOnPhoto[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40,),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              width: 300,
                                              child: Text(
                                                '' + textOnPhoto3[index],
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///if u want to use dialog
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///calss for dialog
  Function? SelectedSwiper(index) {
    if (index == 0) {
      Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 340,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:
                    AssetImage('images/' + imagesSwiper1.keys.elementAt(index)),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        itemCount: 8,
        autoplay: true,
        scrollDirection: Axis.horizontal,
        pagination: new SwiperPagination(),
        layout: SwiperLayout.STACK,
        itemHeight: 300,
        itemWidth: 335,
      );
    }
    if (index == 1) {
      Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 340,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:
                    AssetImage('images/' + imagesSwiper2.keys.elementAt(index)),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        itemCount: 8,
        autoplay: true,
        scrollDirection: Axis.horizontal,
        pagination: new SwiperPagination(),
        layout: SwiperLayout.STACK,
        itemHeight: 300,
        itemWidth: 335,
      );
    }
    if (index == 2) {
      Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 340,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:
                    AssetImage('images/' + imagesSwiper3.keys.elementAt(index)),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        itemCount: 8,
        autoplay: true,
        scrollDirection: Axis.horizontal,
        pagination: new SwiperPagination(),
        layout: SwiperLayout.STACK,
        itemHeight: 300,
        itemWidth: 335,
      );
    }
    if (index == 3) {
      Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 340,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:
                    AssetImage('images/' + imagesSwiper4.keys.elementAt(index)),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        itemCount: 8,
        autoplay: true,
        scrollDirection: Axis.horizontal,
        pagination: new SwiperPagination(),
        layout: SwiperLayout.STACK,
        itemHeight: 300,
        itemWidth: 335,
      );
    }
    if (index == 4) {
      Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 340,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:
                    AssetImage('images/' + imagesSwiper5.keys.elementAt(index)),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        itemCount: 8,
        autoplay: true,
        scrollDirection: Axis.horizontal,
        pagination: new SwiperPagination(),
        layout: SwiperLayout.STACK,
        itemHeight: 300,
        itemWidth: 335,
      );
    }
    if (index == 5) {
      Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 340,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:
                    AssetImage('images/' + imagesSwiper6.keys.elementAt(index)),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        itemCount: 8,
        autoplay: true,
        scrollDirection: Axis.horizontal,
        pagination: new SwiperPagination(),
        layout: SwiperLayout.STACK,
        itemHeight: 300,
        itemWidth: 335,
      );
    }
    if (index == 6) {
      Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 340,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:
                    AssetImage('images/' + imagesSwiper7.keys.elementAt(index)),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        itemCount: 8,
        autoplay: true,
        scrollDirection: Axis.horizontal,
        pagination: new SwiperPagination(),
        layout: SwiperLayout.STACK,
        itemHeight: 300,
        itemWidth: 335,
      );
    }
    if (index == 7) {
      Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 340,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:
                    AssetImage('images/' + imagesSwiper8.keys.elementAt(index)),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        itemCount: 8,
        autoplay: true,
        scrollDirection: Axis.horizontal,
        pagination: new SwiperPagination(),
        layout: SwiperLayout.STACK,
        itemHeight: 300,
        itemWidth: 335,
      );
    }
  }
}
