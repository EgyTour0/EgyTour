import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../shared/components/components.dart';

class gizaplaces extends StatefulWidget {
  gizaplaces({Key? key}) : super(key: key);

  @override
  State<gizaplaces> createState() => _gizaplacesState();
}

List<LatLng> coords = [
  ///Pyramids of Giza
  LatLng(29.9792, 31.1342),

  ///Giza Solar Boat Museum",
  LatLng(29.9780, 31.1346),

  ///Pyramids of Dahshour
  LatLng(29.806389, 31.208056),

  ///Pharaonic Village
  LatLng(29.997576, 31.215628),

  ///Saqqara Nescropolis
  LatLng(29.8685, 31.2168),
];

List Names = [
  "Pyramids of Giza",
  "Giza Solar Boat Museum",
  "Pyramids of Dahshour",
  "Pharaonic Village",
  "Saqqara Necropolis",
];

final fivePlaces = [
  'https://cdn.mos.cms.futurecdn.net/StbZLdHoZ6JoPR9oFV55ia.jpg',
  'https://www.cleopatraegypttours.com/wp-content/uploads/2018/08/Solar-Boat-Museum-Khufu-Ship-in-Giza.jpg',
  'https://images.memphistours.com/large/f843d318dadb0008e50feb017c327b93.jpg',
  'https://media.gemini.media/img/large/2021/7/19/2021_7_19_2_10_46_194.jpg',
  'https://images.memphistours.com/large/c9d2e35472304462568956f4cbbb8d9b.jpg'
];

final urlImages = [
  'https://cdn.britannica.com/43/189743-050-25B19F71/Great-Sphinx-Pyramid-of-Khafre-Egypt-Giza.jpg',
  'https://discoveringegypt.com/wp-content/uploads/2014/07/Giza4.jpg',
];
final gizaurlImages = [
  'https://discoveringegypt.com/wp-content/uploads/2014/07/Giza4.jpg',
  'https://cdn.britannica.com/72/194372-050-9F991D2D/Stairway-tomb-center-pyramid-Cairo-Egypt-Giza.jpg',
  'https://c8.alamy.com/comp/MHFMWC/ruins-of-the-saqqara-necropolis-egypt-unesco-world-heritage-MHFMWC.jpg',
  'https://media.wired.com/photos/601496dfd408e6d99167ff22/master/w_2560%2Cc_limit/Science_Ars-1230634331.jpg',
  'https://www.abc.net.au/news/image/10624352-3x2-940x627.jpg',
];

class _gizaplacesState extends State<gizaplaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                InkWell(
                  child: Ink.image(
                    image: CachedNetworkImageProvider(urlImages[0]),
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  onTap: () {
                    openGallery();
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Highlights in giza',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      ' As Swenet, the city had the important role of protecting Egypt from invaders at its southernmost boundary. In Pharaonic Egypt times, during it is believed every dynasty, the city was a military town. Its stone quarries are said to have provided the granite rock known as Syenite for most of the fabulous temples, columns, and obelisks built by the pharaohs, including the Pyramids of Giza. Today, giza is characterized by its abundance of palm trees and tropical gardens, standing beside one of the widest parts of the Nile River. As such, it has many islands dotted off its shores. Two of the largest are Kitchener’s Island, known for being covered with exotic plants, and the much larger Elephantine Island.giza is Egypt’s southernmost city and lies, like Luxor and Cairo, on the shores of the Nile River, at its first cataract. To its north lies some 750 miles of the Nile until it reaches the Nile Delta and the Mediterranean Sea. What sets this beautiful city apart from Cairo and Luxor, however, is that its buildings occupy only the East Bank and two islands in the river, with its barren West Bank’s dunes, literally, on the waters edge. The West Bank has only a handful, albeit supremely notable, structures including the Monastery of St Simeon, the Aga Khan Mausoleum and the Tombs of the Nobles. giza is located roughly where the Western Desert and the Eastern Desert meet, and just north of the great expanse of water created by the giza Dam known as Lake Nasser.',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // FivePlacesText(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 400,
                    height: 230,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                      image: NetworkImage(fivePlaces[index]),
                                      fit: BoxFit.cover,
                                    )),
                                width: 400,
                                height: 200,
                              ),
                              onTap: () {
                                _deslaunchURL(
                                  coords[index].latitude,
                                  coords[index].longitude,
                                  Names[index],
                                );
                              },
                            ),
                            FittedBox(
                              child: Text(
                                Names[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        );
                      },

                      /*
                      * onPressed: () {
                                          _deslaunchURL(
                                            coords[index].latitude,
                                            coords[index].longitude,

                                          );
                                        },

                                        ),
                                        color: ButtonAndIconsColor(),
                      * */
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: GalleryText(),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
              child: SizedBox(
                width: 350,
                height: 350,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: gizaurlImages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Ink.image(
                        image: CachedNetworkImageProvider(gizaurlImages[index]),
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                      onTap: () {
                        opengizaGallery(index);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deslaunchURL(lat, lng, name) async {
    final availableMaps = await MapLauncher.installedMaps;
    print(availableMaps);
    if (availableMaps.isNotEmpty) {
      await availableMaps.first.showMarker(
        coords: Coords(lat, lng),
        title: name,
      );
    } else {
      throw 'No available maps';
    }
  }

  void openGallery() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryWidget(
          urlImages: urlImages,
          index: 0,
        ),
      ),
    );
  }

  void opengizaGallery(index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryWidget(
          urlImages: gizaurlImages,
          index: index,
        ),
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  final int index;
  final List<String> urlImages;
  GalleryWidget({
    required this.urlImages,
    required this.index,
  });

  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  late int index = widget.index;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider:
                    CachedNetworkImageProvider(widget.urlImages[index]),
                heroAttributes:
                    PhotoViewHeroAttributes(tag: widget.urlImages[index]),
              );
            },
            itemCount: widget.urlImages.length,
            backgroundDecoration: BoxDecoration(
              color: Colors.black,
            ),
            onPageChanged: (index) => setState(() => {
                  this.index = index,
                }),
            pageController: PageController(initialPage: index),
          ),
          Positioned(
            bottom: 0.0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '${index + 1}/${widget.urlImages.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
