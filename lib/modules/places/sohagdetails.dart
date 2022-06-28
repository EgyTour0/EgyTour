import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class sohagplaces extends StatefulWidget {
  sohagplaces({Key? key}) : super(key: key);

  @override
  State<sohagplaces> createState() => _sohagplacesState();
}

List<LatLng> coords = [
  ///Abydos
  LatLng(26.1834, 31.9226),

  ///Red Monastery
  LatLng(26.554931, 31.619686),

  ///Sohag Meusem
  LatLng(26.5612908, 31.7063012),

  ///white monestrey
  LatLng(26.5334009, 31.644074099),

  ///Sidi Aref Mosque
  LatLng(26.3410084, 31.142085100000003),
];

List Names = [
  'Abydos',
  'Red Monastery',
  'Sohag Meusem',
  'White Monestery',
  'Sidi Aref Mosque',
];

final fivePlaces = [
  'https://egypttravelblog.com/wp-content/uploads/2021/02/seti-temple-abydos-shutterstock-copy.jpg',
  'https://image.shutterstock.com/image-photo/coptic-red-monastery-sohag-egypt-260nw-773720236.jpg',
  'https://www.presidency.eg/media/103042/2ae71e7b-a420-4651-ae9c-21562b3f73af_cx0_cy8_cw0_w1200_r1_sjpg.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/6/6e/WhiteMonasteryCourtEast.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/1/10/SohagArifSouthSide.jpg',
];

final urlImages = [
  'https://egypttravelblog.com/wp-content/uploads/2021/02/seti-temple-abydos-shutterstock-copy.jpg',
  'https://image.shutterstock.com/image-photo/coptic-red-monastery-sohag-egypt-260nw-773720236.jpg',
  'https://www.presidency.eg/media/103042/2ae71e7b-a420-4651-ae9c-21562b3f73af_cx0_cy8_cw0_w1200_r1_sjpg.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/6/6e/WhiteMonasteryCourtEast.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/1/10/SohagArifSouthSide.jpg',
];
final sohagurlImages = [
  'https://egypttravelblog.com/wp-content/uploads/2021/02/seti-temple-abydos-shutterstock-copy.jpg',
  'https://image.shutterstock.com/image-photo/coptic-red-monastery-sohag-egypt-260nw-773720236.jpg',
  'https://www.presidency.eg/media/103042/2ae71e7b-a420-4651-ae9c-21562b3f73af_cx0_cy8_cw0_w1200_r1_sjpg.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/6/6e/WhiteMonasteryCourtEast.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/1/10/SohagArifSouthSide.jpg',
];

class _sohagplacesState extends State<sohagplaces> {
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
                    'Highlights in sohag',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      ' As Swenet, the city had the important role of protecting Egypt from invaders at its southernmost boundary. In Pharaonic Egypt times, during it is believed every dynasty, the city was a military town. Its stone quarries are said to have provided the granite rock known as Syenite for most of the fabulous temples, columns, and obelisks built by the pharaohs, including the Pyramids of Giza. Today, sohag is characterized by its abundance of palm trees and tropical gardens, standing beside one of the widest parts of the Nile River. As such, it has many islands dotted off its shores. Two of the largest are Kitchener’s Island, known for being covered with exotic plants, and the much larger Elephantine Island.sohag is Egypt’s southernmost city and lies, like sohag and Cairo, on the shores of the Nile River, at its first cataract. To its north lies some 750 miles of the Nile until it reaches the Nile Delta and the Mediterranean Sea. What sets this beautiful city apart from Cairo and sohag, however, is that its buildings occupy only the East Bank and two islands in the river, with its barren West Bank’s dunes, literally, on the waters edge. The West Bank has only a handful, albeit supremely notable, structures including the Monastery of St Simeon, the Aga Khan Mausoleum and the Tombs of the Nobles. sohag is located roughly where the Western Desert and the Eastern Desert meet, and just north of the great expanse of water created by the sohag Dam known as Lake Nasser.',
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
            // Padding(
            //   padding: const EdgeInsets.only(left: 10.0),
            //   child: GalleryText(),
            // ),
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
                  itemCount: sohagurlImages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Ink.image(
                        image:
                            CachedNetworkImageProvider(sohagurlImages[index]),
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                      onTap: () {
                        opensohagGallery(index);
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

  void opensohagGallery(index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryWidget(
          urlImages: sohagurlImages,
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
