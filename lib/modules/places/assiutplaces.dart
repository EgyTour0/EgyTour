import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../shared/components/components.dart';

class assiutplaces extends StatefulWidget {
  assiutplaces({Key? key}) : super(key: key);

  @override
  State<assiutplaces> createState() => _assiutplacesState();
}

final urlImages = [
  'https://upload.wikimedia.org/wikipedia/commons/4/4d/AsyutUniversityMainBldg.jpg',
  'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/ae/7e/8d/hotel-faced.jpg',
  'https://www.etltravel.com/wp-content/uploads/2020/07/asyut-egypt-005-1.jpg',
  'https://www.presidency.eg/media/88364/xaujtygdrm88c40ckgjpg.jpg',
  'https://d1b3667xvzs6rz.cloudfront.net/2018/09/5-1-1-the-Holy-Virgin-Mary-Monastery-in-Assiut.jpg',
];
final assiuturlImages = [
  'https://upload.wikimedia.org/wikipedia/commons/4/4d/AsyutUniversityMainBldg.jpg',
  'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/ae/7e/8d/hotel-faced.jpg',
  'https://www.etltravel.com/wp-content/uploads/2020/07/asyut-egypt-005-1.jpg',
  'https://www.presidency.eg/media/88364/xaujtygdrm88c40ckgjpg.jpg',
  'https://d1b3667xvzs6rz.cloudfront.net/2018/09/5-1-1-the-Holy-Virgin-Mary-Monastery-in-Assiut.jpg',
];

final desImages = [
  'https://media.gemini.media/img/Original/2020/12/31/2020_12_31_19_30_31_883.jpg',
  'https://s3.us-east-2.amazonaws.com/sie-development-production/images/images/000/000/552/original/12045207_10207847122954885_199287671640865188_o.jpg',
  'https://s3.us-east-2.amazonaws.com/sie-development-production/images/images/000/000/546/original/1.jpg',
  'https://s3.us-east-2.amazonaws.com/sie-development-production/images/images/000/001/328/original/panoramio-109885323.jpg',
  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/39/49/ab/meir-monumental-tombs.jpg',
  'https://s3.us-east-2.amazonaws.com/sie-development-production/images/images/000/001/873/original/2017-05-28.jpg',
];

List<LatLng> coords = [
  ///The Holy Virgin Mary Monastery
  LatLng(27.3819, 30.7775),

  ///Meir Monumental Tombs
  LatLng(27.408889, 30.710556),

  ///Deir Rifa Tombs
  LatLng(27.1, 31.175),

  ///Kornish Assiut
  LatLng(27.180134, 31.189283),

  ///Alksan
  LatLng(27.189115, 31.192068),
];

final fivePlaces = [
  'https://media.gemini.media/img/large/2021/4/30/2021_4_30_23_30_40_941.jpg',
  'https://images.akhbarelyom.com//images/images/medium/20201205201217892.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/DeirRifaTombs.jpg/1280px-DeirRifaTombs.jpg',
  'https://img.youm7.com/ArticleImgs/2020/4/20/137197--%D9%83%D9%88%D8%B1%D9%86%D9%8A%D8%B4-%D8%AA%D8%B1%D8%B9%D8%A9-%D8%A7%D9%84%D8%A5%D8%A8%D8%B1%D8%A7%D9%87%D9%8A%D9%85%D9%8A%D8%A9-%D8%A8%D8%A3%D8%B3%D9%8A%D9%88%D8%B7-%D8%A8%D9%84%D8%A7-%D9%85%D9%88%D8%A7%D8%B7%D9%86%D9%8A%D9%86-(5).jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/%D9%82%D8%B5%D8%B1_%D8%A3%D9%84%D9%83%D8%B3%D8%A7%D9%86_%D8%A8%D8%A7%D8%B4%D8%A7.jpg/1200px-%D9%82%D8%B5%D8%B1_%D8%A3%D9%84%D9%83%D8%B3%D8%A7%D9%86_%D8%A8%D8%A7%D8%B4%D8%A7.jpg',
];
List Names = [
  "The Holy Virgin Mary Monastery Moharaq",
  "Meir Monumental Tombs",
  "Deir Rifa Tombs",
  "Kornish Assiut",
  "Alksan Palace",
];

class _assiutplacesState extends State<assiutplaces> {
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
                    image: CachedNetworkImageProvider(urlImages[2]),
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
                    'Highlights in assiut',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Assiut Governorate is one of the governorates of Upper Egypt, located north of Sohag and south of Minya. Its capital, Assiut, mediates the governorates of Upper Egypt. Its name is derived from the Pharaonic word "Siot", meaning the guard. Assiut is located between two mountain hills, so its climate is continental and it is considered the commercial capital of Upper Egypt. It is famous for its ancient neighborhoods and mausoleums, especially in the cities of Assiut, Apotige and Sadfa.',
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
                  FivePlacesText(),
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
                  itemCount: urlImages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Ink.image(
                        image:
                            CachedNetworkImageProvider(assiuturlImages[index]),
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                      onTap: () {
                        openassiutGallery(index);
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

  void openassiutGallery(index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryWidget(
          urlImages: assiuturlImages,
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
