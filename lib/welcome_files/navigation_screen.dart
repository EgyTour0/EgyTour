import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../mainFiles/Home_Screen.dart';
import '../map/map_screen.dart';
import '../mainFiles/notify_screen.dart';
import '../mainFiles/personal_sceen.dart';
import '../mainFiles/search_screen.dart';

class Navigationbar extends StatefulWidget {
  @override
  _NavigationbarState createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  //
  final _advancedDrawerController = AdvancedDrawerController();
  List TextforAppbar = [
    "Home Page",
    "Explore",
    "Create a Trip",
    "Notifications",
    "My Page",

  ];
  List pages = [
    homepage(),
    Searching(),
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
    return AdvancedDrawer(
      backdropColor: Color(0xff5181b8),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: true,
    child: Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            width: 60,
            child: GestureDetector(
              onTap: (){
              },
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"
                  )
              ),
            ),
          ),
        ],
        title:  Container(
            padding: EdgeInsets.only(right: 45),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(''+TextforAppbar[currentIndex],style: TextStyle(color: Color(0xffedeef0), fontSize: 30),),
            )),
        leading: IconButton(
          onPressed: _handleMenuButtonPressed,
          icon: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: _advancedDrawerController,
            builder: (_, value, __) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: Icon(
                  value.visible ? Icons.clear : Icons.menu,
                  key: ValueKey<bool>(value.visible),
                ),
              );
            },
          ),
        ),
        centerTitle:true,
        elevation: 0,
        backgroundColor: Color(0xff2a5885),
      ),
      body: pages[currentIndex],
      ///navigation bar
      bottomNavigationBar: CurvedNavigationBar(
        onTap: onTap,
        index: currentIndex,
        height: 60.0,
        color: Colors.white,
        buttonBackgroundColor: Color(0xFf2a5885).withOpacity(0.2),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 150),
        items: <Widget>[
          Icon(Icons.home, size: 30,color: Color(0xFf2a5885),),
          Icon(Icons.search, size: 30,color: Color(0xFf2a5885),),
          Icon(Icons.person_pin_circle_outlined, size: 30,color: Color(0xFf2a5885),),
          Icon(Icons.notifications, size: 30,color: Color(0xFf2a5885),),
          Icon(Icons.perm_identity, size: 30,color: Color(0xFf2a5885),),
        ],
      ),
    ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"
                      )
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite,color: Colors.red,),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings,color: Color(0xffedeef0),),
                  title: Text('Settings'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

