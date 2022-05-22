import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../mainFiles/notify_screen.dart';
import '../mainFiles/placesinfo.dart';
import '../mainFiles/socialhome.dart';
import '../map/map_screen.dart';
import '../modules/pesonalpage/personal_sceen.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({Key? key}) : super(key: key);

  @override
  _NavigationbarState createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  //
  final _advancedDrawerController = AdvancedDrawerController();
  List pages = [
    homepage(),
    placesinfo(),
    MapScreen(),
    Notifyme(),
    personal(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      ///navigation bar
      bottomNavigationBar: CurvedNavigationBar(
        onTap: onTap,
        index: currentIndex,
        height: 60.0,
        color: Colors.white,
        buttonBackgroundColor: const Color(0xFf2a5885).withOpacity(0.2),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 150),
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.person_pin_circle_outlined,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.notifications,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.perm_identity,
            size: 30,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
  );
}

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  /// Save isDarkMode to local storage
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
