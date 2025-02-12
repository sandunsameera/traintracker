import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainfinder/content_screen/contribution_screen.dart';
import 'package:trainfinder/content_screen/notices_screen.dart';
import 'package:trainfinder/content_screen/notification_screen.dart';
import 'package:trainfinder/content_screen/search_screen.dart';

class Mainscreen extends StatefulWidget {
  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<TabItem> tabItems = List.of([
    new TabItem(FontAwesomeIcons.accessibleIcon, "Contribute", Colors.blue,
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(Icons.search, "Search", Colors.orange,
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    new TabItem(Icons.layers, "Notices", Colors.red),
    new TabItem(Icons.notifications, "Notifications", Colors.cyan),
  ]);

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Contribution(),
    SearchScreen(),
    NoticesScreen(),
    NotificationScreen(),
  ];

  static int selectedPos = 0;
  CircularBottomNavigationController _navigationController =
      new CircularBottomNavigationController(selectedPos);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        controller: _navigationController,
        selectedCallback: (int selectedPos) {
          setState(() {
            _selectedIndex = selectedPos;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
