import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/components/navigation/discover.dart';
import 'package:project_fomo/frontend/components/navigation/friends.dart';
import 'package:project_fomo/frontend/components/navigation/my_events.dart';
import 'package:project_fomo/frontend/components/navigation/profile.dart';
import 'package:project_fomo/frontend/components/navigation/search.dart';
import 'package:project_fomo/style.dart';

class RootPage extends StatefulWidget {
  static const String pageRoute = '/root';

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            Discover(),
            Search(),
            Friends(),
            MyEvents(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColor.dp3,
        selectedItemColor: Colors.red,
        unselectedItemColor: AppTextColor.disabled,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text('Discover'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_outline,
              size: 30,
            ),
            title: Text('Friends'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event_note,
              size: 30,
            ),
            title: Text('Events'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 30,
            ),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
