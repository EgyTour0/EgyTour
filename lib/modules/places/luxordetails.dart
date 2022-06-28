import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class luxorplaces extends StatefulWidget {
  luxorplaces({Key? key}) : super(key: key);

  @override
  State<luxorplaces> createState() => _luxorplacesState();
}

List<LatLng> coords = [
  ///Temple of Karnak
  LatLng(25.7188, 32.6573),

  ///Valley of the Kings
  LatLng(25.7402, 32.6014),

  ///Luxor Temple
  LatLng(25.6995, 32.6391),

  ///Temple of Deir al-Bahri
  LatLng(25.7373, 32.6077),

  ///Medinet Habu
  LatLng(25.7193, 32.6013),
];

List Names = [
  'Temple of Karnak',
  'Valley of the Kings',
  'Luxor Temple',
  'Temple of Deir al-Bahri',
  'Medinet Habu',
];

final fivePlaces = [
  'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/mandators/49581/file-manager/karnak-temple.jpg',
  'https://www.cleopatraegypttours.com/wp-content/uploads/2020/01/Valley-of-the-Kings.jpg',
  'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/mandators/49581/file-manager/luxor-travel-guide,-information-about-luxor,-egypt.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Tempel_der_Hatschepsut_%28Deir_el-Bahari%29.jpg/1200px-Tempel_der_Hatschepsut_%28Deir_el-Bahari%29.jpg',
  'https://www.hurghadareisen.com/wp-content/uploads/2020/02/Medinet-Habu-Luxor-The-Mortuary-Temple-of-Ramses-III.-.jpeg',
];

final urlImages = [
  'https://www.cleopatraegypttours.com/wp-content/uploads/2020/01/Valley-of-the-Kings.jpg',
  'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/mandators/49581/file-manager/tomb-of-ramses-ix.jpg',
];
final luxorurlImages = [
  'https://lp-cms-production.imgix.net/2019-06/f6e18c09be072890091813ba173e0fae-valley-of-the-kings.jpg',
  'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/mandators/49581/file-manager/medinet-habu.jpg',
  'https://pbs.twimg.com/media/ErxQwQYXEAAORgK.jpg',
  'https://travel.usnews.com/images/valley_of_the_kings_fD4ZNwY.jpg',
  'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/mandators/41668/cms/565387/940x500-1-50-235f80f00b2a456e04b8fc8fbc76756d.jpg',
];

class _luxorplacesState extends State<luxorplaces> {
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
                    'Highlights in luxor',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      ' As Swenet, the city had the important role of protecting Egypt from invaders at its southernmost boundary. In Pharaonic Egypt times, during it is believed every dynasty, the city was a military town. Its stone quarries are said to have provided the granite rock known as Syenite for most of the fabulous temples, columns, and obelisks built by the pharaohs, including the Pyramids of Giza. Today, luxor is characterized by its abundance of palm trees and tropical gardens, standing beside one of the widest parts of the Nile River. As such, it has many islands dotted off its shores. Two of the largest are Kitchener’s Island, known for being covered with exotic plants, and the much larger Elephantine Island.luxor is Egypt’s southernmost city and lies, like Luxor and Cairo, on the shores of the Nile River, at its first cataract. To its north lies some 750 miles of the Nile until it reaches the Nile Delta and the Mediterranean Sea. What sets this beautiful city apart from Cairo and Luxor, however, is that its buildings occupy only the East Bank and two islands in the river, with its barren West Bank’s dunes, literally, on the waters edge. The West Bank has only a handful, albeit supremely notable, structures including the Monastery of St Simeon, the Aga Khan Mausoleum and the Tombs of the Nobles. luxor is located roughly where the Western Desert and the Eastern Desert meet, and just north of the great expanse of water created by the luxor Dam known as Lake Nasser.',
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
                  itemCount: luxorurlImages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Ink.image(
                        image:
                            CachedNetworkImageProvider(luxorurlImages[index]),
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                      onTap: () {
                        openluxorGallery(index);
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

  void openluxorGallery(index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryWidget(
          urlImages: luxorurlImages,
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
